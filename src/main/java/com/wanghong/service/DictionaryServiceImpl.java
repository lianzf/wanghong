package com.wanghong.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanghong.mapper.DataDictionaryMapper;
import com.wanghong.po.DataDictionary;
import com.wanghong.util.DateUtil;

@Service("dictionaryService")
public class DictionaryServiceImpl implements DictionaryService {

	@Autowired
	private DataDictionaryMapper dataDictionaryMapper;

	@Override
	public int insert(DataDictionary record) throws SQLException {
		record.setCreateTime(DateUtil.getCurDateTime());
		record.setUpdateTime(DateUtil.getCurDateTime());
		return dataDictionaryMapper.insert(record);
	}

	@Override
	public int update(DataDictionary record) throws SQLException {
		record.setUpdateTime(DateUtil.getCurDateTime());
		return dataDictionaryMapper.update(record);
	}

	@Override
	public int deleteById(Integer id) throws SQLException {
		return dataDictionaryMapper.deleteById(id);
	}

	@Override
	public DataDictionary getById(Integer id) throws SQLException {
		return dataDictionaryMapper.getById(id);
	}

	@Override
	public int count(Map<String, Object> condition) throws SQLException {
		return dataDictionaryMapper.count(condition);
	}

	@Override
	public DataDictionary getDicByKey(String key) throws SQLException {
		DataDictionary dictionary = new DataDictionary();
		dictionary.setName(key);
		List<DataDictionary> dataList = dataDictionaryMapper.getListByPo(dictionary);
		if (dataList != null && dataList.size() > 0)
			return dataList.get(0);
		else {
			return null;
		}
	}

	@Override
	public Map<String, String> getDicValueByKey(String key) throws SQLException {
		DataDictionary dictionary = new DataDictionary();
		Map<String, String> resMap = new HashMap<String, String>();
		dictionary.setName(key);
		List<DataDictionary> dataList = dataDictionaryMapper.getListByPo(dictionary);
		dictionary = dataList.get(0);
		if (dictionary != null) {
			String values = dictionary.getValue();
			String[] content = values.split(";");

			for (String con : content) {
				String[] kv = con.split("=");
				resMap.put(kv[0], kv[1]);
			}

		}

		return resMap;
	}


	@Override
    public List<DataDictionary> getListByPo(DataDictionary record) throws SQLException {
	    // TODO Auto-generated method stub
	    return null;
    }

	@Override
    public List<DataDictionary> getListByMap(Map<String, Object> dataMap) throws SQLException {
	    // TODO Auto-generated method stub
	    return null;
    }

}
