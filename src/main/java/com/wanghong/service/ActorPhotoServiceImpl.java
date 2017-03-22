
package com.wanghong.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanghong.mapper.ActorPhotoMapper;
import com.wanghong.po.ActorPhoto;

@Service
public class ActorPhotoServiceImpl implements ActorPhotoService {

	@Autowired
	ActorPhotoMapper actorPhotoMapper;
	
	@Override
	public int insert(ActorPhoto record) throws SQLException {
		return actorPhotoMapper.insert(record);
	}

	@Override
	public int update(ActorPhoto record) throws SQLException {
		return actorPhotoMapper.update(record);
	}

	@Override
	public int deleteById(Integer id) throws SQLException {
		return actorPhotoMapper.deleteById(id);
	}

	@Override
	public ActorPhoto getById(Integer id) throws SQLException {
		return actorPhotoMapper.getById(id);
	}

	@Override
	public List<ActorPhoto> getListByMap(Map<String, Object> condition) throws SQLException {
		return actorPhotoMapper.getListByMap(condition);
	}
	
	@Override
	public List<ActorPhoto> getListByPo(ActorPhoto record) throws SQLException {
		return actorPhotoMapper.getListByPo(record);
	}

	@Override
	public int count(Map<String, Object> condition) throws SQLException {
		return actorPhotoMapper.count(condition);
	}
	
}

