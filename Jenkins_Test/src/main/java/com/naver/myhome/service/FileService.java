package com.naver.myhome.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Files;

public interface FileService {
	public void uploadFile(List<Files> files);
	
	public List<Files> getFileList(int num);
	
	public void updateDeleteYn(int num);
	
	public List<String> getDeleteFileList();
	
	public void deleteFile(String filename);

}
