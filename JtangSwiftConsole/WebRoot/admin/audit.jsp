<%@ page language="java" import="java.util.*, cn.edu.zju.ccnt.constant.*" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Swift Console</title>
    
  	<link rel="stylesheet" href="<%=path %>/resources/css/reset.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="<%=path %>/resources/css/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="<%=path %>/resources/css/invalid.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="<%=path %>/resources/css/bootstrap.min.css" type="text/css" media="screen" />
    <script type="text/javascript" src="<%=path %>/resources/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/js/simpla.jquery.configuration.js"></script>
</head>

<body id="admin-audit-body">
	<div id="body-wrapper">
  		<%@ include file="../frames/sidebar.jsp" %>
        
  		<div id="main-content">
    		<%@ include file="../frames/no-script-warning.html" %>
        
            <!-- Page Head -->  
            <div>
                <ul class="shortcut-buttons-set">
                	<li>
                		<a class="shortcut-button" href="#get-nodes" role="button" data-toggle="modal">
	                		<span>
	                			<img src="<%=path %>/resources/img/icons/server-info.png" alt="icon" /><br />
	                        	Get Nodes
	                       	</span>
                       	</a>
                  	</li>
                  	<li>
                  		<a class="shortcut-button" href="#object-info" role="button" data-toggle="modal">
                  			<span> 
                  				<img src="<%=path %>/resources/img/icons/server-health.png" alt="icon" /><br />
                        		Object Info
                        	</span>
                       	</a>
                   	</li>
                   	<li>
                  		<a class="shortcut-button" href="#account-audit" role="button" data-toggle="modal">
                  			<span> 
                  				<img src="<%=path %>/resources/img/icons/server-run.png" alt="icon" /><br />
                        		Account Audit
                        	</span>
                       	</a>
                   	</li>
                	<li>
                		<a class="shortcut-button" href="#drive-audit" role="button" data-toggle="modal">
	                		<span>
	                			<img src="<%=path %>/resources/img/icons/server-run.png" alt="icon" /><br />
	                        	Drive Audit
	                       	</span>
                       	</a>
                  	</li>
                </ul>
                </ul>
                <div class="clear"></div>
            </div>   
                   
    		<div class="content-box">
      			<div class="content-box-header">
        			<h3>Search Result</h3>
        			<div class="clear"></div>
      			</div>
				
      			<div class="content-box-content">
                    <div class="tab-content default-tab">
                    	<% 
                    	if(request.getAttribute("search-result") != null){ 
							out.println((String)request.getAttribute("search-result"));
							request.removeAttribute("search-result");
					   	} 
					   	else { %>
							<p><b>您还未执行任何审计命令.</b></p>
							<p>当您执行以上命令后，审计查询结果将会被显示在这里...</p>
						<% 	
						} %>
                    	<div class="clear"></div>
                    </div>
                </div>
          	</div>
  		</div>
	</div>

	<!-- popup window -->
	<div id="get-nodes" class="modal hide fade" role="dialog" >
		<form class="form-horizontal" action="admin-audit?action=get-nodes" method="post">
		  	<div class="modal-header">
		  		<button class="modal-close" data-dismiss="modal" aria-hidden="true">×</button>
		    	<h3>Get Nodes</h3>
		  	</div>
		  	<div class="modal-body">
				<div class="control-group">
			    	<label class="control-label" for="ring-type">Ring Type</label>
			    	<div class="controls">
			      		<select id="ring-type" name="ring-type">
							<option value="<%=RingType.ACCOUNT %>">Account-Ring</option>
							<option value="<%=RingType.CONTAINER %>">Container-Ring</option>
							<option value="<%=RingType.OBJECT %>">Object-Ring</option>
						</select>
			    	</div>
			  	</div>
				<div class="control-group">
			    	<label class="control-label" for="account">Account</label>
		    		<div class="controls">
		      			<input type="text" id="account" name="account" />
		    		</div>
		  		</div>
				<div class="control-group">
			    	<label class="control-label" for="container">Container</label>
		    		<div class="controls">
		      			<input type="text" id="container" name="container" />
		    		</div>
		  		</div>
		  		<div class="control-group">
			    	<label class="control-label" for="object">Object</label>
		    		<div class="controls">
		      			<input type="text" id="object" name="object" />
		    		</div>
		  		</div>
		  	</div>
		  	<div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <input type="submit" class="btn btn-primary" value="Get Nodes of It" />
		  	</div>
	  	</form>
	</div>
	
	<div id="object-info" class="modal hide fade" role="dialog" >
		<form class="form-horizontal" action="admin-audit?action=object-info" method="post">
		  	<div class="modal-header">
		  		<button class="modal-close" data-dismiss="modal" aria-hidden="true">×</button>
		    	<h3>Get Object Information</h3>
		  	</div>
		  	<div class="modal-body">
		  		<div class="control-group">
			    	<label class="control-label" for="ip">IP Address</label>
		    		<div class="controls">
		      			<input type="text" id="ip" name="ip" />
		    		</div>
		  		</div>
				<div class="control-group">
			    	<label class="control-label" for="path">Disk Path of Object File</label>
		    		<div class="controls">
		      			<input type="text" id="path" name="path" />
		    		</div>
		  		</div>
		  	</div>
		  	<div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <input type="submit" class="btn btn-primary" value="Get Detail of It" />
		  	</div>
		</form>
	</div>
	
	<div id="account-audit" class="modal hide fade" role="dialog" >
	  	<form class="form-horizontal" action="admin-audit?action=account-audit" method="post">
		  	<div class="modal-header">
		  		<button class="modal-close" data-dismiss="modal" aria-hidden="true">×</button>
	    		<h3>Audit Account</h3>
	  		</div>
	  		<div class="modal-body">
	  			<div class="control-group">
			    	<label class="control-label" for="account">Account</label>
		    		<div class="controls">
		      			<input type="text" id="account" name="account" />
		    		</div>
		  		</div>
		  	</div>
		  	<div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <input type="submit" class="btn btn-primary" value="Audit Account" />
		  	</div>
		</form>
	</div>
	
	<div id="drive-audit" class="modal hide fade" role="dialog" >
	  	<form class="form-horizontal" action="admin-audit?action=drive-audit" method="post">
		  	<div class="modal-header">
		  		<button class="modal-close" data-dismiss="modal" aria-hidden="true">×</button>
	    		<h3>Audit Drive and Handle Failure</h3>
		  	</div>
		  	<div class="modal-body">
		  		<div class="control-group">
			    	<label class="control-label" for="log-addr">Log Address</label>
		    		<div class="controls">
		      			<input type="text" id="log-addr" name="log-addr" />
		    		</div>
		  		</div>
				<div class="control-group">
			    	<label class="control-label" for="minutes">Minutes</label>
		    		<div class="controls">
		      			<input type="text" id="minutes" name="minutes" />
		    		</div>
		  		</div>

				<div class="control-group">
			    	<label class="control-label" for="err-limit">Error Limit</label>
		    		<div class="controls">
		      			<input type="text" id="err-limit" name="err-limit" />
		    		</div>
		  		</div>

				<div class="control-group">
			    	<label class="control-label" for="log-pattern">Log File Pattern</label>
		    		<div class="controls">
		      			<input type="text" id="log-pattern" name="log-pattern" />
		    		</div>
		  		</div>

				<div class="control-group">
			    	<label class="control-label" for="regex">Regex Pattern</label>
		    		<div class="controls">
		      			<input type="text" id="regex" name="regex" />
		    		</div>
		  		</div>

				<div class="control-group">
			    	<label class="control-label">Status: Running</label>
		    		<div class="controls">
		      			<a href="#" class="btn btn-small btn-success">Start</a>
		            	<a href="#" class="btn btn-small btn-success">Restart</a>
		            	<a href="#" class="btn btn-small btn-success">Reload</a>
		            	<a href="#" class="btn btn-small btn-danger">Stop</a>
		            	<a href="#" class="btn btn-small btn-danger">Shutdown</a>
		    		</div>
		  		</div>
		  	</div>
		  	<div class="modal-footer">
		  		<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <input type="submit" class="btn btn-primary" value="Audit Drive and Handle" />
		  	</div>
	  	</form>
	</div>
</body>
</html>
