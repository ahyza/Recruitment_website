package com.job.mapper;

import java.util.*;
import com.job.model.Company;

/**
 * Created By FeastCoding.
 */
public interface CompanyMapper{
    Integer save(Company model);

    void update(Company model);

    void deleteById(Integer id);

    int queryByCount(Company model);

    List<Company> queryByList(Map paramsMap);
	
	List<Company> queryByCompany(Company model);

    Company queryById(Integer id);

    List<Company> queryAll();

}