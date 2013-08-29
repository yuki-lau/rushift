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
</head>

<body id="cluster-health-body">
	<div id="body-wrapper">
  		<%@ include file="../frames/sidebar.jsp" %>
        
  		<div id="main-content">
    		<%@ include file="../frames/no-script-warning.html" %>
        
            <!-- Page Head -->  
            <div>
                <ul class="shortcut-buttons-set">
                	<li>
                		<a class="shortcut-button" href="<%=path %>/cluster-health?action=populate">
	                		<span>
	                			<img src="<%=path %>/resources/img/icons/server-run.png" alt="icon" /><br />
	                        	Run Populate
	                       	</span>
                       	</a>
                  	</li>
                  	<li>
                  		<a class="shortcut-button" href="<%=path %>/cluster-health?action=report">
                  			<span> 
                  				<img src="<%=path %>/resources/img/icons/server-health.png" alt="icon" /><br />
                        		Server Health
                        	</span>
                       	</a>
                   	</li>
                </ul>
                <div class="clear"></div>
            </div>   
                   
    		<div class="content-box">
      			<div class="content-box-header">
        			<h3>Swift Dispersion Report</h3>
        			<div class="clear"></div>
      			</div>

      			<div class="content-box-content">
                    <div class="tab-content default-tab">
                        <% 
                    	if(request.getAttribute("health-report") != null){ 
							out.println((String)request.getAttribute("health-report"));
							request.removeAttribute("health-report");
					   	} 
					   	else { %>
							<p><b>您还未执行Server Health命令.</b></p>
							<p>请首先执行<b>populate</b>命令最新检测数据，再执行<b>health</b>命令获取swift cluster健康状态报告...</p>
						<% 	
						} %>
                    	<div class="clear"></div>
                    </div>
                </div>
          	</div>
  		</div>
	</div>
</body>
</html>
