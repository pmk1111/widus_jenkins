package com.naver.myhome.aop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class LogAdvice {
	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
	
	//LogAdvicd 클래스의 공통 메소드를 aop에서 Advice라고 한다
	public void beforeLog() {
		logger.info("[LogAdvice : 공통 메서드.]");
	}
}
