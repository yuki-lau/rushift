

import cn.edu.zju.swift.JtangSwiftAdmin;

public class JtangSwiftAdminTest {
	
	public static void main(String args[]){
		
		JtangSwiftAdmin admin = new JtangSwiftAdmin("http://192.168.3.51:6010/");
		
		// {"processes":2694,"15m":0.05,"1m":0,"5m":0.01,"tasks":"1/404"}
		System.out.println(admin.getLoad());
		
		// {"async_pending":0}
		System.out.println(admin.getAsync());
		
		// {"/srv/1/node":["sdb1"]}
		System.out.println(admin.getDevices());
		
		// [{"device":"sdb1","avail":"","used":"","mounted":false,"size":""}]
		System.out.println(admin.getDiskUsage());
		
		// {"VmallocUsed":"359612 kB","CommitLimit":"4970960 kB","MemTotal":"3943336 kB","Writeback":"0 kB","Inactive":"533312 kB","SwapFree":"2999292 kB","Mlocked":"0 kB","KernelStack":"3256 kB","Unevictable":"0 kB","Cached":"713628 kB","NFS_Unstable":"0 kB","SReclaimable":"40776 kB","Mapped":"103940 kB","Bounce":"0 kB","HugePages_Free":"0","Buffers":"69284 kB","Shmem":"171040 kB","DirectMap2M":"4040704 kB","WritebackTmp":"0 kB","SUnreclaim":"27060 kB","Inactive(anon)":"170264 kB","VmallocChunk":"34359374548 kB","PageTables":"27712 kB","Active(file)":"248832 kB","HugePages_Total":"0","SwapTotal":"2999292 kB","MemFree":"2458124 kB","VmallocTotal":"34359738367 kB","Active(anon)":"530724 kB","AnonPages":"529948 kB","HugePages_Rsvd":"0","SwapCached":"0 kB","AnonHugePages":"0 kB","Active":"779556 kB","Slab":"67836 kB","HugePages_Surp":"0","Inactive(file)":"363048 kB","DirectMap4k":"55296 kB","Committed_AS":"2795472 kB","Dirty":"284 kB","HardwareCorrupted":"0 kB","Hugepagesize":"2048 kB"}
		System.out.println(admin.getMem());
		
		// [{"path":"/","device":"rootfs"},{"path":"/sys","device":"sysfs"},{"path":"/proc","device":"proc"},{"path":"/dev","device":"udev"},{"path":"/dev/pts","device":"devpts"},{"path":"/run","device":"tmpfs"},{"path":"/","device":"/dev/disk/by-uuid/8afb61fb-965f-4065-a173-633c2e1d2a2d"},{"path":"/sys/fs/fuse/connections","device":"none"},{"path":"/sys/kernel/debug","device":"none"},{"path":"/sys/kernel/security","device":"none"},{"path":"/run/lock","device":"none"},{"path":"/run/shm","device":"none"},{"path":"/mnt/sdb1","device":"/dev/loop0"},{"path":"/boot","device":"/dev/sda6"},{"path":"/home","device":"/dev/sda8"},{"path":"/root/.gvfs","device":"gvfs-fuse-daemon"}]
		System.out.println(admin.getMounted());
		
		// {"containers":0,"accounts":0,"objects":0}
		System.out.println(admin.getQuarantined());
		
		// {"object_replication_time":10.64672030210495}
		System.out.println(admin.getReplication());
		
		// {"/etc/swift/account.ring.gz":"54f5716dbbf0fe572b033f1d597b9573","/etc/swift/object.ring.gz":"7f420ba6eca30832e7437e035fe1db3a","/etc/swift/container.ring.gz":"44d11088d3c0f6079b245a5f610cd110"}
		System.out.println(admin.getRingMD5());
		
		// {"orphan":0,"tcp_in_use":26,"tcp_mem_allocated_bytes":20480,"tcp6_in_use":3,"time_wait":0}
		System.out.println(admin.getSocketStat());
		
		// [{"device":"sdb1","mounted":false}]
		System.out.println(admin.getUnmounted());
		
		// {"account_audits_failed":null,"account_audits_since":null,"account_auditor_pass_completed":null,"account_audits_passed":null}
		System.out.println(admin.getAuditor("account"));
		
		// {"container_auditor_pass_completed":null,"container_audits_since":null,"container_audits_passed":null,"container_audits_failed":null}
		System.out.println(admin.getAuditor("container"));
		
		// {"object_auditor_stats_ALL":null,"object_auditor_stats_ZBF":null}
		System.out.println(admin.getAuditor("object"));
		
		// {"replication_stats":{"no_change":0,"remove":0,"diff":0,"hashmatch":0,"attempted":4,"diff_capped":0,"rsync":0,"failure":8,"start":1.375339112859524E9,"empty":0,"success":0,"remote_merge":0,"ts_repl":0},"replication_time":0.0076580047607421875}
		System.out.println(admin.getReplication("account"));
		
		// {"replication_stats":{"no_change":37,"remove":1,"diff":3,"hashmatch":0,"attempted":28,"diff_capped":0,"rsync":0,"failure":20,"start":1.375339029086708E9,"empty":0,"success":39,"remote_merge":0,"ts_repl":0},"replication_time":62.359681844711304}
		System.out.println(admin.getReplication("container"));
		
		// {"object_replication_time":10.64672030210495}
		System.out.println(admin.getReplication("object"));
		
		// {"container_updater_sweep":5.4795567989349365}
		System.out.println(admin.getUpdater("container"));
		
		// {"object_updater_sweep":0.014729976654052734}
		System.out.println(admin.getUpdater("object"));
		
		admin.close();
	}
}
