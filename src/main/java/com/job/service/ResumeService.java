package com.job.service;

import com.job.model.Page;
import com.job.mapper.ResumeMapper;
import com.job.model.Resume;
import com.job.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

/**
 * Created By FeastCoding.
 */
@Service
public class ResumeService {

	@Autowired
	private ResumeMapper mapper;

	public Integer save(Resume resume) {
		return mapper.save(resume);
	}

	public void update(Resume resume) {
		mapper.update(resume);
	}

	public void deleteById(Integer id) {
		mapper.deleteById(id);
	}

	public int queryByCount(Resume resume) {
		return mapper.queryByCount(resume);
	}

	public List<Resume> queryByList(Page page, Resume resume) {
		String pageQueryCondition = " limit " + page.getStart() + " , " + page.getMaxRows();
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("companyId", resume.getCompanyId());
		paramsMap.put("jobId", resume.getJobId());
		paramsMap.put("seekerId", resume.getSeekerId());
		paramsMap.put("resumeName", resume.getResumeName());
		paramsMap.put("resumeStatus", resume.getResumeStatus());
		paramsMap.put("pageQueryCondition", pageQueryCondition);
		return mapper.queryByList(paramsMap);
	}

	public List<Resume> queryByResume(Resume resume) {
		return mapper.queryByResume(resume);
	}

	public Resume queryById(Integer id) {
		return mapper.queryById(id);
	}

	public List<Resume> queryAll() {
		return mapper.queryAll();
	}

	public boolean check(Integer jobId, Integer seekerId) {
		Resume resume = new Resume();
		resume.setJobId(jobId);
		resume.setSeekerId(seekerId);
		List list = mapper.queryByResume(resume);
		if (list.size() > 0) {
			return true;
		}
		return false;
	}

	public List<Resume> queryBySeeker(Integer seekerId) {
		Resume resume = new Resume();
		resume.setSeekerId(seekerId);
		return mapper.queryByResume(resume);
	}

	public List<Resume> queryByCompany(Integer companyId) {
		Resume resume = new Resume();
		resume.setCompanyId(companyId);
		return mapper.queryByResume(resume);
	}
}
