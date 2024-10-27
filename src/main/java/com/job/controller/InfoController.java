package com.job.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.model.Info;
import com.job.model.Page;
import com.job.service.InfoService;
import com.job.utils.PageUtils;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/info")
public class InfoController {
	@Autowired
	private InfoService infoService;

	@RequestMapping(value = "/list")
	public String list(Info info, Page page, ModelMap model) {
		page.setMaxRows(5);
		List<Info> list = infoService.queryByInfo(info);
		page = PageUtils.getPage(page, list);
		List<Info> infoList = infoService.queryByList(page, info);
		model.put("page", page);
		model.put("infoList", infoList);
		model.put("info", info);
		return "behind/info_list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "behind/info_add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Info info, HttpServletRequest request) {
		// 添加预期薪资和预期地点
		info.setExpectedSalary(Double.parseDouble(request.getParameter("expectedSalary")));
		info.setExpectedLocation(request.getParameter("expectedLocation"));
		infoService.save(info);
		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Info info, ModelMap model) {
		info = infoService.queryById(info.getId());
		model.put("info", info);
		return "behind/info_edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Info info, HttpServletRequest request) {
		// 更新预期薪资和预期地点
		info.setExpectedSalary(Double.parseDouble(request.getParameter("expectedSalary")));
		info.setExpectedLocation(request.getParameter("expectedLocation"));
		infoService.update(info);
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Info info) {
		infoService.deleteById(info.getId());
		return "redirect:list";
	}
}
