package com.job.service;

import com.job.model.Page;
import com.job.mapper.UserMapper;
import com.job.model.User;
import com.job.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

/**
 * Created By FeastCoding.
 */
@Service
public class UserService {

	@Autowired
	private UserMapper mapper;

	public Integer save(User user) {
		return mapper.save(user);
	}

	public void update(User user) {
		mapper.update(user);
	}

	public void deleteById(Integer id) {
		mapper.deleteById(id);
	}

	public int queryByCount(User user) {
		return mapper.queryByCount(user);
	}

	public List<User> queryByList(Page page, User user) {
		String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("userName", user.getUserName());
		paramsMap.put("userPass", user.getUserPass());
		paramsMap.put("userRole", user.getUserRole());
		paramsMap.put("pageQueryCondition", pageQueryCondition);
		return mapper.queryByList(paramsMap);
	}

	public List<User> queryByUser(User user) {
		return mapper.queryByUser(user);
	}

	public User queryById(Integer id) {
		return mapper.queryById(id);
	}

	public List<User> queryAll() {
		return mapper.queryAll();
	}

	public User login(User user) {
		return mapper.login(user);
	}

	public boolean check(String userName) {
		User user = new User();
		user.setUserName(userName);
		List list = mapper.queryByUser(user);
		if (list.size() > 0) {
			return true;
		}
		return false;
	}
}
