package cn.edu.zju.ccnt.swift;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import cn.edu.zju.ccnt.model.ServiceStatus;
import cn.edu.zju.ccnt.util.LinuxController;

/**
 * 处理与Swift Service相关的逻辑
 * @author yuki
 * @since 2013-08-26
 */
public class ServiceManipulator {
	
	// private static Logger LOG = Logger.getLogger(ServiceManipulator.class.getName());
	private LinuxController controller;
	private String user;
	private String password;
	private String host;
	private int port;
	
	
	public ServiceManipulator(){
		this.controller = new LinuxController();
	}
	
	public ServiceManipulator(String host, int port, String user, String password){
		this.host = host;
		this.port = port;
		this.user = user;
		this.password = password;
		this.controller = new LinuxController(host, port, user, password);
	}
	
	/**
	 * 启动Swift服务，单个服务启动
	 * @param serviceName
	 * @return
	 */
	public boolean startSwiftService(String serviceName) {
		
		List<String> serviceNames = new ArrayList<String>();
		serviceNames.add(serviceName);
		
		return startSwiftServices(serviceNames);
	}
	
	/**
	 * 启动Swift服务，多个服务启动
	 * @param serviceNames
	 * @return
	 */
	public boolean startSwiftServices(List<String> serviceNames) {
		
		List<String> commands = new ArrayList<String>();
		for(int i =0; i < serviceNames.size(); i++){
			commands.add("swift-init " + serviceNames.get(i) + " start");
		}
		
		if(controller.runCommand(commands).getResultStat() < 0){
			return false;
		}
		
		return true;
	}
	
	/**
	 * 停止Swift服务，单个服务停止
	 * @param serviceName
	 * @return
	 */
	public boolean stopSwiftService(String serviceName) {
		
		List<String> serviceNames = new ArrayList<String>();
		serviceNames.add(serviceName);
		
		return stopSwiftServices(serviceNames);
	}
	
	/**
	 * 停止Swift服务，多个服务停止
	 * @param serviceNames
	 * @return
	 */
	public boolean stopSwiftServices(List<String> serviceNames) {
		
		List<String> commands = new ArrayList<String>();
		for(int i =0; i < serviceNames.size(); i++){
			commands.add("swift-init " + serviceNames.get(i) + " stop");
		}
		
		if(controller.runCommand(commands).getResultStat() < 0){
			return false;
		}
		
		return true;
	}
	
	/**
	 * 重启Swift服务，单个服务重启
	 * @param serviceName
	 * @return
	 */
	public boolean restartSwiftService(String serviceName) {
		
		List<String> serviceNames = new ArrayList<String>();
		serviceNames.add(serviceName);
		
		return restartSwiftServices(serviceNames);
	}
	
	/**
	 * 重启Swift服务，多个服务重启
	 * @param serviceNames
	 * @return
	 */
	public boolean restartSwiftServices(List<String> serviceNames) {
		
		List<String> commands = new ArrayList<String>();
		for(int i =0; i < serviceNames.size(); i++){
			commands.add("swift-init " + serviceNames.get(i) + " restart");
		}
		
		if(controller.runCommand(commands).getResultStat() < 0){
			return false;
		}
		
		return true;
	}
	
	/**
	 * 重新载入Swift服务，单个服务重新载入
	 * @param serviceName
	 * @return
	 */
	public boolean reloadSwiftService(String serviceName) {
		
		List<String> serviceNames = new ArrayList<String>();
		serviceNames.add(serviceName);
		
		return reloadSwiftServices(serviceNames);
	}
	
	/**
	 * 重新载入Swift服务，多个服务重新载入
	 * @param serviceNames
	 * @return
	 */
	public boolean reloadSwiftServices(List<String> serviceNames) {
		
		List<String> commands = new ArrayList<String>();
		for(int i =0; i < serviceNames.size(); i++){
			commands.add("swift-init " + serviceNames.get(i) + " reload");
		}
		
		if(controller.runCommand(commands).getResultStat() < 0){
			return false;
		}
		
		return true;
	}
	
	/**
	 * 关闭（graceful）Swift服务，单个服务关闭（graceful）
	 * @param serviceName
	 * @return
	 */
	public boolean shutdownSwiftService(String serviceName) {
		
		List<String> serviceNames = new ArrayList<String>();
		serviceNames.add(serviceName);
		
		return shutdownSwiftServices(serviceNames);
	}
	
	/**
	 * 关闭（graceful）Swift服务，多个服务关闭（graceful）
	 * @param serviceNames
	 * @return
	 */
	public boolean shutdownSwiftServices(List<String> serviceNames) {
		
		List<String> commands = new ArrayList<String>();
		for(int i =0; i < serviceNames.size(); i++){
			commands.add("swift-init " + serviceNames.get(i) + " shutdown");
		}
		
		if(controller.runCommand(commands).getResultStat() < 0){
			return false;
		}
		
		return true;
	}
	
	/**
	 * 获取Swift相关进程的状态列表
	 * @param host
	 * @param service
	 * @return
	 */
	public List<ServiceStatus> getServiceStatus(String host, String service){
		
		List<String> commands = new ArrayList<String>();
		
		// 注：	由于直接从终端输出的ps结果存在字符颜色的ASCII控制码问题，
		//     	因此先输出到文件，再cat，从而在终端得到无颜色的纯文本
		commands.add("ps xo pid,pcpu,pmem,start_time,time,stat,cmd | egrep '(swift)' > 'jtang-ps'");
		commands.add("cat jtang-ps");		
		
		return parseServiceStatusStr(controller.runCommand(commands).getResultStr());
	}
	
	/**
	 * 将Swift相关进程的状态列表中cmd name相同的进程的CPU Usage和Mem Usage计算平均值，
	 * 进行合并，每个cmd name保留一条记录
	 * @param serviceList
	 * @return
	 */
	public List<ServiceStatus> mergeService(List<ServiceStatus> serviceList){
		
		List<ServiceStatus> mergeList = new ArrayList<ServiceStatus>();
		Map<String, ServiceStatus> mergeService = new HashMap<String, ServiceStatus>();
		Map<String, Integer> mergeCount = new HashMap<String, Integer>();
		
		for(int i = 0; i < serviceList.size(); i++){
			ServiceStatus service = serviceList.get(i);
			if(mergeService.get(service.getCmdName()) == null){
				mergeService.put(service.getCmdName(), service);
				mergeCount.put(service.getCmdName(), 0);
			}
			else{
				float currentCpuUsage = mergeService.get(service.getCmdName()).getCpuUsage();
				float currentMemUsage = mergeService.get(service.getCmdName()).getMemUsage();
				mergeService.get(service.getCmdName()).setCpuUsage(currentCpuUsage + service.getCpuUsage());
				mergeService.get(service.getCmdName()).setMemUsage(currentMemUsage + service.getMemUsage());
				mergeCount.put(service.getCmdName(), mergeCount.get(service.getCmdName()) + 1);
			}
		}

		for(String key: mergeService.keySet()){
			float currentCpuUsage = mergeService.get(key).getCpuUsage();
			float currentMemUsage = mergeService.get(key).getMemUsage();
			mergeService.get(key).setCpuUsage(currentCpuUsage / mergeCount.get(key));
			mergeService.get(key).setMemUsage(currentMemUsage / mergeCount.get(key));
			mergeService.get(key).setCmdName(key.substring(6));
			
			mergeList.add(mergeService.get(key));
		}
		
		mergeService.clear();
		mergeCount.clear();
		
		return mergeList;
	}
	
	/**
	 * 将Swift相关进程的字符串结果返回值，转化为对象列表
	 * @param statusStr
	 * @return
	 */
	private List<ServiceStatus> parseServiceStatusStr(String statusStr){
		List<ServiceStatus> serviceList = new ArrayList<ServiceStatus>();
		int commandCount = 0;
		
		if(!StringUtils.isEmpty(statusStr)){
			String[] statusLine = statusStr.split(System.getProperty("line.separator", "/n"));
			
			for(int i = 0; i < statusLine.length; i++){
				if(commandCount < 2 && statusLine[i].startsWith(user + "@")){
					commandCount++;
					continue;
				}
				if(commandCount == 2 && statusLine[i].contains("/swift-")){
					String[] items = statusLine[i].split(" ");
					ServiceStatus service = new ServiceStatus();
					int statusIndex = 1;
					for(int k = 0; k < items.length; k++){
						if(statusIndex > 7){
							break;
						}
						if(StringUtils.isEmpty(items[k])){
							continue;
						}
						switch(statusIndex){
							case 1:
								service.setPid(Integer.parseInt(items[k]));
								statusIndex++;
								break;
							case 2:
								service.setCpuUsage(Float.parseFloat(items[k]));
								statusIndex++;
								break;
							case 3:
								service.setMemUsage(Float.parseFloat(items[k]));
								statusIndex++;
								break;
							case 4:
								service.setStartTime(items[k]);
								statusIndex++;
								break;
							case 5:
								service.setCpuTime(items[k]);
								statusIndex++;
								break;
							case 6:
								service.setStatus(items[k]);
								statusIndex++;
								break;
							case 7:
								int startIndex = items[k].indexOf("/swift");
								if(startIndex >= 0){
									service.setCmdName(items[k].substring(startIndex + 1));
									statusIndex++;
									serviceList.add(service);
								}
								break;
						}
					}
					
					
				}
			}
		}
		
		return serviceList;
	}

    public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
		this.controller.setUser(user);
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
		this.controller.setPassword(password);
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
		this.controller.setHost(host);
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
		this.controller.setPort(port);
	}
}