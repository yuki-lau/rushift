<%@ page language="java" import="java.util.*, org.apache.commons.lang.StringUtils, java.text.DecimalFormat, cn.edu.zju.ccnt.model.*" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="<%=path %>/resources/js/custom.js"></script>
</head>

<body id="admin-services-body">
	<div id="body-wrapper">
  		<%@ include file="../frames/sidebar.jsp" %>
        
  		<div id="main-content">
    		<%@ include file="../frames/no-script-warning.html" %>
        
            <!-- 操作结果 -->
            <%
            	String result = request.getParameter("result");
            	if(!StringUtils.isEmpty(result)){
            		if(result.equals("true")){
            		%>
	            		<div class="notification success png_bg"> <a href="#" class="close"><img src="resources/img/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
	      					<div>操作成功！</div>
	    				</div>
            		<%
            		}
            		else if(result.equals("false")){
            		%>
	            		<div class="notification error png_bg"> <a href="#" class="close"><img src="resources/img/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
	      					<div>操作失败！</div>
	    				</div>
            		<%
            		}
            	}
            %>
            
            <form action="admin-services?action=list-services" method="get" class="form-inline" style="margin-bottom: 60px;">
            	<div class="pull-left">
	            	<label for="node-selector">Select Node：</label>
	            	<select id="node-selector">
	            		<option>====== All Nodes =====</option>
	            		<optgroup label="Proxy Server">
	            			<option value="192.168.1.101">192.168.1.101</option>
	            			<option value="192.168.1.102">192.168.1.102</option>
	            		</optgroup>
	            		<optgroup label="Account Server">
	            			<option value="192.168.1.101">192.168.1.101</option>
	            			<option value="192.168.1.102">192.168.1.102</option>
	            		</optgroup>
	            		<optgroup label="Container Server">
	            			<option value="192.168.1.101">192.168.1.101</option>
	            			<option value="192.168.1.102">192.168.1.102</option>
	            		</optgroup>
	            		<optgroup label="Object Server">
	            			<option value="192.168.1.101">192.168.1.101</option>
	            			<option value="192.168.1.102">192.168.1.102</option>
	            		</optgroup>
	            	</select>
            	
	            	<label for="service-selector">Select Service：</label>
	            	<select id="service-selector">
	            		<option>===== All Services ====</option>
	           			<option value="proxy-server">swift-proxy-server</option>
	           			<option value="account-server">swift-account-server</option>
	            		<option value="account-replicator">swift-account-replicator</option>
	            		<option value="account-auditor">swift-account-auditor</option>
	            		<option value="container-server">swift-container-server</option>
	            		<option value="container-replicator">swift-container-replicator</option>
	            		<option value="container-updater">swift-container-updater</option>
	            		<option value="container-auditor">swift-container-auditor</option>
	            		<option value="object-server">swift-object-server</option>
	            		<option value="object-replicator">swift-object-replicator</option>
	            		<option value="object-updater">swift-object-updater</option>
	            		<option value="object-auditor">swift-object-auditor</option>
	            	</select>
            	</div>
            	
            	<div class="pull-right">
            		<input type="submit" class="btn btn-info" value="Get Services State" />
            	</div>
            </form>
            <div class="clearfix"></div>
            
            <form action="admin-services" id="batch-action-form" method="post">
            	<input type="hidden" id="action-input" name="action" value="" />
            	<div class="pull-right" style="margin: 10px 20px 0 0">
	            	<a href="#" onclick="return submitBatchForm('batch-start');" class="btn btn-small btn-success">Start</a>
	            	<a href="#" onclick="return submitBatchForm('batch-restartre');" class="btn btn-small btn-success">Restart</a>
	            	<a href="#" onclick="return submitBatchForm('batch-reload');" class="btn btn-small btn-success">Reload</a>
	            	<a href="#" onclick="return submitBatchForm('batch-stop');" class="btn btn-small btn-danger">Stop</a>
	            	<a href="#" onclick="return submitBatchForm('batch-shutdown');" class="btn btn-small btn-danger">Shutdown</a>
				</div>
				<script type="text/javascript">
					function submitBatchForm(action){
						$('#action-input').val(action);
						$('#batch-action-form').submit();
						return false;
					}
					function checkall(obj){
      					var checkboxs = document.getElementsByName("process");
      					for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked = obj.checked;}
    				}
				</script>
	    		<div class="content-box">
	      			<!-- Start Content Box -->
	      			<div class="content-box-header">
	        			<h3>Swift Processors Summary</h3>
	        			<div class="clear"></div>
	      			</div>
	
	      			<div class="content-box-content">
	                    <table>
	                        <thead>
	                            <tr>
	                            	<th><input type="checkbox" value="0" onclick="checkall(this)" /></th>
	                                <th>Processor Name</th>
	                                <th>Avg. CPU Usage</th>
	                                <th>Avg. RAM Usage</th>
	                                <th>Start Time</th>
	                                <th>Status</th>
	                                <th class="last">Operation</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<%
	                        		List<ServiceStatus> runningServices = (List<ServiceStatus>)request.getAttribute("running_services");
	                        		Set<String> allServices = new HashSet<String>();
									allServices = new HashSet<String>();
									allServices.add("proxy-server");
									allServices.add("account-server");
									allServices.add("account-replicator");
									allServices.add("account-auditor");
									allServices.add("container-server");
									allServices.add("container-replicator");
									allServices.add("container-updater");
									allServices.add("container-auditor");
									allServices.add("object-server");
									allServices.add("object-replicator");
									allServices.add("object-updater");
									allServices.add("object-auditor");
	                        		
	                        		DecimalFormat twoPoint = new DecimalFormat("0.00");
	                        		for(int i = 0; i < runningServices.size(); i++){
	                        			ServiceStatus service = runningServices.get(i);
	                        			String cpuUsage = twoPoint.format(service.getCpuUsage());
	                        			String memUsage = twoPoint.format(service.getMemUsage());
	                        	%>
			                            <tr>
			                            	<td><input type="checkbox" name="process" value="<%=service.getCmdName() %>" /></td>
			                                <td><%=service.getCmdName() %></td>
			                                <td><div class="progress progress-green"><span style="width:<%=cpuUsage %>%"><b><%=cpuUsage %>%</b></span></div></td>
			                                <td><div class="progress progress-blue"><span style="width:<%=memUsage %>%"><b><%=memUsage %>%</b></span></div></td>
			                                <td><%=service.getStartTime() %></td>
			                                <td class="green"><%=service.getStatus() %></td>
			                                <td class="last">
								            	<a href="<%=path %>/admin-services?action=restart&service=<%=service.getCmdName() %>" class="btn btn-small btn-success">Restart</a>
								            	<a href="<%=path %>/admin-services?action=reload&service=<%=service.getCmdName() %>" class="btn btn-small btn-success">Reload</a>
								            	<a href="<%=path %>/admin-services?action=stop&service=<%=service.getCmdName() %>" class="btn btn-small btn-danger">Stop</a>
								            	<a href="<%=path %>/admin-services?action=shutdown&service=<%=service.getCmdName() %>" class="btn btn-small btn-danger">Shutdown</a>
			                                </td>
			                            </tr>
			                    <%
			                    		allServices.remove(service.getCmdName());
			                    	}
			                    	
			                    	for(String name: allServices){
			                    %>
			                    		<tr>
			                    			<td><input type="checkbox" name="process" value="<%=name %>" /></td>
			                                <td><%=name %></td>
			                                <td><div class="progress progress-green"><span style="width:0%"><b>0.00%</b></span></div></td>
			                                <td><div class="progress progress-blue"><span style="width:0%"><b>0.00%</b></span></div></td>
			                                <td></td>
			                                <td class="red">stop</td>
			                                <td class="last">
			                                	<a href="<%=path %>/admin-services?action=start&service=<%=name %>" class="btn btn-small btn-success">Start</a>
			                                </td>
			                            </tr>
								<%
			                    	}
			                    %>
	                        </tbody>
	                      </table>
	               		<div class="clear"></div>               
	      			</div>
	    		</div>
            </form>
            
            <%@ include file="../frames/footer.html" %>
  		</div>
        
	</div>
</body>
</html>
