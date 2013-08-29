package cn.edu.zju.ccnt.util;

import java.io.ByteArrayInputStream;
import java.io.PrintStream;
import java.util.List;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.log4j.Logger;
import org.apache.sshd.ClientChannel;
import org.apache.sshd.ClientSession;
import org.apache.sshd.SshClient;
import org.apache.sshd.common.util.NoCloseInputStream;
import org.apache.sshd.common.util.NoCloseOutputStream;

/**
 * Linux控制类，在Java环境中运行远端Linux机器的命令，并获得执行结果
 * @author yuki
 * @since 2013-07-31
 */
public class LinuxController {
	
	private static Logger LOG = Logger.getLogger(LinuxController.class.getName());
	
	private String user;
	private String password;
	private String host;
	private int port = 22;
	
	public class ResultWrapper{
		private int resultStat;
		private String resultStr;
		
		
		public ResultWrapper(){
			
		}
		
		public ResultWrapper(int resultStat, String resultStr){
			this.resultStat = resultStat;
			this.resultStr = resultStr;
		}

		public int getResultStat() {
			return resultStat;
		}

		public void setResultStat(int resultStat) {
			this.resultStat = resultStat;
		}

		public String getResultStr() {
			return resultStr;
		}

		public void setResultStr(String resultStr) {
			this.resultStr = resultStr;
		}
	}
	
	public LinuxController(){
		
	}
	
	public LinuxController(String host, int port, String user, String password){
		this.host = host;
		this.port = port;
		this.user = user;
		this.password = password;
	}

	/**
	 * 执行Linux命令
	 * @param commands
	 * @return
	 */
	public ResultWrapper runCommand(List<String> commands){
		
		int result = -1;
		
		// 创建SSH Client实例、输出流实例
        SshClient client = SshClient.setUpDefaultClient();
        ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
        
        // 启动SSH Client
        client.start();
        
        try {
        	// 创建客户端会话
            ClientSession session = client.connect(host, port).await().getSession();
            
            // 登录Linux服务器
            int ret = ClientSession.WAIT_AUTH;
            while ((ret & ClientSession.WAIT_AUTH) != 0) {
                session.authPassword(user, password);
                ret = session.waitFor(ClientSession.WAIT_AUTH 
                		| ClientSession.CLOSED 
                		| ClientSession.AUTHED, 0);
            }
            
            // 若登录失败返回 -1
            if ((ret & ClientSession.CLOSED) != 0) {
            	LOG.error("Unable to login [" + host + ":" + port + "], by user[" 
                		+ user + "] password[" + password + "].");
                return new ResultWrapper(-1, null);
            }
            
            if(commands != null){
            	// 创建命令字符串
            	StringBuilder commandStr = new StringBuilder();
            	for(int i = 0; i < commands.size(); i++){
            		commandStr.append(commands.get(i)).append(";\r");
            	}
            	commandStr.append("exit 0;\n");
            	
            	// 执行Linux命令
            	ClientChannel channel = session.createChannel(ClientChannel.CHANNEL_SHELL);
	            channel.setIn(new NoCloseInputStream(new ByteArrayInputStream(commandStr.toString().getBytes())));
	            channel.setOut(new NoCloseOutputStream(new PrintStream(byteOut)));
	            channel.setErr(new NoCloseOutputStream(System.err));
	            channel.open().await();
	            channel.waitFor(ClientChannel.CLOSED, 0);

	            result = channel.getExitStatus();
            }
            else{
            	LOG.error("List<String> commands can not be null!");
            }
            
            session.close(false);
        } 
        catch (Exception e) {
        	LOG.error(e.getMessage(), e);
		} 
        finally {
            client.stop();
        }
        
        return (new ResultWrapper(result, new String(byteOut.toByteArray())));
	}
	
	
    public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public static void main(String[] args) throws Exception {
//		LinuxController controller = new LinuxController();
//		controller.setHost("192.168.3.51");
//		controller.setPort(22);
//		controller.setUser("root");
//		controller.setPassword("fs");
//		
//		List<ServiceStatus> serviceList = controller.mergeService(controller.getServiceStatus());
//		for(ServiceStatus line: serviceList){
//			System.out.println(line.toString());
//		}
		
/* this section is the orignal code, keep it in case for crash.
        int port = 22;
        String host = "192.168.3.51";
        String login = "root";
        boolean agentForward = false;
        List<String> command =  null;
        SshClient client = SshClient.setUpDefaultClient();
        String str= "startmain;\r exit 0;\n";
        ByteArrayInputStream in ; 
        ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
        PrintStream out = new PrintStream( byteOut ); 
        client.start();
        try {
            boolean hasKeys = false;
            ClientSession session = client.connect(host, port).await().getSession();
            int ret = ClientSession.WAIT_AUTH;
            while ((ret & ClientSession.WAIT_AUTH) != 0) {
                if (hasKeys) {
                    session.authAgent(login);
                    ret = session.waitFor(ClientSession.WAIT_AUTH | ClientSession.CLOSED | ClientSession.AUTHED, 0);
                } 
                else {           
                    String password ="fs";
                    session.authPassword(login, password);
                    ret = session.waitFor(ClientSession.WAIT_AUTH | ClientSession.CLOSED | ClientSession.AUTHED, 0);
                }
            }
            if ((ret & ClientSession.CLOSED) != 0) {
                System.err.println("error");
                System.exit(-1);
            }
            ClientChannel channel = null;
            if (command == null) {
                channel = session.createChannel(ClientChannel.CHANNEL_SHELL);
                ((ChannelShell) channel).setAgentForwarding(agentForward);
                in=  new ByteArrayInputStream( str.getBytes());
                channel.setIn(new NoCloseInputStream(   in )  );
            }  
            channel.setOut(new NoCloseOutputStream( out));
            channel.setErr(new NoCloseOutputStream(System.err));
            channel.open().await();
            channel.waitFor(ClientChannel.CLOSED, 0);
            
            session.close(false);
        } 
        finally {
        	System.out.println( new String( byteOut.toByteArray()) );
            client.stop();
        }
 */
    }
}