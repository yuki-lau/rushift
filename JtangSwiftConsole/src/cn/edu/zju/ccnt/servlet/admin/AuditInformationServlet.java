package cn.edu.zju.ccnt.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zju.ccnt.swift.AuditManipulator;

/**
 * 处理Administrator -> Audit Information相关的请求
 * @author yuki
 * @create 2013-08-28
 */
public class AuditInformationServlet extends HttpServlet {

	private static final long serialVersionUID = -2660971899139428092L;
	private AuditManipulator auditMani = new AuditManipulator("192.168.3.51", 22, "root", "fs");
	
	/**
	 * The doGet method.
	 * 包括：
	 * 		1. admin-audit：展示页面
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getRequestDispatcher("/admin/audit.jsp").forward(request, response);
	}

	/**
	 * The doPost method.
	 * 包括：
	 * 		1. admin-audit?action=get-nodes：查看一个具体的account、container 或 object在集群中的位置
	 * 		2. admin-audit?action=object-info：在服务器上查询一个object的详细信息
	 * 		3. admin-audit?action=account-audit：审计账号，获取这个账号的详情
	 * 		4. admin-audit?action=drive-audit：监视坏掉的drive，并处理
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		// 执行swift-get-nodes的操作
		if("get-nodes".equals(action)){
			String ringType = request.getParameter("ring-type");
			String account = request.getParameter("account");
			String container = request.getParameter("container");
			String object = request.getParameter("object");
			
//			String result = "<p><b>swift-get-nodes</b></p>";
//			result += "<p>ring type: " + ringType + "</p>";
//			result += "<p>account: " + account + "</p>";
//			result += "<p>container: " + container + "</p>";
//			result += "<p>object: " + object + "</p>";
			
			String result = auditMani.getNodes(ringType, account, container, object);
			
			request.setAttribute("search-result", result);
			request.getRequestDispatcher("/admin/audit.jsp").forward(request, response);
		}
		
		// 执行swift-object-info的操作
		else if("object-info".equals(action)){
			
			String ip = request.getParameter("ip");
			String path = request.getParameter("path");
			
//			String result = "<p><b>swift-object-info</b></p>";
//			result += "<p>IP Address: " + ip + "</p>";
//			result += "<p>Disk Path: " + path + "</p>";
			
			String result = auditMani.getObjectInfo(ip, path);
			
			request.setAttribute("search-result", result);
			request.getRequestDispatcher("/admin/audit.jsp").forward(request, response);
		}
		
		// 执行swift-account-audit的操作
		else if("account-audit".equals(action)){
			
			String account = request.getParameter("account");
			
//			String result = "<p><b>swift-account-audit</b></p>";
//			result += "<p>account: " + account + "</p>";
			
			String result = auditMani.accountAudit(account);
			
			request.setAttribute("search-result", result);
			request.getRequestDispatcher("/admin/audit.jsp").forward(request, response);
		}
		
		// 执行swift-drive-audit的操作
		else if("drive-audit".equals(action)){
			
			String logAddress = request.getParameter("log-addr");
			String minutes = request.getParameter("minutes");
			String errorLimit = request.getParameter("err-limit");
			String logPattern = request.getParameter("log-pattern");
			String regex = request.getParameter("regex");
			
			String result = "<p><b>swift-drive-audit</b></p>";
			result += "<p>Log Address: " + logAddress + "</p>";
			result += "<p>Minutes: " + minutes + "</p>";
			result += "<p>Error Limit: " + errorLimit + "</p>";
			result += "<p>Log Pattern: " + logPattern + "</p>";
			result += "<p>Regex: " + regex + "</p>";
			
			request.setAttribute("search-result", result);
			request.getRequestDispatcher("/admin/audit.jsp").forward(request, response);
		}

		// 其他
		else{
			doGet(request,response);
		}
	}

}
