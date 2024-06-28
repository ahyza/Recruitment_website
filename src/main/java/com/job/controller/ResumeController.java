package com.job.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.model.Resume;
import com.job.model.Page;
import com.job.service.ResumeService;
import com.job.utils.PageUtils;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	@Autowired
	private ResumeService resumeService;

	@RequestMapping(value = "/list")
	public String list(Resume resume, Page page, ModelMap model) {
		page.setMaxRows(5);
		List<Resume> list = resumeService.queryByResume(resume);
		page = PageUtils.getPage(page, list);
		List<Resume> resumeList = resumeService.queryByList(page, resume);
		model.put("page", page);
		model.put("resumeList", resumeList);
		model.put("resume", resume);
		return "behind/resume_list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "behind/resume_add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Resume resume, HttpServletRequest request) {
		resumeService.save(resume);
		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Resume resume, ModelMap model) {
		resume = resumeService.queryById(resume.getId());
		model.put("resume", resume);
		return "behind/resume_edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Resume resume, HttpServletRequest request) {
		resumeService.update(resume);
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Resume resume) {
		resumeService.deleteById(resume.getId());
		return "redirect:list";
	}

}
