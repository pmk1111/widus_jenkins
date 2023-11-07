package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.naver.myhome.domain.Documents;

public interface DocumentsService {
	List<Documents> getDocumentDetails();

	List<Documents> getAllDocuments(Documents documents);

	List<HashMap<String, Object>> searchByKeyword(Map<String, Object> parameterMap);
}
