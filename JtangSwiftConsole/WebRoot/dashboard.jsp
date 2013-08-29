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
    <script type="text/javascript" src="<%=path %>/resources/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/js/simpla.jquery.configuration.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/js/custom.js"></script>
</head>

<body id="dashboard-body">
	<div id="body-wrapper">
  		<%@ include file="frames/sidebar.jsp" %>
        
  		<div id="main-content">
  			<%@ include file="frames/no-script-warning.html" %>
  			
            <!-- Page Head -->
            <div class="notification attention png_bg" style="display: none;"> 
            	<a href="#" class="close"><img src="<%=path %>/resources/img/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
      			<div> Attention notification. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, sapien quis fermentum luctus, libero. </div>
    		</div>
            
            <p id="page-intro">What would you like to do? You may also <a href="#">custom</a> your own quick links.</p>
            <ul class="shortcut-buttons-set">
                <li><a class="shortcut-button" href="#"><span> <img src="<%=path %>/resources/img/icons/server-info.png" alt="icon" /><br />
                    View Cluster </span></a></li>
                <li><a class="shortcut-button" href="#"><span> <img src="<%=path %>/resources/img/icons/account.png" alt="icon" /><br />
                    Add an Account </span></a></li>
                <li><a class="shortcut-button" href="#"><span> <img src="<%=path %>/resources/img/icons/qps_chart.png" alt="icon" /><br />
                    View QPS Chart </span></a></li>
                <li><a class="shortcut-button" href="#"><span> <img src="<%=path %>/resources/img/icons/clock_48.png" alt="icon" /><br />
                    Add an Event </span></a></li>
                <li><a class="shortcut-button" href="#messages" rel="modal"><span> <img src="<%=path %>/resources/img/icons/comment_48.png" alt="icon" /><br />
                    View Messages </span></a></li>
                <li><a class="shortcut-button" href="#messages" rel="modal"><span> <img src="<%=path %>/resources/img/icons/error_log.png" alt="icon" /><br />
                    Error Logs </span></a></li>
            </ul>

    		<div class="clear"></div>

    		<div class="content-box">
      			<!-- Start Content Box -->
      			<div class="content-box-header">
        			<h3>Swift Cluster Summary</h3>
        			<ul class="content-box-tabs">
          				<li><a href="#tab1" class="default-tab">Node Informartion</a></li>
						<li><a href="#tab2">Load Overview</a></li>
        			</ul>
        			<div class="clear"></div>
      			</div>

      			<div class="content-box-content">
                	<!-- tab1 -->
        			<div class="tab-content default-tab" id="tab1">
                        <table>
                            <thead>
                              	<tr>
                                    <th>Server Node</th>
                                    <th>CPU Usage</th>
                                    <th>RAM Usage</th>
                                    <th>Disk Usage</th>
                                    <th>Status</th>
                                    <th>Manipulation</th>
                              	</tr>
                            </thead>
                            <tfoot>
                              	<tr>
                                	<td colspan="6">
                                  		<div class="pagination"> 
                                        	<a href="#" title="First Page">&laquo; First</a>
                                            <a href="#" title="Previous Page">&laquo; Previous</a>
                                            <a href="#" class="number current" title="1">1</a> 
                                            <a href="#" class="number" title="2">2</a> 
                                            <a href="#" class="number" title="3">3</a> 
                                            <a href="#" class="number" title="4">4</a> 
                                            <a href="#" title="Next Page">Next &raquo;</a>
                                            <a href="#" title="Last Page">Last &raquo;</a> 
                                    	</div>
                                  		<div class="clear"></div>
                                	</td>
                              	</tr>
                            </tfoot>
                            <tbody>
                              	<tr>
                                	<td>192.168.3.101</td>
                                	<td><div class="progress progress-green"><span style="width:12.3%"><b>12.3%</b></span></div></td>
                                	<td><div class="progress progress-blue"><span style="width:67.9%"><b>67.9%</b></span></div></td>
                                	<td><div class="progress progress-red"><span style="width:33.3%"><b>33.3%</b></span></div></td>
                                    <td class="green">Running</td>
                                    <td>
                                    	<div class="switch">
                                            <label class="cb-enable selected"><span>On</span></label>
                                            <label class="cb-disable"><span>Off</span></label>
                                        </div>
                                    </td>
                              	</tr>
                                <tr>
                                	<td>192.168.3.101</td>
                                	<td><div class="progress progress-green"><span style="width:12.3%"><b>12.3%</b></span></div></td>
                                	<td><div class="progress progress-blue"><span style="width:67.9%"><b>67.9%</b></span></div></td>
                                	<td><div class="progress progress-red"><span style="width:33.3%"><b>33.3%</b></span></div></td>
                                    <td class="green">Running</td>
                                    <td>
                                    	<div class="switch">
                                            <label class="cb-enable selected"><span>On</span></label>
                                            <label class="cb-disable"><span>Off</span></label>
                                        </div>
                                    </td>
                              	</tr>
                                <tr>
                                	<td>192.168.3.101</td>
                                	<td><div class="progress progress-green"><span style="width:12.3%"><b>12.3%</b></span></div></td>
                                	<td><div class="progress progress-blue"><span style="width:67.9%"><b>67.9%</b></span></div></td>
                                	<td><div class="progress progress-red"><span style="width:33.3%"><b>33.3%</b></span></div></td>
                                    <td class="red">stop</td>
                                    <td>
                                    	<div class="switch">
                                            <label class="cb-enable"><span>On</span></label>
                                            <label class="cb-disable selected"><span>Off</span></label>
                                        </div>
                                    </td>
                              	</tr>
                                <tr>
                                	<td>192.168.3.101</td>
                                	<td><div class="progress progress-green"><span style="width:12.3%"><b>12.3%</b></span></div></td>
                                	<td><div class="progress progress-blue"><span style="width:67.9%"><b>67.9%</b></span></div></td>
                                	<td><div class="progress progress-red"><span style="width:33.3%"><b>33.3%</b></span></div></td>
                                    <td class="green">Running</td>
                                    <td>
                                    	<div class="switch">
                                            <label class="cb-enable selected"><span>On</span></label>
                                            <label class="cb-disable"><span>Off</span></label>
                                        </div>
                                    </td>
                              	</tr>
                                <tr>
                                	<td>192.168.3.101</td>
                                	<td><div class="progress progress-green"><span style="width:12.3%"><b>12.3%</b></span></div></td>
                                	<td><div class="progress progress-blue"><span style="width:67.9%"><b>67.9%</b></span></div></td>
                                	<td><div class="progress progress-red"><span style="width:33.3%"><b>33.3%</b></span></div></td>
                                    <td class="green">Running</td>
                                    <td>
                                    	<div class="switch">
                                            <label class="cb-enable selected"><span>On</span></label>
                                            <label class="cb-disable"><span>Off</span></label>
                                        </div>
                                    </td>
                              	</tr>
                                <tr>
                                	<td>192.168.3.101</td>
                                	<td><div class="progress progress-green"><span style="width:12.3%"><b>12.3%</b></span></div></td>
                                	<td><div class="progress progress-blue"><span style="width:67.9%"><b>67.9%</b></span></div></td>
                                	<td><div class="progress progress-red"><span style="width:33.3%"><b>33.3%</b></span></div></td>
                                    <td class="red">stop</td>
                                    <td>
                                    	<div class="switch">
                                            <label class="cb-enable"><span>On</span></label>
                                            <label class="cb-disable selected"><span>Off</span></label>
                                        </div>
                                    </td>
                              	</tr>
                            </tbody>
                          </table>
                    	<div class="clear"></div>
        			</div>

                    <!-- tab2 -->
                    <div class="tab-content" id="tab2">
                    	<div class="column-left" >
                            <table>
                                <tbody>
                                    <tr>
                                        <td><b>CPUs Total:</b></td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <td><b>Hosts up:</b></td>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td><b>Hosts down:</b></td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td><b>Avg Load (15, 5, 1m):</b></td>
                                        <td>2%, 2%, 2%</td>
                                    </tr>
                                    <tr>
                                        <td><b>Localtime:</b></td>
                                        <td>2013-07-23 17:39</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="column-right" >
                        	<img src="<%=path %>/resources/load_percentage.jpg" alt="load percentage"/>
                        </div>
                        
                        <div class="clear"></div>
                    </div>
      			</div>
    		</div>

			<%@ include file="frames/footer.html" %>
  		</div>
        
	</div>
</body>
</html>
