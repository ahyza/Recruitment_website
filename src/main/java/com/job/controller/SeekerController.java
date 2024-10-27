package com.job.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.model.Seeker;
import com.job.model.Page;
import com.job.service.SeekerService;
import com.job.utils.PageUtils;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/seeker")
public class SeekerController {
	@Autowired
	private SeekerService seekerService;

	@RequestMapping(value = "/list")
	public String list(Seeker seeker, Page page, ModelMap model) {
		page.setMaxRows(5);
		List<Seeker> list = seekerService.queryBySeeker(seeker);
		page = PageUtils.getPage(page, list);
		List<Seeker> seekerList = seekerService.queryByList(page, seeker);
		model.put("page", page);
		model.put("seekerList", seekerList);
		model.put("seeker", seeker);
		return "behind/seeker_list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "behind/seeker_add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Seeker seeker, HttpServletRequest request) {
		seekerService.save(seeker);
		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Seeker seeker, ModelMap model) {
		seeker = seekerService.queryById(seeker.getId());
		model.put("seeker", seeker);
		return "behind/seeker_edit";
	}
//
//	@RequestMapping(value = "/detail", method = RequestMethod.GET)
//	public String detail(Seeker seeker, ModelMap model) {
//		seeker = seekerService.queryById(seeker.getId());
//		model.put("seeker", seeker);
//		return "behind/seeker_detail";
//	}
@RequestMapping(value = "/detail", method = RequestMethod.GET)
public String detail(Seeker seeker, ModelMap model) {
	// 如果传入了id，则通过id查询
	if (seeker.getId() != null) {
		seeker = seekerService.queryById(seeker.getId());
	}
	// 如果没有id但传入了seekerName，则通过seekerName查询
	else if (seeker.getSeekerName() != null ) {
		seeker = seekerService.queryByName(seeker.getSeekerName());
	}

//	 将查询到的求职者信息传递给前端
	model.put("seeker", seeker);

	return "behind/seeker_detail";
}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Seeker seeker, HttpServletRequest request) {
		seekerService.update(seeker);
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Seeker seeker) {
		seekerService.deleteById(seeker.getId());
		return "redirect:list";
	}

}
