<%@ page language="java" import="java.util.*, cn.edu.zju.ccnt.constant.*" pageEncoding="UTF-8"%>
<% String frames_path = request.getContextPath(); %>

<div id="sidebar">
	<div id="sidebar-wrapper">
  		<h1 id="sidebar-title"><a href="#">Swift Console</a></h1>
  		<a href="#"><img id="logo" src="<%=frames_path %>/resources/img/logo.png" alt="Swift Console logo" /></a>
            
  		<div id="profile-links"> 
           	Hello, <a href="#" title="Edit your profile">yuki</a>, you have <a href="#messages" rel="modal" title="3 Messages">3 Messages</a><br /><br />
    		Last sign in: <a href="#" title="View sign in history">2013-07-23 11:09:55</a><br />
            <a href="#" title="Sign Out">Sign Out</a> 
        </div>
 				
        <ul id="main-nav">
            <li><a id="dashboard" href="<%=frames_path %>/dashboard.jsp" class="nav-top-item no-submenu">Dashboard </a></li>
            <li>
            	<a id="cluster" href="#" class="nav-top-item">Cluster Status </a>
                <ul>
                    <li><a id="cluster-fullview" href="<%=frames_path %>/cluster/fullview.jsp">Full View</a></li>
                    <li><a id="cluster-physical" href="<%=frames_path %>/cluster/physical.jsp">Physical View</a></li>
                    <li><a id="cluster-health" href="<%=frames_path %>/cluster-health">Cluster Health</a></li>
                </ul>
            </li>
            <li> 
                <a id="swift" href="#" class="nav-top-item">Swift Metrics</a>
                <ul>
                    <li><a id="swift-overview" href="<%=frames_path %>/swift/overview.jsp">Overview</a></li>
                    <li><a id="swift-proxy" href="<%=frames_path %>/swift/proxy.jsp">Proxy Server</a></li>
                    <li><a id="swift-account" href="<%=frames_path %>/swift/account.jsp">Account Server</a></li>
                    <li><a id="swift-container" href="<%=frames_path %>/swift/container.jsp">Container Server</a></li>
                    <li><a id="swift-object" href="<%=frames_path %>/swift/object.jsp">Object Server</a></li>
                    <li><a id="swift-other" href="<%=frames_path %>/swift/other.jsp">Other Daemons</a></li>
                </ul>
            </li>
           	<li>
         		<a id="admin" href="#" class="nav-top-item">Administrator</a>
                <ul>
                    <li><a id="admin-rings" href="<%=frames_path %>/admin-rings">Manage Rings</a></li>
                    <li><a id="admin-services" href="<%=frames_path %>/admin-services">Manage Services</a></li>
                    <li><a id="admin-audit" href="<%=frames_path %>/admin-audit">Audit Information</a></li>
                    <li><a id="admin-logs" href="<%=frames_path %>/admin/logs.jsp">View Logs</a></li>
                </ul>
         	</li>
           	<li><a id="settings" href="<%=frames_path %>/settings.jsp" class="nav-top-item no-submenu">Settings</a></li>
        </ul>
	</div>
</div>