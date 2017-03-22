package com.wanghong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wanghong.po.User;
import com.wanghong.service.DictionaryService;

/**
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseAction {

	@Autowired
	DictionaryService dictionaryService;

	@RequestMapping("login")
	public String login() throws Exception {
		// try {
		// Map<String, String> userMap = dictionaryService.getDicValueByKey("USER_ACCOUNT_INFO");
		// String username = request.getParameter("username");
		// String password = request.getParameter("password");
		// String dicPass = userMap.get(username);
		// if(StringUtils.isNotBlank(dicPass)){
		// if(Md5Util.encodeByMD5(password).equals(dicPass)){
		// request.setAttribute("menu", "index");
		// User user = new User();
		// user.setUserName(username);
		// user.setUserPassword(dicPass);
		// request.getSession().setAttribute("userInfo", user);
		// setJsonSuccess(response, null, "登录成功",RESULT_TYPE_CLOSE_BOX_FUNCTION);
		// }else{
		// setJsonFail(response, null, 1100, "密码错误,请重新输入!");
		// }
		// }else{
		// setJsonFail(response, null, 1100, "用户不存在,请重新输入!");
		// }
		// } catch (Exception e) {
		// e.printStackTrace();
		// setJsonFail(response, null, 1100, "没有用户,请联系管理员添加用户!");
		// }

		request.setAttribute("menu", "index");
		User user = new User();
		user.setUserName("suntao");
		user.setUserPassword("123456");
		request.getSession().setAttribute("userInfo", user);
		setJsonSuccess(response, null, "登录成功", RESULT_TYPE_CLOSE_BOX_FUNCTION);
		return null;
	}

	@RequestMapping("logout")
	public void logout() throws Exception {
		request.getSession().setAttribute("userInfo", null);
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}
}
