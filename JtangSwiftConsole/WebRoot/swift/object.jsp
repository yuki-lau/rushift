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

<body id="swift-object-body">
	<div id="body-wrapper">
  		<%@ include file="../frames/sidebar.jsp" %>
        
  		<div id="main-content" style="padding: 0; margin: 0 0 0 240px">
  		
    		<iframe src="http://192.168.1.107/dashboard/object" width="100%" height="670px">
				Jtang Swift Console用了框架技术，但是您的浏览器不支持框架，请升级您的浏览器以便正常访问。
			</iframe>
  		
  		</div>
        
	</div>
</body>
</html>
