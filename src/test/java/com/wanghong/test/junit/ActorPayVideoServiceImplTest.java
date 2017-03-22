package com.wanghong.test.junit;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.wanghong.po.ActorPayVideo;
import com.wanghong.service.ActorPayVideoService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING) //按字母顺序执行method
public class ActorPayVideoServiceImplTest extends BaseTest {
	@Autowired
	ActorPayVideoService actorPayVideoService;
	
	@Test
	public void a_insertTest() throws SQLException {
		ActorPayVideo po = new ActorPayVideo();
	  	po.setActorId(1);
	  	po.setType(1);
	  	po.setSavePath("SavePath");
	  	po.setPrice(1);
	  	po.setIntroduction("Introduction");
	  	po.setStatus(1);
	  	po.setReason("Reason");
	  	po.setCreateTime(new java.util.Date(System.currentTimeMillis()));
		int result = actorPayVideoService.insert(po);
		System.out.println("insert result = " + result);
	}

	@Test
	public void b_updateTest() throws SQLException {
		ActorPayVideo po = new ActorPayVideo();
	  	po.setId(1);
	  	po.setActorId(1);
	  	po.setType(1);
	  	po.setSavePath("SavePath_update");
	  	po.setPrice(1);
	  	po.setIntroduction("Introduction_update");
	  	po.setStatus(1);
	  	po.setReason("Reason_update");
	  	po.setCreateTime(new java.util.Date());
		int result = actorPayVideoService.update(po);
		System.out.println("update result = " + result);		
	}


	@Test
	public void c_getByIdTest() throws SQLException {
		ActorPayVideo po = actorPayVideoService.getById(1);
		System.out.println("getByIdTest result = " + po);
	}

	@Test
	public void d_getListByMapTest() throws SQLException {
		Map<String, Object> condition = new HashMap<String, Object>();
	  	condition.put("id", 1);
	  	condition.put("actorId", 1);
	  	condition.put("type", 1);
	  	condition.put("savePath", "savePath");
	  	condition.put("price", 1);
	  	condition.put("introduction", "introduction");
	  	condition.put("status", 1);
	  	condition.put("reason", "reason");
	  	condition.put("createTime", new java.util.Date());
		List<ActorPayVideo> result = actorPayVideoService.getListByMap(condition);
		for(ActorPayVideo po : result) {
			System.out.println("list:" + po);
		}
	}
	
	@Test
	public void e_getListByPoTest() throws SQLException {
		ActorPayVideo po = new ActorPayVideo();
	  	po.setId(1);
	  	po.setActorId(1);
	  	po.setType(1);
	  	po.setSavePath("SavePath");
	  	po.setPrice(1);
	  	po.setIntroduction("Introduction");
	  	po.setStatus(1);
	  	po.setReason("Reason");
	  	po.setCreateTime(new java.util.Date());
		List<ActorPayVideo> result = actorPayVideoService.getListByPo(po);
		for(ActorPayVideo obj : result) {
			System.out.println("list:" + obj);
		}		
	}

	@Test
	public void f_countTest() throws SQLException {
		Map<String, Object> condition = new HashMap<String, Object>();
	  	condition.put("id", 1);
	  	condition.put("actorId", 1);
	  	condition.put("type", 1);
	  	condition.put("savePath", "savePath");
	  	condition.put("price", 1);
	  	condition.put("introduction", "introduction");
	  	condition.put("status", 1);
	  	condition.put("reason", "reason");
	  	condition.put("createTime", new java.util.Date());
		int result = actorPayVideoService.count(condition);
		System.out.println("countTest result = " + result);
	}
	
	@Test
	public void g_deleteByIdTest() throws SQLException {
		int result = actorPayVideoService.deleteById(1);
		System.out.println("delete result = " + result);
	}
	
}