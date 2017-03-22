package com.wanghong.util;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogFactory {

	private static LogFactory logFactory = new LogFactory();

	private LogFactory() {
	}

	public static LogFactory getInstance() {
		return logFactory;
	}
	
	/**
	 * 获取默认的Logger，默认为控制台
	 * 
	 * @return Logger
	 */
	public Logger getLogger() {
		return LoggerFactory.getLogger("stdout");
	}
//	/**
//     * 所有抓取信息的日志
//     */
//    public Logger getSpiderInfoLogger() {
//        return LoggerFactory.getLogger("spider_info");
//    }
//	
//	/**
//	 * 所有异常打印的日志
//	 */
//	public Logger getSpiderExceptionLogger() {
//		return LoggerFactory.getLogger("spider_exception");
//	}
//	
//	/**
//	 * 爬虫抓取到的重复信息日志
//	 */
//	public Logger getSpiderRepeatLogger() {
//		return LoggerFactory.getLogger("spider_repeat");
//	}
//	
//	/**
//	 * 视频下载异常日志
//	 */
//	public Logger getVideoDownloadExceptionLogger() {
//		return LoggerFactory.getLogger("video_download_exception");
//	}
//	
//	/**
//	 * 视频下载信息日志
//	 */
//	public Logger getVideoDownloadLogger() {
//		return LoggerFactory.getLogger("video_download");
//	}
//	
//	public Logger getVideoContentManagerLogger(){
//		return LoggerFactory.getLogger("video_content_manager");
//	}

	/**
	 * 测试方法
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		LogFactory logFactory = LogFactory.getInstance();
		Logger log = null;
		// 循环用来测试对配置文件的监控是否生效
		for (int i = 1; i < 8; i++) {
			log = logFactory.getLogger();
			log.debug("debug");
			log.info("info");
			log.warn("warn");
			log.error("error");

//			log = logFactory.getRecoverOrderLogger();
//			log.info("thread_poll_recover_order");
//
//			log = logFactory.getRecoverStateLogger();
//			log.info("thread_poll_recover_state");
//
//			log = logFactory.getRecoverSendLogger();
//			log.info("thread_poll_recover_send");
		}
	}

}
