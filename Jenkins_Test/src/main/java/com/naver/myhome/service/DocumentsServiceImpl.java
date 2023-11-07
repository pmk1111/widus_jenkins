package com.naver.myhome.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Documents;
import com.naver.myhome.domain.User;
import com.naver.myhome.mybatis.mapper.DocumentsMapper;

@Service
public class DocumentsServiceImpl implements DocumentsService {
	
	private DocumentsMapper dao;

	   
	   @Autowired
	   public DocumentsServiceImpl(DocumentsMapper dao) {
	      this.dao = dao;
	   }


	@Override
	public List<Documents> getDocumentDetails() {
		return dao.getDocumentDetails();
	}


	@Override
	public List<Documents> getAllDocuments(Documents documents) {
		return dao.getAllDocuments(documents);
	}


	@Override
	public List<HashMap<String, Object>> searchByKeyword(Map<String, Object> parameterMap) {
		return dao.searchByKeyword(parameterMap);
	}


}
