package com.job.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.model.Job;
import com.job.model.Page;
import com.job.service.JobService;
import com.job.utils.PageUtils;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/job")
public class JobController {
	@Autowired
	private JobService jobService;

	@RequestMapping(value = "/list")
	public String list(Job job, Page page, ModelMap model) {
		page.setMaxRows(5);
		List<Job> list = jobService.queryByJob(job);
		page = PageUtils.getPage(page, list);
		List<Job> jobList = jobService.queryByList(page, job);
		model.put("page", page);
		model.put("jobList", jobList);
		model.put("job", job);
		return "behind/job_list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "behind/job_add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Job job, HttpServletRequest request) {
		jobService.save(job);
		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Job job, ModelMap model) {
		job = jobService.queryById(job.getId());
		model.put("job", job);
		return "behind/job_edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Job job, HttpServletRequest request) {
		jobService.update(job);
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Job job) {
		jobService.deleteById(job.getId());
		return "redirect:list";
	}

}
