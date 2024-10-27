package com.job.service;

import com.job.model.Page;
import com.job.mapper.InfoMapper;
import com.job.model.Info;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

@Service
public class InfoService {

	@Autowired
	private InfoMapper mapper;

	public Integer save(Info info) {
		return mapper.save(info);
	}

	public void update(Info info) {
		mapper.update(info);
	}

	public void deleteById(Integer id) {
		mapper.deleteById(id);
	}

	public int queryByCount(Info info) {
		return mapper.queryByCount(info);
	}

	public List<Info> queryByList(Page page, Info info) {
		String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
		Map<String, Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("infoTitle", info.getInfoTitle());
		paramsMap.put("infoContent", info.getInfoContent());
		paramsMap.put("infoTime", info.getInfoTime());
		paramsMap.put("infoUserid", info.getInfoUserid());
		paramsMap.put("infoType", info.getInfoType());
		paramsMap.put("expectedSalary", info.getExpectedSalary()); // 新增
		paramsMap.put("expectedLocation", info.getExpectedLocation()); // 新增
		paramsMap.put("pageQueryCondition", pageQueryCondition);
		return mapper.queryByList(paramsMap);
	}

	public List<Info> queryByInfo(Info info) {
		return mapper.queryByInfo(info);
	}

	public Info queryById(Integer id) {
		return mapper.queryById(id);
	}

	public List<Info> queryAll() {
		return mapper.queryAll();
	}

	public List<Info> queryByUser(Integer userId) {
		Info info = new Info();
		info.setInfoUserid(userId);
		return mapper.queryByInfo(info);
	}
}
