package com.job.controller;

import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.model.User;
import com.job.model.Page;
import com.job.service.UserService;
import com.job.utils.DbOperate;
import com.job.utils.PageUtils;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/list")
	public String list(User user, Page page, ModelMap model) {
		page.setMaxRows(5);
		List<User> list = userService.queryByUser(user);
		page = PageUtils.getPage(page, list);
		List<User> userList = userService.queryByList(page, user);
		model.put("page", page);
		model.put("userList", userList);
		model.put("user", user);
		return "behind/user_list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "behind/user_add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(User user, HttpServletRequest request, ModelMap model) {
		if(userService.check(user.getUserName())) {
			model.put("mes", "用户名已存在");
			return "forward:list";
		}
		userService.save(user);
		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(User user, ModelMap model) {
		user = userService.queryById(user.getId());
		model.put("user", user);
		return "behind/user_edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(User user, HttpServletRequest request) {
		userService.update(user);
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(User user) {
		userService.deleteById(user.getId());
		return "redirect:list";
	}

	/**
	 * 后台登录
	 * 
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, ModelMap model, HttpSession session) {
		User u = userService.login(user);
		if (u != null && u.getUserRole() == 3) {
			session.setAttribute("admin", u);
			return "behind/index";
		} else {
			model.put("mes", "用户名或密码错误");
			return "behind/login";
		}
	}

	/**
	 * 后台退出登录
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "behind/login";
	}
	/**
	 * 跳转到数据备份页面
	 * @return
	 */
	@RequestMapping(value = "/data")
	public String data() {
		return "behind/data";
	}
	
	/**
	 * 数据备份
	 * @return
	 */
	@RequestMapping(value = "/backup")
	public String backup(ModelMap model){
		try {
			DbOperate.dbBackUp("root", "123456", "job", "E:/", DbOperate.fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("mes", "数据备份成功");
		return "behind/data";
	}
	/**
	 * 数据恢复
	 * @return
	 */
	@RequestMapping(value = "/recovery")
	public String recovery(ModelMap model){
		File f = new File(DbOperate.filePath);
		if(!f.exists()){
			model.put("mes", "未备份，不能进行数据恢复");
		}else{
			DbOperate.dbRestore("root", "123456", "job", "E://"+DbOperate.fileName);
		}
		model.put("mes", "数据恢复成功");
		return "behind/data";
	}

}
