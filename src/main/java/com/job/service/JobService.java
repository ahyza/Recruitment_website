package com.job.service;

import com.job.model.Page;
import com.job.mapper.JobMapper;
import com.job.model.Job;
import com.job.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

/**
 * Created By FeastCoding.
 */
@Service
public class JobService {

	@Autowired
	private JobMapper mapper;

	public Integer save(Job job) {
		return mapper.save(job);
	}

	public void update(Job job) {
		mapper.update(job);
	}

	public void deleteById(Integer id) {
		mapper.deleteById(id);
	}

	public int queryByCount(Job job) {
		return mapper.queryByCount(job);
	}

	public List<Job> queryByList(Page page, Job job) {
		String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("jobName", job.getJobName());
		paramsMap.put("jobType", job.getJobType());
		paramsMap.put("jobNum", job.getJobNum());
		paramsMap.put("jobDesc", job.getJobDesc());
		paramsMap.put("jobXlyq", job.getJobXlyq());
		paramsMap.put("jobYyyq", job.getJobYyyq());
		paramsMap.put("jobSalary", job.getJobSalary());
		paramsMap.put("jobAddress", job.getJobAddress());
		paramsMap.put("jobStart", job.getJobStart());
		paramsMap.put("jobEnd", job.getJobEnd());
		paramsMap.put("companyId", job.getCompanyId());
		paramsMap.put("jobStatus", job.getJobStatus());
		paramsMap.put("pageQueryCondition", pageQueryCondition);
		return mapper.queryByList(paramsMap);
	}

	public List<Job> queryByJob(Job job) {
		return mapper.queryByJob(job);
	}

	public Job queryById(Integer id) {
		return mapper.queryById(id);
	}

	public List<Job> queryAll() {
		return mapper.queryAll();
	}

	public boolean checkType(Integer id) {
		Job job = new Job();
		job.setJobType(id.toString());
		List list = mapper.queryByJob(job);
		if (list.size() > 0) {
			return true;
		}
		return false;
	}

	public List<Job> queryJobByName(String jobName) {
		Job job = new Job();
		job.setJobName(jobName);
		return mapper.queryByJob(job);
	}

	public List<Job> queryJobByType(String jobType) {
		Job job = new Job();
		job.setJobType(jobType);
		return mapper.queryByJob(job);
	}

	public List<Job> queryByCompany(Integer id) {
		Job job = new Job();
		job.setCompanyId(id);
		return mapper.queryByJob(job);
	}
}
