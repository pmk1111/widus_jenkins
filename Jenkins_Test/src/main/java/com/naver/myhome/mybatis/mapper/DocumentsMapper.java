package com.naver.myhome.mybatis.mapper;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Documents;

@Mapper
public interface DocumentsMapper {
	
	List<Documents> getDocumentDetails();

	List<Documents> getAllDocuments(Documents documents);

	List<HashMap<String, Object>> searchByKeyword(Map<String, Object> parameterMap);

}