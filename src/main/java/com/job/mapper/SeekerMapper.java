package com.job.mapper;

import java.util.*;
import com.job.model.Seeker;

/**
 * Created By FeastCoding.
 */
public interface SeekerMapper{
    Integer save(Seeker model);

    void update(Seeker model);

    void deleteById(Integer id);

    int queryByCount(Seeker model);

    List<Seeker> queryByList(Map paramsMap);
	
	List<Seeker> queryBySeeker(Seeker model);

    Seeker queryById(Integer id);

    List<Seeker> queryAll();

}