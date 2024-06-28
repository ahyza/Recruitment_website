package com.job.mapper;

import java.util.*;
import com.job.model.Info;

/**
 * Created By FeastCoding.
 */
public interface InfoMapper{
    Integer save(Info model);

    void update(Info model);

    void deleteById(Integer id);

    int queryByCount(Info model);

    List<Info> queryByList(Map paramsMap);
	
	List<Info> queryByInfo(Info model);

    Info queryById(Integer id);

    List<Info> queryAll();

}