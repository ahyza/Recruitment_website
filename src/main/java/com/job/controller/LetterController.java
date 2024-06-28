package com.job.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.model.Letter;
import com.job.model.Page;
import com.job.service.LetterService;
import com.job.utils.PageUtils;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/letter")
public class LetterController {
	@Autowired
	private LetterService letterService;

	@RequestMapping(value = "/list")
	public String list(Letter letter, Page page, ModelMap model) {
		page.setMaxRows(5);
		List<Letter> list = letterService.queryByLetter(letter);
		page = PageUtils.getPage(page, list);
		List<Letter> letterList = letterService.queryByList(page, letter);
		model.put("page", page);
		model.put("letterList", letterList);
		model.put("letter", letter);
		return "behind/letter_list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "behind/letter_add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Letter letter, HttpServletRequest request) {
		letterService.save(letter);
		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Letter letter, ModelMap model) {
		letter = letterService.queryById(letter.getId());
		model.put("letter", letter);
		return "behind/letter_edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Letter letter, HttpServletRequest request) {
		letterService.update(letter);
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Letter letter) {
		letterService.deleteById(letter.getId());
		return "redirect:list";
	}

}
