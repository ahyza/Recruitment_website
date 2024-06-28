package com.job.service;

import com.job.model.Page;
import com.job.mapper.CompanyMapper;
import com.job.model.Company;
import com.job.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

/**
 * Created By FeastCoding.
 */
@Service
public class CompanyService {

	@Autowired
	private CompanyMapper mapper;

	public Integer save(Company company) {
		return mapper.save(company);
	}

	public void update(Company company) {
		mapper.update(company);
	}

	public void deleteById(Integer id) {
		mapper.deleteById(id);
	}

	public int queryByCount(Company company) {
		return mapper.queryByCount(company);
	}

	public List<Company> queryByList(Page page, Company company) {
		String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("companyName", company.getCompanyName());
		paramsMap.put("companyLogo", company.getCompanyLogo());
		paramsMap.put("companyUser", company.getCompanyUser());
		paramsMap.put("companyUserid", company.getCompanyUserid());
		paramsMap.put("companyType", company.getCompanyType());
		paramsMap.put("companyDesc", company.getCompanyDesc());
		paramsMap.put("companyScale", company.getCompanyScale());
		paramsMap.put("companyAddress", company.getCompanyAddress());
		paramsMap.put("companyEmail", company.getCompanyEmail());
		paramsMap.put("companyPhone", company.getCompanyPhone());
		paramsMap.put("companyManager", company.getCompanyManager());
		paramsMap.put("companyTel", company.getCompanyTel());
		paramsMap.put("pageQueryCondition", pageQueryCondition);
		return mapper.queryByList(paramsMap);
	}

	public List<Company> queryByCompany(Company company) {
		return mapper.queryByCompany(company);
	}

	public Company queryById(Integer id) {
		return mapper.queryById(id);
	}

	public List<Company> queryAll() {
		return mapper.queryAll();
	}

	public Company queryByUser(Integer userId) {
		Company company = new Company();
		company.setCompanyUserid(userId);
		List<Company> list = mapper.queryByCompany(company);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
