package com.wanghong.service;

import java.sql.SQLException;
import java.util.Map;

import com.wanghong.po.DataDictionary;


public interface DictionaryService extends CommonService<DataDictionary> {

	DataDictionary getDicByKey(String key) throws SQLException;

	Map<String, String> getDicValueByKey(String key) throws SQLException;
}
