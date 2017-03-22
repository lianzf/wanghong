
package com.wanghong.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanghong.mapper.ActorPayVideoMapper;
import com.wanghong.po.ActorPayVideo;

@Service
public class ActorPayVideoServiceImpl implements ActorPayVideoService {

	@Autowired
	ActorPayVideoMapper actorPayVideoMapper;
	
	@Override
	public int insert(ActorPayVideo record) throws SQLException {
		return actorPayVideoMapper.insert(record);
	}

	@Override
	public int update(ActorPayVideo record) throws SQLException {
		return actorPayVideoMapper.update(record);
	}

	@Override
	public int deleteById(Integer id) throws SQLException {
		return actorPayVideoMapper.deleteById(id);
	}

	@Override
	public ActorPayVideo getById(Integer id) throws SQLException {
		return actorPayVideoMapper.getById(id);
	}

	@Override
	public List<ActorPayVideo> getListByMap(Map<String, Object> condition) throws SQLException {
		return actorPayVideoMapper.getListByMap(condition);
	}
	
	@Override
	public List<ActorPayVideo> getListByPo(ActorPayVideo record) throws SQLException {
		return actorPayVideoMapper.getListByPo(record);
	}

	@Override
	public int count(Map<String, Object> condition) throws SQLException {
		return actorPayVideoMapper.count(condition);
	}
	
}

