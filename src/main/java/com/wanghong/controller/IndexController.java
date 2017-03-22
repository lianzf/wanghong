package com.wanghong.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanghong.service.ActorService;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseAction {
	@Autowired
	ActorService actorService;
	
	@RequestMapping("index")
	public String index() throws Exception{
		request.setAttribute("menu", "index");
		int commentCount = 1;
		int actorCount = 1;
		Map<String,Object> videoMap = new HashMap<String,Object>();
		videoMap.put("result", 1);
		int videoCount = 1;
		request.setAttribute("commentCount", commentCount);
		request.setAttribute("actorCount", actorCount);
		request.setAttribute("videoCount", videoCount);
		return "index";
	}
}
