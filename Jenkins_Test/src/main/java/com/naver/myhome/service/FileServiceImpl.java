package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Files;
import com.naver.myhome.mybatis.mapper.FileMapper;

@Service
public class FileServiceImpl implements FileService{
	
	private FileMapper mapper;
	
	@Autowired
	public FileServiceImpl(FileMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public void uploadFile(List<Files> files) {
		mapper.uploadFile(files);
	}
	
	@Override
	public List<Files> getFileList(int num) {
		return mapper.getFileList(num);
	}

	@Override
	public void updateDeleteYn(int num) {
		mapper.updateDeleteYn(num);
	}
	
	@Override
	public List<String> getDeleteFileList() {
		return mapper.getDeleteFileList();
	}

	@Override
	public void deleteFile(String filename) {
		mapper.deleteFile(filename);
	}

}
