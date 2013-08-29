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

<body id="settings-body">
	<div id="body-wrapper">
  		<%@ include file="frames/sidebar.jsp" %>
        
  		<div id="main-content">
    		<%@ include file="frames/no-script-warning.html" %>
        
            <!-- Page Head -->            
    		<div class="content-box">
      			<div class="content-box-header">
        			<h3>Swift Console Settings</h3>
        			<ul class="content-box-tabs">
          				<li><a href="#tab1" class="default-tab">Dashboard</a></li>
						<li><a href="#tab2">Ganglia Configuration</a></li>
                        <li><a href="#tab3">Log Alert</a></li>
                        <li><a href="#tab4">Report E-mail</a></li>
        			</ul>
        			<div class="clear"></div>
      			</div>

      			<div class="content-box-content">
                    <div class="tab-content default-tab" id="tab1">
                        
                    	<div class="clear"></div>
                    </div>
                
                    <div class="tab-content" id="tab2">
                        
                    	<div class="clear"></div>
                    </div>
                
                	<div class="tab-content" id="tab3">
                        
                        <div class="clear"></div>
                    </div>
                    
                    <div class="tab-content" id="tab4">
                        
                        <div class="clear"></div>
                    </div>
           		
                </div>
          	</div>
    
   		 	<%@ include file="frames/footer.html" %>
  		</div>
	</div>
</body>
</html>
