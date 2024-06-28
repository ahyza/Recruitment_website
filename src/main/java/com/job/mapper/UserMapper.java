package com.job.mapper;

import java.util.*;
import com.job.model.User;

/**
 * Created By FeastCoding.
 */
public interface UserMapper{
    Integer save(User model);

    void update(User model);

    void deleteById(Integer id);

    int queryByCount(User model);

    List<User> queryByList(Map paramsMap);
	
	List<User> queryByUser(User model);

    User queryById(Integer id);

    List<User> queryAll();

    User login(User user);
}