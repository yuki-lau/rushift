<%@ page language="java" import="java.util.*, cn.edu.zju.ccnt.constant.*" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Swift Console - Login</title>
    
    <link rel="stylesheet" href="<%=path %>/resources/css/reset.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="<%=path %>/resources/css/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="<%=path %>/resources/css/invalid.css" type="text/css" media="screen" />
    <script type="text/javascript" src="<%=path %>/resources/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/js/simpla.jquery.configuration.js"></script>
</head>
<body id="login">
	<div id="login-wrapper" class="png_bg">
  	<div id="login-top">
    	<h1>Swift Console</h1>
    	<a href="#"><img id="logo" src="<%=path %>/resources/img/logo.png" alt="Swift Console logo" /></a> </div>
    
  		<div id="login-content">
    		<form action="<%=path %>/login.do" method="post">
    			
      			<div class="notification information png_bg" style="display: none;">
        			<div> Just click "Sign In". No password needed. </div>
      			</div>

      			<p>
                    <label>Username</label>
                    <input class="text-input" type="text" name="username" />
      			</p>
      			<div class="clear"></div>
                
              	<p>
                    <label>Password</label>
                    <input class="text-input" type="password" name="password" />
              	</p>
              	<div class="clear"></div>
                
              	<p id="remember-password">
                	<input type="checkbox" name="r_password"/>
                	Remember me 
              	</p>
              	<div class="clear"></div>
      			
                <p>
        			<input class="button" type="submit" value="Sign In" />
      			</p>
    		</form>
  		</div>
	</div>
</body>
</html>
