package com.job.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.job.model.Company;
import com.job.model.Page;
import com.job.service.CompanyService;
import com.job.utils.PageUtils;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;

	@RequestMapping(value = "/list")
	public String list(Company company, Page page, ModelMap model) {
		page.setMaxRows(5);
		List<Company> list = companyService.queryByCompany(company);
		page = PageUtils.getPage(page, list);
		List<Company> companyList = companyService.queryByList(page, company);
		model.put("page", page);
		model.put("companyList", companyList);
		model.put("company", company);
		return "behind/company_list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "behind/company_add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Company company, HttpServletRequest request) {
		companyService.save(company);
		return "redirect:list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Company company, ModelMap model) {
		company = companyService.queryById(company.getId());
		model.put("company", company);
		return "behind/company_edit";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Company company, ModelMap model) {
		company = companyService.queryById(company.getId());
		model.put("company", company);
		return "behind/company_detail";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Company company, HttpServletRequest request) {
		companyService.update(company);
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Company company) {
		companyService.deleteById(company.getId());
		return "redirect:list";
	}

}
