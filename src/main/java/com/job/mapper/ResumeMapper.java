package com.job.mapper;

import java.util.*;
import com.job.model.Resume;

/**
 * Created By FeastCoding.
 */
public interface ResumeMapper{
    Integer save(Resume model);

    void update(Resume model);

    void deleteById(Integer id);

    int queryByCount(Resume model);

    List<Resume> queryByList(Map paramsMap);
	
	List<Resume> queryByResume(Resume model);

    Resume queryById(Integer id);

    List<Resume> queryAll();

}