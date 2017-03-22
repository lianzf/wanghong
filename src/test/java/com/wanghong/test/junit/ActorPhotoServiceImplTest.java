package com.wanghong.test.junit;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import com.wanghong.po.ActorPhoto;
import com.wanghong.service.ActorPhotoService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING) //按字母顺序执行method
public class ActorPhotoServiceImplTest extends BaseTest {
	@Autowired
	ActorPhotoService actorPhotoService;
	
	@Test
	public void a_insertTest() throws SQLException {
		ActorPhoto po = new ActorPhoto();
	  	po.setActorId(1);
	  	po.setContent("Content");
	  	po.setSavePath("SavePath");
	  	po.setPrice(1);
	  	po.setStatus(1);
	  	po.setCreateTime(new java.util.Date(System.currentTimeMillis()));
	  	po.setUpdateTime(new java.util.Date(System.currentTimeMillis()));
		int result = actorPhotoService.insert(po);
		System.out.println("insert result = " + result);
	}

	@Test
	public void b_updateTest() throws SQLException {
		ActorPhoto po = new ActorPhoto();
	  	po.setId(1);
	  	po.setActorId(1);
	  	po.setContent("Content_update");
	  	po.setSavePath("SavePath_update");
	  	po.setPrice(1);
	  	po.setStatus(1);
	  	po.setCreateTime(new java.util.Date());
	  	po.setUpdateTime(new java.util.Date());
		int result = actorPhotoService.update(po);
		System.out.println("update result = " + result);		
	}


	@Test
	public void c_getByIdTest() throws SQLException {
		ActorPhoto po = actorPhotoService.getById(1);
		System.out.println("getByIdTest result = " + po);
	}

	@Test
	public void d_getListByMapTest() throws SQLException {
		Map<String, Object> condition = new HashMap<String, Object>();
	  	condition.put("id", 1);
	  	condition.put("actorId", 1);
	  	condition.put("content", "content");
	  	condition.put("savePath", "savePath");
	  	condition.put("price", 1);
	  	condition.put("status", 1);
	  	condition.put("createTime", new java.util.Date());
	  	condition.put("updateTime", new java.util.Date());
		List<ActorPhoto> result = actorPhotoService.getListByMap(condition);
		for(ActorPhoto po : result) {
			System.out.println("list:" + po);
		}
	}
	
	@Test
	public void e_getListByPoTest() throws SQLException {
		ActorPhoto po = new ActorPhoto();
	  	po.setId(1);
	  	po.setActorId(1);
	  	po.setContent("Content");
	  	po.setSavePath("SavePath");
	  	po.setPrice(1);
	  	po.setStatus(1);
	  	po.setCreateTime(new java.util.Date());
	  	po.setUpdateTime(new java.util.Date());
		List<ActorPhoto> result = actorPhotoService.getListByPo(po);
		for(ActorPhoto obj : result) {
			System.out.println("list:" + obj);
		}		
	}

	@Test
	public void f_countTest() throws SQLException {
		Map<String, Object> condition = new HashMap<String, Object>();
	  	condition.put("id", 1);
	  	condition.put("actorId", 1);
	  	condition.put("content", "content");
	  	condition.put("savePath", "savePath");
	  	condition.put("price", 1);
	  	condition.put("status", 1);
	  	condition.put("createTime", new java.util.Date());
	  	condition.put("updateTime", new java.util.Date());
		int result = actorPhotoService.count(condition);
		System.out.println("countTest result = " + result);
	}
	
	@Test
	public void g_deleteByIdTest() throws SQLException {
		int result = actorPhotoService.deleteById(1);
		System.out.println("delete result = " + result);
	}
	
}