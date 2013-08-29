package cn.edu.zju.ccnt.swift;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;

import cn.edu.zju.ccnt.constant.ServerType;
import cn.edu.zju.ccnt.model.Device;
import cn.edu.zju.ccnt.model.Ring;
import cn.edu.zju.ccnt.util.LinuxController;
import cn.edu.zju.swift.JtangSwiftAdmin;

/**
 * 处理与Ring相关的逻辑
 * @author yuki
 * @create 2013-08-23
 */
public class RingManipulator {
	
	private LinuxController controller;
	
	public RingManipulator(){
		this.controller = new LinuxController();
		controller.setHost("192.168.3.51");
		controller.setPort(22);
		controller.setUser("root");
		controller.setPassword("fs");
	}
	
	/**
	 * 获取Ring中的设备列表
	 * @return
	 */
	public List<Device> getDevcieList(String ringType){
		List<Device> devices = new ArrayList<Device>();
		
		//TODO: 向Swift集群发送请求，获取DeviceList JSON结果
		
		//TODO：将DeviceList JSON字符串转换成Device对象列表
		
		//TODO: remove these dummy data
		for(int i = 0; i < 8; i++){
			Device device = new Device();
			device.setBalance(1.00F);
			device.setDeviceID(i + 1);
			device.setDeviceName("sdb" + (i + 1));
			device.setIPAddress("192.168.1." + ((i) % 4 + 1));
			device.setMeta("");
			device.setPartitions(1839 + ((i) % 4 + 1));
			device.setPort(6020);
			device.setServerType(ServerType.ALL);
			device.setWeight(1.00F);
			device.setZoneID((i) % 4 + 1);
			
			devices.add(device);
		}
		return devices;
	}
	
	/**
	 * 向swift集群添加设备
	 * @param device
	 * @return
	 */
	public boolean addDevice(Device device){
	
		// TODO: 将device信息序列化
		
		// TODO: 向swift发送请求，添加设备
		
		return false;
	}
	
	/**
	 * 修改swift集群中设备的信息
	 * @param searchStr
	 * @param device
	 * @return
	 */
	public boolean editDevice(String searchStr, Device device){
	
		// TODO: 将device信息序列化
		
		// TODO: 向swift发送请求，添加设备
		
		return false;
	}
	
	
	/**
	 * 删除swift集群中指定的设备
	 * @param searchStr
	 * @return
	 */
	public boolean deleteDevice(String searchStr){
	
		// TODO: 将device信息序列化
		
		// TODO: 向swift发送请求，删除设备
		
		return false;
	}
	
	/**
	 * 为Swift集群创建新的Ring
	 * @param ring
	 * @return
	 */
	public boolean createRing(Ring ring){
	
		// TODO: 将ring信息序列化
		
		// TODO: 向swift发送请求，创建
		
		return true;
	}
	
	/**
	 * 设置Swift集群的ring信息，主要是replicas和min_part_hours
	 * @param ring
	 * @return
	 */
	public boolean setRingInfo(Ring ring){
	
		// TODO: 将ring信息序列化
		
		// TODO: 向swift发送请求，设置
		
		return true;
	}
	
	/**
	 * 对Swift集群的ring执行rebalance操作
	 * @param ring
	 * @return
	 */
	public boolean rebalance(List<String> rings){
		
		// TODO: 将rings信息序列化
		
		// TODO: 向swift发送请求，设置
		
		return true;
	}
	
	public String rebalance(){
		
		String result = null;
		List<String> commands = new ArrayList<String>();
		
		commands.add("cd /etc/swift");
		commands.add("swift-ring-builder object.builder rebalance");
		commands.add("swift-ring-builder container.builder rebalance");
		commands.add("swift-ring-builder account.builder rebalance");
		
		result = controller.runCommand(commands).getResultStr();
		System.out.println(result);
		return result;
	}
	
	public String remakeRings(){
		
		String result = null;
		List<String> commands = new ArrayList<String>();
		
		commands.add("remakerings");
		
		result = controller.runCommand(commands).getResultStr();
		
		return result;
	}
	
	public Map<String, String> getRingsMD5(){
		
		Map<String, String> ringsPair = new HashMap<String, String>();
		List<String> URIs = new ArrayList<String>();
		URIs.add("http://192.168.3.51:6010/");
		
		JtangSwiftAdmin admin = new JtangSwiftAdmin("dummy str");
		JSONObject rings = null;
		for(int i = 0; i < URIs.size(); i++){
			admin.setBaseUrl(URIs.get(i));
			rings =  admin.getRingMD5();
		}
		
		
		Iterator<?> it = rings.keys();  
        while (it.hasNext()) {  
            String key = (String) it.next();  
            try {
				String value = rings.getString(key);
				ringsPair.put(key, value);
			} 
            catch (JSONException e) {
				continue;
			}  
        }  
        admin.close();
        return ringsPair;
	}
}
