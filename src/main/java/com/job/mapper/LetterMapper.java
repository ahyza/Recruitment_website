package com.job.mapper;

import java.util.*;
import com.job.model.Letter;

/**
 * Created By FeastCoding.
 */
public interface LetterMapper{
    Integer save(Letter model);

    void update(Letter model);

    void deleteById(Integer id);

    int queryByCount(Letter model);

    List<Letter> queryByList(Map paramsMap);
	
	List<Letter> queryByLetter(Letter model);

    Letter queryById(Integer id);

    List<Letter> queryAll();

}