package cn.edu.zju.ccnt.servlet.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import cn.edu.zju.ccnt.constant.RingType;
import cn.edu.zju.ccnt.constant.ServerType;
import cn.edu.zju.ccnt.model.Device;
import cn.edu.zju.ccnt.model.Ring;
import cn.edu.zju.ccnt.swift.RingManipulator;

/**
 * 处理Administrator -> Manage Rings相关的请求
 * @author yuki
 * @create 2013-08-22
 */
public class ManageRingsServlet extends HttpServlet {

	private static final long serialVersionUID = -3794382436328821312L;
	private RingManipulator ringMani = new RingManipulator();
	
	/**
	 * 从account.rings.gz/container.rings.gz/object.rings.gz中获取设备列表
	 * @return
	 */
	private List<Device> getDeviceList(){
		// 从account.rings.gz/container.rings.gz/object.rings.gz中获取设备列表
		List<Device> deviceList = ringMani.getDevcieList(RingType.ACCOUNT);
		deviceList.addAll(ringMani.getDevcieList(RingType.CONTAINER));
		deviceList.addAll(ringMani.getDevcieList(RingType.OBJECT));
		
		return deviceList;
	}
	
	/**
	 * The doGet method.
	 * 包括:
	 * 		1. admin-rings: 展示设备列表
	 * 		2. admin-rings?action=delete-device&search-str="d<device_id>z<zone>-<ip>:<port>/<device_name>"：删除设备（参数devcie id如果能直接确定就用device id）
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		// 执行删除设备操作
		if("delete-device".equals(action)){
			String searchStr = request.getParameter("search-str");
			
			// 执行删除设备动作，并根据返回结果设置返回到页面的信息
			if(ringMani.deleteDevice(searchStr)){
				request.setAttribute("result", "ok");
				request.setAttribute("message", "删除设备（" + searchStr + "）成功！");
			}
			else{
				request.setAttribute("result", "error");
				request.setAttribute("message", "删除设备（" + searchStr + "）失败！");
			}
		}
		
		// 将设备列表数据展示到前端
		request.setAttribute("deviceList", getDeviceList());
		request.getRequestDispatcher("/admin/rings.jsp").forward(request, response);
	}

	/**
	 * The doPost. 
	 * 包括：
	 * 		1. admin-rings?action=add-device：添加设备
	 * 		2. admin-rings?action=create-rings：创建ring
	 * 		3. admin-rings?action=set-ring-info：修改ring的信息
	 * 		4. admin-rings?action=rebalance：执行ring的重新平衡操作
	 * 		5. admin-rings?action=set-device-info&search-str="d<device_id>z<zone>-<ip>:<port>/<device_name>"：修改设备信息（参数devcie id如果能直接确定就用device id）
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		// 执行添加设备操作
		if("add-device".equals(action)){
			Device device = new Device();
			
			// 处理ring类型
			String ringType = request.getParameter("ring-type");
			String serverType;
			if("1".equals(ringType)){
				serverType = ServerType.ACCOUNT;
			}
			else if("2".equals(ringType)){
				serverType = ServerType.CONTAINER;
				
			}
			else if("3".equals(ringType)){
				serverType = ServerType.OBJECT;
			}
			else{
				serverType = ServerType.ALL;
			}
			
			// 设置device对象信息
			device.setServerType(serverType);
			device.setZoneID(Integer.parseInt(request.getParameter("zone")));
			device.setIPAddress(request.getParameter("ip"));
			device.setPort(Integer.parseInt(request.getParameter("port")));
			device.setDeviceName(request.getParameter("device-name"));
			device.setMeta(request.getParameter("meta"));
			device.setWeight(Float.parseFloat(request.getParameter("weight")));
			
			// 执行添加设备动作，并根据返回结果设置返回到页面的信息
			if(ringMani.addDevice(device)){
				request.setAttribute("result", "ok");
				request.setAttribute("message", "添加设备（" + device.toHTMLString() + "）成功！");
			}
			else{
				request.setAttribute("result", "error");
				request.setAttribute("message", "添加设备（" + device.toHTMLString() + "）失败！");
			}
			
			// 获取新的设备列表信息，展示到前端
			request.setAttribute("deviceList", getDeviceList());
			request.getRequestDispatcher("/admin/rings.jsp").forward(request, response);
		}
		
		// 执行创建Ring操作
		else if("create-rings".equals(action)){
			Ring ring = new Ring();
			
			// 处理ring类型
			String ringType = request.getParameter("ring-type");
			if("1".equals(ringType)){
				ringType = ServerType.ACCOUNT;
			}
			else if("2".equals(ringType)){
				ringType = ServerType.CONTAINER;
				
			}
			else if("3".equals(ringType)){
				ringType = ServerType.OBJECT;
			}
			else{
				ringType = ServerType.ALL;
			}
			
			// 设置Ring对象信息
			ring.setRingType(ringType);
			ring.setPartitionPower(Integer.parseInt(request.getParameter("part-power")));
			ring.setReplicas(Integer.parseInt(request.getParameter("replicas")));
			ring.setMinPartHours(Integer.parseInt(request.getParameter("min-part-hours")));
			
			// 执行创建Ring动作，并根据返回结果设置返回到页面的信息
			if(ringMani.createRing(ring)){
				request.setAttribute("result", "ok");
				request.setAttribute("message", "创建Ring（" + ring.toHTMLString() + "）成功！");
			}
			else{
				request.setAttribute("result", "error");
				request.setAttribute("message", "创建Ring（" + ring.toHTMLString() + "）失败！");
			}
			
			// 获取新的设备列表信息，展示到前端
			request.setAttribute("deviceList", getDeviceList());
			request.getRequestDispatcher("/admin/rings.jsp").forward(request, response);
		}
		
		// 执行设置Ring信息的操作
		else if("set-ring-info".equals(action)){
			Ring ring = new Ring();
			
			// 处理ring类型
			String ringType = request.getParameter("ring-type");
			if("1".equals(ringType)){
				ringType = ServerType.ACCOUNT;
			}
			else if("2".equals(ringType)){
				ringType = ServerType.CONTAINER;
				
			}
			else if("3".equals(ringType)){
				ringType = ServerType.OBJECT;
			}
			else{
				ringType = ServerType.ALL;
			}
			
			// 设置Ring对象信息
			String ringInfo = ringType;
			ring.setRingType(ringType);
			if(!StringUtils.isEmpty(request.getParameter("replicas"))){
				ring.setReplicas(Integer.parseInt(request.getParameter("replicas")));
				ringInfo += (", &nbsp;&nbsp;replicas:&nbsp;&nbsp;" + ring.getReplicas());
			}
			if(!StringUtils.isEmpty(request.getParameter("min-part-hours"))){
				ring.setMinPartHours(Integer.parseInt(request.getParameter("min-part-hours")));
				ringInfo += (", &nbsp;&nbsp;min_part_hours:&nbsp;&nbsp;" + ring.getMinPartHours());
			}
			
			// 执行修改Ring信息动作，并根据返回结果设置返回到页面的信息
			if(ringMani.setRingInfo(ring)){
				request.setAttribute("result", "ok");
				request.setAttribute("message", "设置Ring信息（" + ringInfo + "）成功！");
			}
			else{
				request.setAttribute("result", "error");
				request.setAttribute("message", "设置Ring信息（" + ringInfo + "）失败！");
			}
			
			// 获取新的设备列表信息，展示到前端
			request.setAttribute("deviceList", getDeviceList());
			request.getRequestDispatcher("/admin/rings.jsp").forward(request, response);
		}
		
		// 执行rebalance的操作
		else if("rebalance".equals(action)){
			
			// 处理需要rebalance
			String rings[] = request.getParameterValues("ring[]");
			List<String> rebalanceRings = new ArrayList<String>();
			for(String ringType: rings){
				if("1".equals(ringType)){
					rebalanceRings.add(ServerType.ACCOUNT);
				}
				else if("2".equals(ringType)){
					rebalanceRings.add(ServerType.CONTAINER);
				}
				else if("3".equals(ringType)){
					rebalanceRings.add(ServerType.OBJECT);
				}
			}
			
			// 执行Rebalance动作，并根据返回结果设置返回到页面的信息
			if(ringMani.rebalance(rebalanceRings)){
				request.setAttribute("result", "ok");
				request.setAttribute("message", "Rebalance Ring（" + rebalanceRings + "）成功！");
			}
			else{
				request.setAttribute("result", "error");
				request.setAttribute("message", "Rebalance Ring（" + rebalanceRings + "）失败！");
			}
			
			// 获取新的设备列表信息，展示到前端
			request.setAttribute("deviceList", getDeviceList());
			request.getRequestDispatcher("/admin/rings.jsp").forward(request, response);
		}
		
		// 执行修改Device信息的操作
		else if("set-device-info".equals(action)){
			Device device = new Device();
			
			String searchStr = request.getParameter("search-str");
			
			// 处理ring类型
			String ringType = request.getParameter("ring-type");
			String serverType;
			if("1".equals(ringType)){
				serverType = ServerType.ACCOUNT;
			}
			else if("2".equals(ringType)){
				serverType = ServerType.CONTAINER;
				
			}
			else if("3".equals(ringType)){
				serverType = ServerType.OBJECT;
			}
			else{
				serverType = ServerType.ALL;
			}
			
			// 设置device对象信息
			device.setServerType(serverType);
			device.setIPAddress(request.getParameter("ip"));
			device.setPort(Integer.parseInt(request.getParameter("port")));
			device.setDeviceName(request.getParameter("device-name"));
			device.setMeta(request.getParameter("meta"));
			device.setWeight(Float.parseFloat(request.getParameter("weight")));
			
			// 执行修改设备信息动作，并根据返回结果设置返回到页面的信息
			if(ringMani.editDevice(searchStr, device)){
				request.setAttribute("result", "ok");
				request.setAttribute("message", "修改设备（" + device.toHTMLString() + "）成功！");
			}
			else{
				request.setAttribute("result", "error");
				request.setAttribute("message", "修改设备（" + device.toHTMLString() + "）失败！");
			}
			
			// 获取新的设备列表信息，展示到前端
			request.setAttribute("deviceList", getDeviceList());
			request.getRequestDispatcher("/admin/rings.jsp").forward(request, response);
		}
		
		else{
			doGet(request,response);
		}
		
	}

}
