package cn.edu.zju.ccnt.swift;

import java.util.ArrayList;
import java.util.List;

import cn.edu.zju.ccnt.util.LinuxController;

/**
 * 处理与Swift Dispersion Report相关的逻辑
 * @author yuki
 * @since 2013-08-28
 */
public class HealthManipulator {
	// private static Logger LOG = Logger.getLogger(HealthManipulator.class.getName());
	private LinuxController controller;
	private String user;
	private String password;
	private String host;
	private int port;
	
	
	public HealthManipulator(){
		this.controller = new LinuxController();
	}
	
	public HealthManipulator(String host, int port, String user, String password){
		this.host = host;
		this.port = port;
		this.user = user;
		this.password = password;
		this.controller = new LinuxController(host, port, user, password);
	}
	
	/**
	 * 执行swift-dispersion-populate：在集群中创建container和object
	 * 		Usage: swift-get-nodes
	 *
	 * @return
	 */
	public String runPopulate() {
		
		String result = null;
		List<String> commands = new ArrayList<String>();
		
		// 执行命令
		commands.add("swift-dispersion-populate");
		result = controller.runCommand(commands).getResultStr();
		
		return result;
	}
	
	/**
	 * 执行swift-dispersion-report：获取集群健康状态报告
	 * 		Usage：swift-dispersion-report [-j] [--container-only] [--object-only]
	 * Example：
	 * 		$ swift-dispersion-report -j
	 * 
	 * @return
	 */
	public String getReport() {
		
		String result = null;
		List<String> commands = new ArrayList<String>();
		
		// 执行命令
		commands.add("swift-dispersion-report -j");
		result = controller.runCommand(commands).getResultStr();
		
		return result;
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
