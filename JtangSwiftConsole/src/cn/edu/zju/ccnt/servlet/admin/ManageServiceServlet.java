package cn.edu.zju.ccnt.servlet.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import cn.edu.zju.ccnt.model.ServiceStatus;
import cn.edu.zju.ccnt.swift.ServiceManipulator;

/**
 * Administrator -> services 相关功能的实现：展示swift相关服务状态、开启/关闭服务
 * @author yuki
 * @since 2013-08-26
 */
public class ManageServiceServlet extends HttpServlet {

	private static final long serialVersionUID = -7725814931493790529L;
	private ServiceManipulator serviceMani = new ServiceManipulator();
	
	/**
	 * 设置远端host、port、user、password，并获取该节点上的service信息
	 * @param host
	 * @param port
	 * @param user
	 * @param password
	 * @return
	 */
	private List<ServiceStatus> getRunningServices(String service, String host, int port, String user, String password){
		
		if(StringUtils.isEmpty(host) || StringUtils.isEmpty(serviceMani.getHost())){
			host = "192.168.3.51";
		}
		serviceMani.setHost(host);
		serviceMani.setPort(port);
		serviceMani.setUser(user);
		serviceMani.setPassword(password);

		return getRunningServices(host, service);
	}
	
	/**
	 * 直接获取当前serviceManipulator对象指向的节点中的service信息
	 * @return
	 */
	private List<ServiceStatus> getRunningServices(String host, String service){
		
		if(StringUtils.isEmpty(host) || StringUtils.isEmpty(serviceMani.getHost())){
			host = "192.168.3.51";
		}
		
		List<ServiceStatus> serviceList = new ArrayList<ServiceStatus>();
		serviceList = serviceMani.mergeService(serviceMani.getServiceStatus(host, service));
		
		return serviceList;
	}
	
	/**
	 * The doGet method.
	 * 包括：
	 * 		1. admin-services?[&node=][&service=]:展示swift服务列表
	 * 	 	2. admin-services?action=start&node=&service：开启服务
	 * 		3. admin-services?action=restart&node=&service：重启服务
	 * 		4. admin-services?action=reload&node=&service：重载服务
	 * 		5. admin-services?action=stop&node=&service：停止服务
	 * 		6. admin-services?action=shutdown&node=&service：关闭（graceful）服务
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String node = request.getParameter("node");
		String service = request.getParameter("service");
		
		// 执行开启、关闭单个服务操作
		if(!StringUtils.isEmpty(action)){
			// 设置node
			if(StringUtils.isEmpty(node) || StringUtils.isEmpty(serviceMani.getHost())){
				node = "192.168.3.51";
			}
			serviceMani.setHost(node);
			
			// 如果action为start，则启动swift-init xx start命令
			if("start".equals(action) && !StringUtils.isEmpty(service)){
				response.sendRedirect("admin-services?result=" + serviceMani.startSwiftService(service));
				return;
			}
			
			// 如果action为stop，则启动swift-init xx stop命令
			else if("stop".equals(action) && !StringUtils.isEmpty(service)){
				response.sendRedirect("admin-services?result=" + serviceMani.stopSwiftService(service));
				return;
			}
			
			// 如果action为restart，则启动swift-init xx restart命令
			else if("restart".equals(action) && !StringUtils.isEmpty(service)){
				response.sendRedirect("admin-services?result=" + serviceMani.restartSwiftService(service));
				return;
			}
			
			// 如果action为reload，则启动swift-init xx reload命令
			if("reload".equals(action) && !StringUtils.isEmpty(service)){
				response.sendRedirect("admin-services?result=" + serviceMani.reloadSwiftService(service));
				return;
			}
			
			// 如果action为shutdown，则启动swift-init xx shutdown命令
			if("shutdown".equals(action) && !StringUtils.isEmpty(service)){
				response.sendRedirect("admin-services?result=" + serviceMani.shutdownSwiftService(service));
				return;
			}
		}
		
		request.setAttribute("running_services", getRunningServices(service, node, 22, "root", "fs"));
		request.getRequestDispatcher("/admin/services.jsp").forward(request, response);

	}

	/**
	 * The doPost method.
	 * 包括：
	 * 		1. admin-services?action=batch-start：批量开启服务
	 * 		2. admin-services?action=batch-restart：批量重启服务
	 * 		3. admin-services?action=batch-reload：批量重载服务
	 * 		4. admin-services?action=batch-stop：批量停止服务
	 * 		5. admin-services?action=batch-shutdown：批量关闭（graceful）服务
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String services[] = request.getParameterValues("process");
		
		// 执行批量开启、关闭服务操作
		if(!StringUtils.isEmpty(action)){
			
			// 构建需要批量执行的服务列表
			List<String> serviceList = new ArrayList<String>();
			for(int i = 0; i < services.length; i++){
				serviceList.add(services[i]);
			}
			
			// 如果action为batch-start，则启动swift-init xx start命令
			if("batch-start".equals(action)){
				response.sendRedirect("admin-services?result=" + serviceMani.startSwiftServices(serviceList));
				return;
			}
			
			// 如果action为batch-stop，则启动swift-init xx stop命令
			else if("batch-stop".equals(action)){
				response.sendRedirect("admin-services?result=" + serviceMani.stopSwiftServices(serviceList));
				return;
			}
			
			// 如果action为batch-restart，则启动swift-init xx restart命令
			else if("batch-restart".equals(action)){
				response.sendRedirect("admin-services?result=" + serviceMani.restartSwiftServices(serviceList));
				return;
			}
			
			// 如果action为batch-reload，则启动swift-init xx reload命令
			if("batch-reload".equals(action)){
				response.sendRedirect("admin-services?result=" + serviceMani.reloadSwiftServices(serviceList));
				return;
			}
			
			// 如果action为shutdown，则启动swift-init xx shutdown命令
			if("shutdown".equals(action) ){
				response.sendRedirect("admin-services?result=" + serviceMani.shutdownSwiftServices(serviceList));
				return;
			}
		}

		// 参数无效
		response.sendRedirect("admin-services?result=false");
		return;
	}

}
