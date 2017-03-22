package com.wanghong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Comment;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.apache.bcel.generic.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wanghong.constant.Constant;
import com.wanghong.po.Actor;
import com.wanghong.po.DataDictionary;
import com.wanghong.service.ActorService;
import com.wanghong.util.LogFactory;

@Controller
@RequestMapping("/actor")
public class ActorController extends BaseAction {

	@Autowired
	private ActorService actorService;

	@RequestMapping(value = "actor")
	public String actor() {
		request.setAttribute("menu", "actor");
		return "actor/actor";
	}
	
	@RequestMapping(value = "getInfo")
	public String getInfo() throws Exception {
		request.setAttribute("menu", "actor");
		/**
		 * 从session中获取信息，并根据权限get用户
		 */
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)) {
			Actor actor = actorService.getById(Integer.parseInt(id));
			request.setAttribute("actor", actor);
		}
		return "actor/actorInfo";
	}	

	@RequestMapping(value = "add")
	public String add() {
		request.setAttribute("menu", "actor");
		return "actor/actorAdd";
	}

	@RequestMapping("getActorList")
	@ResponseBody
	public void getList() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		// 用于添加查询条件的map
		groupSortMap(model);

		model.put("name", StringUtils.isNotBlank(request.getParameter("name")) ? request.getParameter("name") : null);
		model.put("nickname", StringUtils.isNotBlank(request.getParameter("nickname")) ? request.getParameter("nickname") : null);
		model.put("phone", StringUtils.isNotBlank(request.getParameter("phone")) ? request.getParameter("phone") : null);
		model.put("state", StringUtils.isNotBlank(request.getParameter("state")) ? request.getParameter("state") : null);
		model.put("startTime", StringUtils.isNotBlank(request.getParameter("startTime")) ? request.getParameter("startTime") : null);
		model.put("endTime", StringUtils.isNotBlank(request.getParameter("endTime")) ? request.getParameter("endTime") : null);

		// 根据查询条件查询的的数据信息并获取数据的总量
		int count = actorService.count(model);
		recordsTotal = count;
		// 分页显示上面查询出的数据结果
		List<Actor> data = actorService.getListByMap(model);
		String serverSavePath = getImgFilePath();
		recordsFiltered = recordsTotal;
		recordsDisplay = data.size();
		this.writerToClient(data, iDisplayLength, recordsDisplay, recordsFiltered, recordsTotal, start);
	}

	@RequestMapping("addActor")
	public void addActor() throws Exception {
		Actor actor = new Actor();
		try {
			DataDictionary dictionary = dictionaryService.getDicByKey("file_save_path");
			String serverSavePath = dictionary.getValue();
			Map<String, Object> uploadResultMap = fileUpload(serverSavePath, "icon");
			String icon = (String) uploadResultMap.get("filePath");
			if(StringUtils.isBlank(icon)) {
				throw new Exception("图片上传失败");
			}
			actor.setIcon(icon);
		}
		catch(Exception e) {
			setJsonFail(response, null, 1100, e.getMessage());
			return;
		}
		try {
			actor.setName(request.getParameter("name"));
			actor.setNickname(request.getParameter("nickname"));
			actor.setPhone(request.getParameter("phone"));
			actor.setPassword(request.getParameter("password"));
			actor.setSignature(request.getParameter("signature"));// 个性签名
			actor.setIntroduction(request.getParameter("introduction"));// 自我介绍
			actor.setState(Integer.parseInt(request.getParameter("state")));
			actor.setSex(StringUtils.isNotBlank(request.getParameter("sex")) ? Integer.parseInt(request.getParameter("sex")) : 2);
			actor.setAge(StringUtils.isNotBlank(request.getParameter("age")) ? Integer.parseInt(request.getParameter("age")) : 21);
			actor.setProvice(request.getParameter("provice"));
			actor.setCity(request.getParameter("city"));
			actor.setChannel(request.getParameter("channel"));
			actor.setPrice(StringUtils.isNotBlank(request.getParameter("price")) ? Integer.parseInt(request.getParameter("price")) : 0);
			actor.setFenchengbi(StringUtils.isNotBlank(request.getParameter("fenchengbi")) ? Integer.parseInt(request.getParameter("fenchengbi")) : 0);
			actor.setBankAccount(request.getParameter("bankAccount"));
			actor.setRemarks(request.getParameter("remarks"));
			actor.setQq(request.getParameter("qq"));
			actor.setWechat(request.getParameter("wechat"));
			actor.setCreator(request.getParameter("creator"));
			actor.setCreateTime(new Date());
			int id = actorService.insert(actor);
			setJsonSuccess(response, null, "添加成功", RESULT_TYPE_CLOSE_BOX_FUNCTION);
		}
		catch(Exception e) {
			LogFactory.getInstance().getLogger().error("添加主播信息失败：", e);
			setJsonFail(response, null, 1100, "添加主播信息失败,请检查添加信息是否重复！");
		}
	}

	@RequestMapping("edit")
	public String edit() throws Exception {
		request.setAttribute("menu", "actor");
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)) {
			Actor actor = actorService.getById(Integer.parseInt(id));
			request.setAttribute("actor", actor);
			request.setAttribute("imageHref", "../downloadFile.jsp?identity=" + getImgFilePath() + "&path=" + actor.getIcon());
		}
		return "actor/actorEdit";
	}

	@RequestMapping("editActor")
	public void editActor() throws Exception {
		Actor actor = new Actor();
		try {
			DataDictionary dictionary = dictionaryService.getDicByKey("file_save_path");
			String serverSavePath = dictionary.getValue();
			Map<String, Object> uploadResultMap = fileUpload(serverSavePath, "icon");
			String icon = (String) uploadResultMap.get("filePath");
			if(!StringUtils.isBlank(icon)) {
				actor.setIcon(icon);
				// throw new Exception("图片上传失败");
			}

		}
		catch(Exception e) {
			setJsonFail(response, null, 1100, e.getMessage());
			return;
		}
		try {
			actor.setId(Integer.parseInt(request.getParameter("id")));
			actor.setName(request.getParameter("name"));
			actor.setNickname(request.getParameter("nickname"));
			actor.setPhone(request.getParameter("phone"));
			actor.setPassword(request.getParameter("password"));
			actor.setSignature(request.getParameter("signature"));// 个性签名
			actor.setIntroduction(request.getParameter("introduction"));// 自我介绍
			actor.setState(Integer.parseInt(request.getParameter("state")));
			actor.setSex(StringUtils.isNotBlank(request.getParameter("sex")) ? Integer.parseInt(request.getParameter("sex")) : 2);
			actor.setAge(StringUtils.isNotBlank(request.getParameter("age")) ? Integer.parseInt(request.getParameter("age")) : 21);
			actor.setProvice(request.getParameter("provice"));
			actor.setCity(request.getParameter("city"));
			actor.setChannel(request.getParameter("channel"));
			actor.setPrice(StringUtils.isNotBlank(request.getParameter("price")) ? Integer.parseInt(request.getParameter("price")) : 0);
			actor.setFenchengbi(StringUtils.isNotBlank(request.getParameter("fenchengbi")) ? Integer.parseInt(request.getParameter("fenchengbi")) : 0);
			actor.setBankAccount(request.getParameter("bankAccount"));
			actor.setRemarks(request.getParameter("remarks"));
			actor.setQq(request.getParameter("qq"));
			actor.setWechat(request.getParameter("wechat"));
			LogFactory.getInstance().getLogger().error("更新信息：" + actor);
			int id = actorService.update(actor);
			setJsonSuccess(response, null, "更新成功", RESULT_TYPE_CLOSE_BOX_FUNCTION);
		}
		catch(Exception e) {
			LogFactory.getInstance().getLogger().error("系统错误：" + e.getMessage());
			setJsonFail(response, null, 1100, "修改失败,请检查修改信息是否重复！");
		}
	}

	@RequestMapping("onlineActor")
	public void onlineActor() throws Exception {
		try {
			Integer id = Integer.valueOf(request.getParameter("id"));
			Integer state = StringUtils.isNotBlank(request.getParameter("state")) ? Integer.parseInt(request.getParameter("state")) : -1;
			if(state == 0)
				state = 1;
			else
				state = 0;
			Actor actor = new Actor();
			actor.setId(id);
			actor.setState(state);
			actorService.update(actor);
			this.writerToClient("操作成功");// 成功
		}
		catch(Exception e) {
			LogFactory.getInstance().getLogger().error("无法获取id或状态，也可能是更新错误", e);
			this.writerToClient("服务器错误");// 成功
		}
	}

	// @RequestMapping("getActorById")
	// public void getActorById() throws Exception{
	// String id = request.getParameter("id");
	// Actor actor = null;
	// if(StringUtils.isNotBlank(id)){
	// actor = actorService.selectById(Integer.parseInt(request.getParameter("id")));
	// }
	// Gson g = new GsonBuilder().serializeNulls().create();
	// this.writerToClient(g.toJson(actor));
	// }

	// @RequestMapping("addVideo")
	// public String addVideo() throws Exception {
	// request.setAttribute("menu", "actor");
	// return "actor/videoAdd";
	// }
	// @RequestMapping("addTag")
	// public String addTag() throws Exception {
	// request.setAttribute("menu", "actor");
	// request.setAttribute("actorId", request.getParameter("id"));
	// return "actor/actorTagAdd";
	// }
	//
	// @RequestMapping("showVideo")
	// public String showVideo() throws Exception {
	// request.setAttribute("menu", "actor");
	// return "actor/showVideo";
	// }
}
