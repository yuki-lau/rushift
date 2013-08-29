package cn.edu.zju.ccnt.swift;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import cn.edu.zju.ccnt.util.LinuxController;

/**
 * 处理与Swift Audit相关的逻辑
 * @author yuki
 * @since 2013-08-28
 */
public class AuditManipulator {
	// private static Logger LOG = Logger.getLogger(AuditManipulator.class.getName());
	private LinuxController controller;
	private String user;
	private String password;
	private String host;
	private int port;
	
	
	public AuditManipulator(){
		this.controller = new LinuxController();
	}
	
	public AuditManipulator(String host, int port, String user, String password){
		this.host = host;
		this.port = port;
		this.user = user;
		this.password = password;
		this.controller = new LinuxController(host, port, user, password);
	}
	
	/**
	 * 执行swift-get-nodes：查看一个具体的account、container 或 object在集群中的位置
	 * 		Usage: swift-get-nodes [-a] <ring.gz> <account> [<container>] [<object>]
	 * 		Or: swift-get-nodes [-a] <ring.gz> -p partition
	 * Example:
	 * 		$ /usr/local/bin/swift-get-nodes /etc/swift/account.ring.gz MyAccount
	 * 
	 * @param ringType
	 * @param account
	 * @param container
	 * @param object
	 * @return
	 */
	public String getNodes(String ringType, String account, String container, String object) {
		
		String result = null;
		StringBuilder command = new StringBuilder("swift-get-nodes");
		List<String> commands = new ArrayList<String>();
		
		// 添加命令中的ring[必须]
		if(StringUtils.isEmpty(ringType)){
			return result;
		}
		command.append(" /etc/swift/").append(ringType).append(".ring.gz");

		// 添加命令中的account[必须]
		if(StringUtils.isEmpty(account)){
			return result;
		}
		command.append(" ").append(account);

		// 添加命令中的container[可选]
		if(!StringUtils.isEmpty(container)){
			command.append(" ").append(container);
		}
		
		// 添加命令中的object[可选]
		if(!StringUtils.isEmpty(object)){
			command.append(" ").append(object);
		}
		
		System.out.println(command);
		
		// 执行命令
		commands.add(command.toString());
		result = controller.runCommand(commands).getResultStr();
		
		return result;
	}
	
	/**
	 * 执行swift-object-info：在服务器上查询一个object的详细信息
	 * 		Usage：swift-object-info <physical path>
	 * Example：
	 * 		$ swift-object-info /srv/1/node/sdb1/objects/85/7b3/00154fdabc30d5ac627151c796e5f7b3/1372764123.08199.data
	 * 
	 * @param host
	 * @param physicalPath
	 * @return
	 */
	public String getObjectInfo(String host, String physicalPath) {
		
		String result = null;
		StringBuilder command = new StringBuilder("swift-object-info");
		List<String> commands = new ArrayList<String>();
		
		// 添加命令中的physical path[必须]
		if(StringUtils.isEmpty(physicalPath)){
			return result;
		}
		command.append(" ").append(physicalPath);
		
		// 设置新的主机地址[可选]
		if(!StringUtils.isEmpty(host)){
			controller.setHost(host);
		}

		System.out.println(command);
		
		// 执行命令
		commands.add(command.toString());
		result = controller.runCommand(commands).getResultStr();
		
		return result;
	}
	
	/**
	 * 执行swift-account-audit：审计账号，获取账号中mismatch信息
	 * 		Usage：swift-account-audit <account>
	 * Example:
	 * 		$ swift-account-audit AUTH_test
	 * 
	 * @param account
	 * @return
	 */
	public String accountAudit(String account) {
		
		String result = null;
		StringBuilder command = new StringBuilder("swift-account-audit");
		List<String> commands = new ArrayList<String>();
		
		// 添加命令中的account[必须]
		if(StringUtils.isEmpty(account)){
			return result;
		}
		command.append(" ").append(account);

		System.out.println(command);
		
		// 执行命令
		commands.add(command.toString());
		result = controller.runCommand(commands).getResultStr();
		
		return result;
	}

	/**
	 * 执行swift-drive-audit：审计驱动，如有有驱动失败了则将其卸载
	 * 		Usage: swift-drive-audit CONFIG_FILE
	 * Configuration Option(default):
	 * 		log_facility		LOG_LOCAL0		Syslog log facility
	 * 		log_level			INFO			Log level
	 * 		device_dir			/srv/node		Directory devices are mounted under
	 * 		minutes				60				Number of minutes to look back in /var/log/kern.log
	 * 		error_limit			1				Number of errors to find before a device is unmounted
	 * 		log_file_pattern	/var/log/kern*	Location of the log file with globbing pattern to check against device errors
	 * 		regex_pattern_X		(see guide)		Regular expression patterns to be used to locate device blocks with errors in the log file
	 * 
	 * @param conf
	 * @return
	 */
	public String driveAudit(Map<String, String> conf){
		
		String result = null;
		
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
