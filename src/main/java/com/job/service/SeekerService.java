package com.job.service;

import com.job.model.Page;
import com.job.mapper.SeekerMapper;
import com.job.model.Seeker;
import com.job.service.SeekerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

/**
 * Created By FeastCoding.
 */
@Service
public class SeekerService {

	@Autowired
	private SeekerMapper mapper;

	public Integer save(Seeker seeker) {
		return mapper.save(seeker);
	}

	public void update(Seeker seeker) {
		mapper.update(seeker);
	}

	public void deleteById(Integer id) {
		mapper.deleteById(id);
	}

	public int queryByCount(Seeker seeker) {
		return mapper.queryByCount(seeker);
	}

	public List<Seeker> queryByList(Page page, Seeker seeker) {
		String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("seekerName", seeker.getSeekerName());
		paramsMap.put("seekerGender", seeker.getSeekerGender());
		paramsMap.put("seekerBirth", seeker.getSeekerBirth());
		paramsMap.put("seekerMarry", seeker.getSeekerMarry());
		paramsMap.put("seekerEducation", seeker.getSeekerEducation());
		paramsMap.put("seekerEmail", seeker.getSeekerEmail());
		paramsMap.put("seekerAddress", seeker.getSeekerAddress());
		paramsMap.put("seekerOnjob", seeker.getSeekerOnjob());
		paramsMap.put("seekerImag", seeker.getSeekerImag());
		paramsMap.put("seekerResume", seeker.getSeekerResume());
		paramsMap.put("seekerUserid", seeker.getSeekerUserid());
		paramsMap.put("seekerHj", seeker.getSeekerHj());
		paramsMap.put("seekerZzd", seeker.getSeekerZzd());
		paramsMap.put("seekerEvaluation", seeker.getSeekerEvaluation());
		paramsMap.put("seekerReward", seeker.getSeekerReward());
		paramsMap.put("seekerQwgzlx", seeker.getSeekerQwgzlx());
		paramsMap.put("seekerQwgzdd", seeker.getSeekerQwgzdd());
		paramsMap.put("seekerQwxz", seeker.getSeekerQwxz());
		paramsMap.put("seekerGzjl", seeker.getSeekerGzjl());
		paramsMap.put("seekerXmjy", seeker.getSeekerXmjy());
		paramsMap.put("seekerWydj", seeker.getSeekerWydj());
		paramsMap.put("pageQueryCondition", pageQueryCondition);
		return mapper.queryByList(paramsMap);
	}

	public List<Seeker> queryBySeeker(Seeker seeker) {
		return mapper.queryBySeeker(seeker);
	}

	public Seeker queryById(Integer id) {
		return mapper.queryById(id);
	}

	public List<Seeker> queryAll() {
		return mapper.queryAll();
	}

	public Seeker queryByUser(Integer userId) {
		Seeker seeker = new Seeker();
		seeker.setSeekerUserid(userId);
		List<Seeker> list = mapper.queryBySeeker(seeker);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
