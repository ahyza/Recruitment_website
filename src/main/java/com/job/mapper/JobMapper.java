package com.job.mapper;

import java.util.*;
import com.job.model.Job;

/**
 * Created By FeastCoding.
 */
public interface JobMapper{
    Integer save(Job model);

    void update(Job model);

    void deleteById(Integer id);

    int queryByCount(Job model);

    List<Job> queryByList(Map paramsMap);
	
	List<Job> queryByJob(Job model);

    Job queryById(Integer id);

    List<Job> queryAll();

}