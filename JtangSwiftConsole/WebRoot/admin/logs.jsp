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
    <script type="text/javascript" src="<%=path %>/resources/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			/* datatable */
			$('#hourly-table').dataTable();
			$('#proxy-table').dataTable();
			$('#container-table').dataTable();
			$('#object-table').dataTable();
			$('#kern-table').dataTable();
		});
	</script>
</head>

<body id="admin-logs-body">
	<div id="body-wrapper">
  		<%@ include file="../frames/sidebar.jsp" %>
        
  		<div id="main-content">
    		<%@ include file="../frames/no-script-warning.html" %>
        
            <!-- Page Head -->            
    		<div class="content-box">
      			<!-- Start Content Box -->
      			<div class="content-box-header">
        			<h3>Swift Logs</h3>
        			<ul class="content-box-tabs">
          				<li><a href="#tab1" class="default-tab">Recent One Hour</a></li>
						<li><a href="#tab2">Proxy</a></li>
                        <li><a href="#tab3">Container</a></li>
                        <li><a href="#tab4">Object</a></li>
                        <li><a href="#tab5"><b>Kern(drive)</b></a></li>
        			</ul>
        			<div class="clear"></div>
      			</div>

      			<div class="content-box-content">
                    <div class="tab-content default-tab" id="tab1">
                        <table class="display" id="hourly-table">
                            <thead>
                                <tr>
                                    <th class="w110">Log Type</th>
                                    <th>Event</th>
                                    <th class="w140">Module Code</th>
                                    <th class="w120">Server Node</th>
                                    <th class="w120">Server Type</th>
                                    <th class="w140">Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr class="error">
                                    <td class="center w110">ERROR</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="center w120">Object Server</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                            </tbody>
                        </table>
                    	<div class="clear"></div>
                    </div>
                
                    <div class="tab-content" id="tab2">
                        <table class="display" id="proxy-table">
                            <thead>
                                <tr>
                                    <th>Log Type</th>
                                    <th>Event</th>
                                    <th>Module Code</th>
                                    <th>Server Node</th>
                                    <th>Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr class="error">
                                    <td class="center w110">ERROR</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr class="error">
                                    <td class="center w110">ERROR</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                            </tbody>
                        </table>
                    	<div class="clear"></div>
                    </div>
                
                	<div class="tab-content" id="tab3">
                        <table class="display" id="container-table">
                            <thead>
                                <tr>
                                    <th>Log Type</th>
                                    <th>Event</th>
                                    <th>Module Code</th>
                                    <th>Server Node</th>
                                    <th>Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr class="error">
                                    <td class="center w110">ERROR</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr class="error">
                                    <td class="center w110">ERROR</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="clear"></div>
                    </div>
                    
                    <div class="tab-content" id="tab4">
                        <table class="display" id="object-table">
                            <thead>
                                <tr>
                                    <th>Log Type</th>
                                    <th>Event</th>
                                    <th>Module Code</th>
                                    <th>Server Node</th>
                                    <th>Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr class="error">
                                    <td class="center w110">ERROR</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr class="error">
                                    <td class="center w110">ERROR</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="clear"></div>
                    </div>
           			
           			<div class="tab-content" id="tab5">
                        <table class="display" id="kern-table">
                            <thead>
                                <tr>
                                    <th>Log Type</th>
                                    <th>Event</th>
                                    <th>Module Code</th>
                                    <th>Server Node</th>
                                    <th>Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr class="error">
                                    <td class="center w110">ERROR</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr class="error">
                                    <td class="center w110">ERROR</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                                <tr>
                                    <td class="center w110">INFO</td>
                                    <td>Starting object replicator in daemon mode.</td>
                                    <td class="center w140">object-replicator</td>
                                    <td class="center w120">fs-OptiPlex-390</td>
                                    <td class="w140">Jul 10 17:45:22</td>
                                </tr>
                            </tbody>
                        </table>
                    	<div class="clear"></div>
                    </div>
                    
                </div>
    		</div>
            
   		 	<%@ include file="../frames/footer.html" %>
  		</div>
        
	</div>
</body>
</html>
