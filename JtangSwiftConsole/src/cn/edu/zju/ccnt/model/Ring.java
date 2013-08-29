package cn.edu.zju.ccnt.model;


/**
 * Swift Ring的基本属性对象
 * @author yuki
 * @create 2013-08-22
 */
public class Ring {
	
	private String ringType;				// Ring的类型：RingType.ACCOUNT/RingType.CONTAINER/RingType.OBJECT
	private int partitionPower = -1;		// 决定Ring中分区的数量：2的partition power次方个。默认值：18
	private int replicas = -1;				// 副本数。默认值：3
	private int minPartHours = -1;			// 一个分区被移动后，可以被再次移动的最小间隔时间。默认值：1
	
	public Ring(){
		
	}
	
	public Ring(String ringType, int partitionPower, int replicas, int minPartHours){
		this.ringType = ringType;
		this.partitionPower = partitionPower;
		this.replicas = replicas;
		this.minPartHours = minPartHours;
	}

	public String getRingType() {
		return ringType;
	}

	public void setRingType(String ringType) {
		this.ringType = ringType;
	}

	public int getPartitionPower() {
		return partitionPower;
	}

	public void setPartitionPower(int partitionPower) {
		this.partitionPower = partitionPower;
	}

	public int getReplicas() {
		return replicas;
	}

	public void setReplicas(int replicas) {
		this.replicas = replicas;
	}

	public int getMinPartHours() {
		return minPartHours;
	}

	public void setMinPartHours(int minPartHours) {
		this.minPartHours = minPartHours;
	}
	
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append(this.ringType)
		  .append(", part_power: ").append(this.partitionPower)
		  .append(", replicas: ").append(this.replicas)
		  .append(", min_part_hours: ").append(this.minPartHours);
		
		return sb.toString();
	}
	
	public String toHTMLString(){
		StringBuilder sb = new StringBuilder();
		sb.append(this.ringType)
		  .append(", &nbsp;&nbsp;part_power:&nbsp;&nbsp;").append(this.partitionPower)
		  .append(", &nbsp;&nbsp;replicas:&nbsp;&nbsp;").append(this.replicas)
		  .append(", &nbsp;&nbsp;min_part_hours:&nbsp;&nbsp;").append(this.minPartHours);
		
		return sb.toString();
	}
}
