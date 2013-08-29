<%@ page language="java" import="java.util.*, org.apache.commons.lang.StringUtils, cn.edu.zju.ccnt.model.*, cn.edu.zju.ccnt.constant.*" pageEncoding="UTF-8"%>
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
			$('#device-table').dataTable();
		});
	</script>
</head>

<body id="admin-rings-body">
	<div id="body-wrapper">
  		<%@ include file="../frames/sidebar.jsp" %>
        
  		<div id="main-content">
    		<%@ include file="../frames/no-script-warning.html" %>
			
			<!-- 处理响应信息 -->
			<%
				if(request.getAttribute("result") != null){
					String result = (String)request.getAttribute("result");
					if(result.equals("ok")){%>
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<p><b>SUCCESS!</b> <%=request.getAttribute("message") %></p>
					</div>
					<%}
					else if(result.equals("error")){%>
					<div class="alert alert-error">
						<a href="#" class="close" data-dismiss="alert">&times;</a>
						<p><b>ERROR!</b> <%=request.getAttribute("message") %></p>
					</div>
					<%}
					request.removeAttribute("result");
					request.removeAttribute("error");
				}
			%>
			
            <!-- Page Head -->
            <div>
                <ul class="shortcut-buttons-set">
                	<li>
                		<a class="shortcut-button" href="#add-device" role="button" data-toggle="modal">
	                		<span>
	                			<img src="<%=path %>/resources/img/icons/server-add.png" alt="icon" /><br />
	                        	Add Devices
	                       	</span>
                       	</a>
                  	</li>
                  	<li>
                  		<a class="shortcut-button" href="#create-rings" role="button" data-toggle="modal">
                  			<span> 
                  				<img src="<%=path %>/resources/img/icons/server-create.png" alt="icon" /><br />
                        		Create Rings
                        	</span>
                       	</a>
                   	</li>
                    <li>
                    	<a class="shortcut-button" href="#set-ring-info" role="button" data-toggle="modal">
                    		<span>
                    			<img src="<%=path %>/resources/img/icons/server-edit.png" alt="icon" /><br />
                        		Set Ring Info
                        	</span>
                     	</a>
                   	</li>
                    <li>
                    	<a class="shortcut-button" href="#rebalance" role="button" data-toggle="modal">
                    		<span> 
                    			<img src="<%=path %>/resources/img/icons/server-refresh.png" alt="icon" /><br />
                        		Rebalance
                        	</span>
                       	</a>
                 	</li>
                </ul>
                <div class="clear"></div>
            </div>
            
            <div class="content-box">
      			<!-- Start Content Box -->
      			<div class="content-box-header">
        			<h3>Device List</h3>
        			<div class="clear"></div>
      			</div>

      			<div class="content-box-content">
                    <div class="tab-content default-tab">
                        <table class="display" id="device-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Server</th>
                                    <th>Zone</th>
                                    <th style="width:95px !important">IP Address</th>
                                    <th>Port</th>
                                    <th>Name</th>
                                    <th>Weight</th>
                                    <th>Partitions</th>
                                    <th>Balance</th>
                                    <th style="width:100px !important">Meta</th>
                                    <th style="width:130px !important">Operation</th>
                                </tr>
                            </thead>
                            <tbody>
                           	<%
                           		if(request.getAttribute("deviceList") != null){
                           			List<Device> deviceList = (List<Device>)request.getAttribute("deviceList");
                           			for(Device device: deviceList){
                           	%>
                                <tr>
                                    <td class="d-id"><%=device.getDeviceID() %></td>
                                    <td class="d-type"><%=device.getServerType() %></td>
                                    <td class="d-zone"><%=device.getZoneID() %></td>
                                    <td class="d-ip"><%=device.getIPAddress() %></td>
                                    <td class="d-port"><%=device.getPort() %></td>
                                    <td class="d-name"><%=device.getDeviceName() %></td>
                                    <td class="d-weight"><%=device.getWeight() %></td>
                                    <td class="d-part"><%=device.getPartitions() %></td>
                                    <td class="d-balance"><%=device.getBalance() %></td>
                                    <td class="d-meta"><%=device.getMeta() %></td>
                                    <td class="d-action">
                                    	<a class="btn btn-small btn-success edit-device" href="#edit-device" role="button" data-toggle="modal">Edit</a>
                                    	<a class="btn btn-small btn-danger del-device" href="#">Remove</a>
                                    </td>
                                </tr>
                            <%
                            		}
                            	} 
                            %>
                            </tbody>
                        </table>
                    	<div class="clear"></div>
                    </div>
                </div>
    		</div>
    		
            <%@ include file="../frames/footer.html" %>
  		</div>
	</div>
	
	<!-- popup window -->
	<div id="add-device" class="modal hide fade" role="dialog" >
		<form class="form-horizontal" action="admin-rings?action=add-device" method="post">
		  	<div class="modal-header">
		  		<button class="modal-close" data-dismiss="modal" aria-hidden="true">×</button>
		  		<h3>Add Device</h3>
		  	</div>
		  	<div class="modal-body">
			  	<div class="control-group">
			    	<label class="control-label" for="ring-type">Ring Type</label>
			    	<div class="controls">
			      		<select id="ring-type" name="ring-type">
							<option value="1">Account-Ring</option>
							<option value="2">Container-Ring</option>
							<option value="3">Object-Ring</option>
						</select>
			    	</div>
			  	</div>
			  	<div class="control-group">
			    	<label class="control-label" for="zone">Zone</label>
		    		<div class="controls">
		      			<input type="text" id="zone" name="zone" />
		    		</div>
		  		</div>
			  	<div class="control-group">
			    	<label class="control-label" for="ip">IP Address</label>
		    		<div class="controls">
		      			<input type="text" id="ip" name="ip" />
		    		</div>
		  		</div>
			  	<div class="control-group">
			    	<label class="control-label" for="port">Port</label>
		    		<div class="controls">
		      			<input type="text" id="port" name="port" />
		    		</div>
		  		</div>
				<div class="control-group">
			    	<label class="control-label" for="device-name">Device Name</label>
		    		<div class="controls">
		      			<input type="text" id="device-name" name="device-name"/>
		    		</div>
		  		</div>
				<div class="control-group">
			    	<label class="control-label" for="meta">Meta</label>
		    		<div class="controls">
		      			<input type="text" id="meta" name="meta"/>
		    		</div>
		  		</div>
				<div class="control-group">
			    	<label class="control-label" for="weight">Weight</label>
		    		<div class="controls">
		      			<input type="text" id="weight" name="weight" />
		    		</div>
		  		</div>
		  	</div>
		  	<div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <input type="submit" class="btn btn-primary" value="Add This Device" />
		  	</div>
	  	</form>
	</div>

	<div id="create-rings" class="modal hide fade" role="dialog" >
		<form class="form-horizontal" action="admin-rings?action=create-rings" method="post">
		  	<div class="modal-header">
		    	<button class="modal-close" data-dismiss="modal" aria-hidden="true">×</button>
		    	<h3>Create Rings</h3>
		  	</div>
		  	<div class="modal-body">
	    		<div class="control-group">
					<label class="control-label" for="ring-type">Ring Type</label>
					<div class="controls">
						<select id="ring-type" name="ring-type">
							<option value="1">Account-Ring</option>
							<option value="2">Container-Ring</option>
							<option value="3">Object-Ring</option>
						</select>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="part-power">Partition Power</label>
					<div class="controls">
						<input id="part-power" name="part-power" type="text" />
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="replicas">Replicas</label>
					<div class="controls">
						<input id="replicas" name="replicas" type="text" />
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="min-part-hours">Minimum Partition Hours</label>
					<div class="controls">
						<input id="min-part-hours" name="min-part-hours" type="text" />
					</div>
				</div>
		  	</div>
		  	<div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <input type="submit" class="btn btn-primary" value="Create" />
		  	</div>
		</form>
	</div>

	<div id="set-ring-info" class="modal hide fade" role="dialog" >
		<form class="form-horizontal" action="admin-rings?action=set-ring-info" method="post">
		  	<div class="modal-header">
		    	<button class="modal-close" data-dismiss="modal" aria-hidden="true">×</button>
		    	<h3>Set Ring Information</h3>
		  	</div>
		  	<div class="modal-body">
				<div class="control-group">
					<label class="control-label" for="ring-type">Ring Type</label>
					<div class="controls">
						<select id="ring-type" name="ring-type">
							<option value="1">Account-Ring</option>
							<option value="2">Container-Ring</option>
							<option value="3">Object-Ring</option>
						</select>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="replicas">Replicas</label>
					<div class="controls">
						<input id="replicas" name="replicas" type="text" />
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="min-part-hours">Minimum Partition Hours</label>
					<div class="controls">
						<input id="min-part-hours" name="min-part-hours" type="text" />
					</div>
				</div>
		  	</div>
		  	<div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <input type="submit" class="btn btn-primary" value="Save Changes" />
		  	</div>
		</form>
	</div>

	<div id="rebalance" class="modal hide fade" role="dialog" >
		<form class="form-horizontal" action="admin-rings?action=rebalance" method="post">
		  	<div class="modal-header">
		    	<button class="modal-close" data-dismiss="modal" aria-hidden="true">×</button>
		    	<h3>Rebalance Ring</h3>
		  	</div>
		  	<div class="modal-body">
	    		<div class="control-group">
					<label class="checkbox">
			        	<input type="checkbox" name="ring[]" value="1" /> Account Ring
			      	</label>
			      	<label class="checkbox">
			        	<input type="checkbox" name="ring[]" value="2" /> Contaienr Ring
			      	</label>
			      	<label class="checkbox">
			        	<input type="checkbox" name="ring[]" value="3" /> Object Ring
			      	</label>
			   </div>
		  	</div>
		  	<div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <input type="submit" class="btn btn-primary" value="Rebalance" />
		  	</div>
		</form>
	</div>
	
    <div id="edit-device" class="modal hide fade" role="dialog" >
    	<form class="form-horizontal" action="admin-rings?action=set-device-info" method="post">
    		<input type="hidden" id="search-str" name="search-str" value="" />
		  	<div class="modal-header">
		    	<button class="modal-close" data-dismiss="modal" aria-hidden="true">×</button>
		    	<h3>Edit Device</h3>
		  	</div>
		  	<div class="modal-body">
			  	<div class="control-group">
			    	<label class="control-label" for="ring-type">Ring Type</label>
			    	<div class="controls">
			      		<select id="ring-type" name="ring-type">
			      			<option disabled="disabled" value="0">SAIO</option>
							<option disabled="disabled" value="1">Account-Ring</option>
							<option disabled="disabled" value="2">Container-Ring</option>
							<option disabled="disabled" value="3">Object-Ring</option>
						</select>
			    	</div>
			  	</div>
			  	<div class="control-group">
			    	<label class="control-label" for="ip">IP Address</label>
		    		<div class="controls">
		      			<input type="text" id="ip" name="ip" />
		    		</div>
		  		</div>
			  	<div class="control-group">
			    	<label class="control-label" for="port">Port</label>
		    		<div class="controls">
		      			<input type="text" id="port" name="port"/>
		    		</div>
		  		</div>
				<div class="control-group">
			    	<label class="control-label" for="device-name">Device Name</label>
		    		<div class="controls">
		      			<input type="text" id="device-name" name="device-name"/>
		    		</div>
		  		</div>
				<div class="control-group">
			    	<label class="control-label" for="meta">Meta</label>
		    		<div class="controls">
		      			<input type="text" id="meta" name="meta"/>
		    		</div>
		  		</div>
				<div class="control-group">
			    	<label class="control-label" for="weight">Weight</label>
		    		<div class="controls">
		      			<input type="text" id="weight" name="weight"/>
		    		</div>
		  		</div>	
		  	</div>
		  	<div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <input type="submit" class="btn btn-primary" value="Save changes" />
		  	</div>
		</form>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('td.d-action').each(function(){
				var td = $(this);
				var searchStr = "d" + td.siblings(".d-id").html()
							  + "z" + td.siblings(".d-zone").html()
							  + "-" + td.siblings(".d-ip").html()
							  + ":" + td.siblings(".d-port").html()
							  + "/" + td.siblings(".d-name").html();
							  
				td.find('a.del-device').attr("href", "admin-rings?action=delete-device&search-str=" + searchStr);		  
				
				td.find('a.edit-device').click(function(){
					$("#edit-device #search-str").val(searchStr);
					
					var type = td.siblings(".d-type").html();
					if(type == "account")
						$("#edit-device #ring-type").val("1");
					else if(type == "container")
						$("#edit-device #ring-type").val("2");
					else if(type == "object")
						$("#edit-device #ring-type").val("3");
					else
						$("#edit-device #ring-type").val("0");
					
					$("#edit-device #ip").val(td.siblings(".d-ip").html());
					$("#edit-device #port").val(td.siblings(".d-port").html());
					$("#edit-device #device-name").val(td.siblings(".d-name").html());
					$("#edit-device #weight").val(td.siblings(".d-weight").html());
					$("#edit-device #meta").val(td.siblings(".d-meta").html());
				});
				
				
			});
		});
	</script>
</body>
</html>

