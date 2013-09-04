'''
Created on 2013-9-2

@author: yuki
@note: This middleware is used to receive client request, and run admin command according to it.
       Then return the result to client.
'''
import os
import commands
import json

from swift.common.utils import split_path
from swift.common.swob import Response, Request

class RunCmdMiddleware(object):
    '''
    Middleware gets the /runcmd/ requests and process it.
    '''
    
    def __init__(self, app, conf):
        
        ''' app is the next application '''
        self.app = app
        
        self.swift_dir = conf.get('swift_dir', '/etc/swift')
        self.account_ring_path = os.path.join(self.swift_dir, 'account.ring.gz')
        self.container_ring_path = os.path.join(self.swift_dir, 'container.ring.gz')
        self.object_ring_path = os.path.join(self.swift_dir, 'object.ring.gz')
        self.account_buider_file = "account.builder"
        self.container_builder_file = "container.builder"
        self.object_buider_file = "obeject.builder"
        self.rings = [self.account_ring_path, self.container_ring_path, self.object_ring_path]
        
        self.ERROR = 'error'
        self.OK = 'ok'    


    def dispersion_populate(self):
        ''' 
        run swift-dispersion-populate command 
        '''
        return [self.OK, commands.getoutput("swift-dispersion-populate")]

    
    def dispersion_report(self):
        ''' 
        run swift-dispersion-report command 
        '''
        return [self.OK, commands.getoutput("swift-dispersion-report")]


    def ring_builder(self, req):
        '''
        run swift-ring-builder command
        '''
        all_types = ['account', 'container', 'object']
        all_actions = ['add', 'create', 'rebalance', 'set_replicas', 'set_min_part_hours', 
                       'remove', 'search', 'set_info', 'set_weight']
        root, rcheck, rtype =  split_path(req.path, 1, 3, True)
        action = req.params.get('action')
        
        if rtype not in all_types:
            return [self.ERROR, 'invalid type of builder file: ' + rtype]
        
        if action is not None:
            if action not in all_actions:
                return [self.ERROR, 'invalid action: ' + action]
            elif action == 'rebalance':
                return [self.OK, commands.getoutput('swift-ring-builder %s/%s.builder %s' 
                                                    % (self.swift_dir, rtype, action))]
            else:
                param_str = req.params.get('param_str')
                if param_str is None:
                    return [self.ERROR, 'param_str can not be None!']
                
                return [self.OK, commands.getoutput('swift-ring-builder %s/%s.builder %s %s' 
                                                    % (self.swift_dir, rtype, action, param_str))]
        else:
            return [self.OK, commands.getoutput('swift-ring-builder %s/%s.builder' 
                                             % (self.swift_dir, rtype))]
            
            
    def services(self, req):
        '''
        run swift-init command, can not stop proxy, for that it receives requests
        '''
        all_actions = ['start', 'stop', 'restart', 'reload', 'shutdown']
        all_services = ['account-server', 'account-replicator', 'account-auditor',
                        'container-server', 'container-replicator', 'container-updater', 'container-auditor',
                        'object-server', 'object-replicator', 'object-updater', 'object-auditor']
        action = req.params.get('action')
        service = req.params.get('service')
        
        if (action is None) or (action not in all_actions):
            return [self.ERROR, 'param action required, or invalid action: ' + action]
        elif (service is None) or (service not in all_services):
            return [self.ERROR, 'param service required or invalid service: ' + service]
        else:
            return [self.OK, commands.getoutput("swift-init %s %s" % (service, action))]
    
    
    def get_nodes(self, req):
        '''
        run swift-get-nodes command
        '''
        all_types = ['account', 'container', 'object']
        root, rcheck, rtype =  split_path(req.path, 1, 3, True)
        
        if rtype not in all_types:
            return [self.ERROR, 'invalid type of ring file: ' + rtype]
        
        param_str = req.params.get('param_str')
        if param_str is not None:
            return [self.OK, commands.getoutput("swift-get-nodes %s/%s.ring.gz %s" 
                                                % (self.swift_dir, rtype, param_str))]
        else:
            return [self.ERROR, 'param_str can not be None!']
        
    
    def get_object_info(self, req):
        '''
        run swift-object-info command
        '''
        path = req.params.get('path')
        if path is not None:
            return [self.OK, commands.getoutput("swift-object-info %s" % path)]
        else:
            return [self.ERROR, 'path can not be None!']
        
    def account_audit(self, req):
        '''
        run swift-account-audit command
        '''
        account = req.params.get('account')
        if account is not None:
            return [self.OK, commands.getoutput("swift-account-audit %s" % account)]
        else:
            return [self.ERROR, 'account can not be None!']
        
    
    def HANDLER(self,req):
        ''' 
        main handler 
        ''' 
        root, rcheck, rtype =  split_path(req.path, 1, 3, True)
        all_rtypes = ['account', 'container', 'object']

        # call method
        if rcheck == "dispersion-populate":         # failed
            content = self.dispersion_populate()
            
        elif rcheck == "dispersion-report":         # failed
            content = self.dispersion_report()
            
        elif rcheck == "ring-builder":              # success
            content = self.ring_builder(req)
            
        elif rcheck == "services":                  # success
            content = self.services(req)
            
        elif rcheck == "get-nodes":                 # success
            content = self.get_nodes(req)
            
        elif rcheck == "object-info":               # success
            content = self.get_object_info(req)
            
        elif rcheck == "account-audit":             # success
            content = self.account_audit(req)
            
        else:
            content_str = "Invalid path: %s" % req.path
            return Response(request=req, status="404 Not Found",
                            body=content_str, content_type="text/plain")

        # create response
        if content[0] == self.OK:
            return Response(request=req, status="200 OK", 
                            body=content[1], content_type="text/plain")
        else:
            return Response(request=req, status="400 Bad Request",
                            body=content[1], content_type="text/plain")
        

    def __call__(self, env, start_response):
        ''' 
        RunCmdMiddleware is a WSGI callable object 
        '''
        req = Request(env)

        if req.path.startswith('/runcmd/'):
            return self.HANDLER(req)(env, start_response)
        else:
            return self.app(env, start_response)



def filter_factory(global_conf, **local_conf):
    conf = global_conf.copy()
    conf.update(local_conf)

    def run_cmd_filter(app):
        return RunCmdMiddleware(app, conf)
    
    return run_cmd_filter
