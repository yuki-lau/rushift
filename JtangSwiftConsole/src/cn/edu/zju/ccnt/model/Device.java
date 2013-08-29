package cn.edu.zju.ccnt.model;

import org.apache.commons.lang.StringUtils;

/**
 * Swift Device的基本属性对象
 * @author yuki
 * @create 2013-08-22
 */
public class Device {
	
	private int deviceID = -1;		// 设备ID
	private int zoneID = -1;		// 设备所在zone的ID
	private String deviceName;		// 设备名称
	private String serverType;		// Device所在ring.gz类型，即device支撑的server类型：ServerType。
									// Proxy不是存储的Server，因此不作为Ring中Device的类型，Ring中的Device可以运行多个Server
	private String IPAddress;		// 设备IP
	private int port = -1;			// 设备端口号
	private float weight = -1;		// 设备weight，swift 根据weight进行balance，weight越大，被分配的分区越多
	private float balance = -1;		// 平衡度
	private long partitions = -1;	// 分区数量
	private String meta;			// 元数据
	
	public Device(){
		
	}
	
	public Device(int deviceID, int zoneID, String deviceName, String serverType, String IPAddress,
				  int port, float weight, float balance, long partitions, String meta){
		
		this.deviceID = deviceID;
		this.zoneID = zoneID;
		this.deviceName = deviceName;
		this.serverType = serverType;
		this.IPAddress = IPAddress;
		this.port = port;
		this.weight = weight;
		this.balance = balance;
		this.partitions = partitions;
		this.meta = meta;
	}

	public int getDeviceID() {
		return deviceID;
	}

	public void setDeviceID(int deviceID) {
		this.deviceID = deviceID;
	}

	public int getZoneID() {
		return zoneID;
	}

	public void setZoneID(int zoneID) {
		this.zoneID = zoneID;
	}

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public String getServerType() {
		return serverType;
	}

	public void setServerType(String serverType) {
		this.serverType = serverType;
	}

	public String getIPAddress() {
		return IPAddress;
	}

	public void setIPAddress(String iPAddress) {
		IPAddress = iPAddress;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public long getPartitions() {
		return partitions;
	}

	public void setPartitions(long partitions) {
		this.partitions = partitions;
	}

	public String getMeta() {
		return meta;
	}

	public void setMeta(String meta) {
		this.meta = meta;
	}
	
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append(this.serverType).append("\n")
		  .append("z").append(this.zoneID)
		  .append("-").append(this.IPAddress)
		  .append(":").append(this.port)
		  .append("/").append(this.deviceName);
		
		if(!StringUtils.isEmpty(this.meta)){
			sb.append("_").append(this.meta);
		}
		
		sb.append(" ").append(this.weight);
		
		return sb.toString();
	}
	
	public String toHTMLString(){
		StringBuilder sb = new StringBuilder();
		sb.append(this.serverType).append("&nbsp;&nbsp;&nbsp;&nbsp;")
		  .append("z").append(this.zoneID)
		  .append("-").append(this.IPAddress)
		  .append(":").append(this.port)
		  .append("/").append(this.deviceName);
		
		if(!StringUtils.isEmpty(this.meta)){
			sb.append("_").append(this.meta);
		}
		
		sb.append("&nbsp;&nbsp;&nbsp;&nbsp;").append(this.weight);
		
		return sb.toString();
	}
	
}
