package cn.edu.zju.ccnt.model;

public class ServiceStatus {
	
	private int pid;
	private float cpuUsage;
	private float memUsage;
	private String startTime;
	private String cpuTime;
	private String status;
	private String cmdName;
	
	public ServiceStatus(){
		
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public float getCpuUsage() {
		return cpuUsage;
	}

	public void setCpuUsage(float cpuUsage) {
		this.cpuUsage = cpuUsage;
	}

	public float getMemUsage() {
		return memUsage;
	}

	public void setMemUsage(float memUsage) {
		this.memUsage = memUsage;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getCpuTime() {
		return cpuTime;
	}

	public void setCpuTime(String cpuTime) {
		this.cpuTime = cpuTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCmdName() {
		return cmdName;
	}

	public void setCmdName(String cmdName) {
		this.cmdName = cmdName;
	}

	public String toString(){
		StringBuilder sb = new StringBuilder();
		
		sb.append(this.pid).append("\t")
		  .append(this.cpuUsage).append("\t")
		  .append(this.memUsage).append("\t")
		  .append(this.startTime).append("\t")
		  .append(this.cpuTime).append("\t")
		  .append(this.status).append("\t")
		  .append(this.cmdName);
		
		return sb.toString();
	}
}
