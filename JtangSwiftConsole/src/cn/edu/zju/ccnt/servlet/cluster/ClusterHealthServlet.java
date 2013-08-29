package cn.edu.zju.ccnt.servlet.cluster;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zju.ccnt.swift.HealthManipulator;

/**
 * 处理Cluster Status -> Cluster Health相关的请求
 * @author yuki
 * @create 2013-08-28
 */
public class ClusterHealthServlet extends HttpServlet {

	private static final long serialVersionUID = 6566375197559212942L;
	private HealthManipulator healthMani = new HealthManipulator("192.168.3.51", 22, "root", "fs");
	
	/**
	 * The doGet method.
	 * 包括：
	 * 		1. cluster-health?action=populate：执行swift-dispersion-populate产生检测数据
	 * 		2. cluster-health?action=report：执行swift-dispersion-report获取swift集群健康状态报告
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		
		// 执行swift-dispersion-populate的操作
		if("populate".equals(action)){
			
			request.setAttribute("health-report", healthMani.runPopulate());
		}
		
		// 执行swift-dispersion-report的操作
		else if("report".equals(action)){

			request.setAttribute("health-report", healthMani.getReport());
		}
		
		request.getRequestDispatcher("/cluster/health.jsp").forward(request, response);
	}

	/**
	 * The doPost method.
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}

}
