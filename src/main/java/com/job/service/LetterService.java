package com.job.service;

import com.job.model.Page;
import com.job.mapper.LetterMapper;
import com.job.model.Letter;
import com.job.service.LetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

/**
 * Created By FeastCoding.
 */
@Service
public class LetterService{

        @Autowired
        private LetterMapper mapper;

        public Integer save(Letter letter){
			return mapper.save(letter);
        }
        
        public void update(Letter letter){
			mapper.update(letter);
        }
        
        public void deleteById(Integer id){
			mapper.deleteById(id);
        }
        
        public int queryByCount(Letter letter){
			return mapper.queryByCount(letter);
        }
		
        public List<Letter> queryByList(Page page, Letter letter){
			String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
			Map<String, Object> paramsMap = new HashMap<String, Object>();
		    paramsMap.put("letterTitle", letter.getLetterTitle());
		    paramsMap.put("letterContent", letter.getLetterContent());
		    paramsMap.put("letterSend", letter.getLetterSend());
		    paramsMap.put("letterReceive", letter.getLetterReceive());
		    paramsMap.put("letterStatus", letter.getLetterStatus());
		    paramsMap.put("pageQueryCondition", pageQueryCondition);
			return mapper.queryByList(paramsMap);
        }
		
        public List<Letter> queryByLetter(Letter letter){
			return mapper.queryByLetter(letter);
        }
		
        public Letter queryById(Integer id){
			return mapper.queryById(id);
        }

        public List<Letter> queryAll(){
			return mapper.queryAll();
        }
}
