package com.job.model;

/**
 * Created By FeastCoding.
 */
public class Resume {
    private Integer id;
    private Integer companyId;
    private Integer jobId;
    private Integer seekerId;
    private String resumeName;
    private Integer resumeStatus;
    private Seeker seeker;
    private Job job;
    private Company company;

    public Seeker getSeeker() {
		return seeker;
	}
	public void setSeeker(Seeker seeker) {
		this.seeker = seeker;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public Integer getId(){
      return id;
    }
    public void setId(Integer id){
      this.id = id;
    }
    public Integer getCompanyId(){
      return companyId;
    }
    public void setCompanyId(Integer companyId){
      this.companyId = companyId;
    }
    public Integer getJobId(){
      return jobId;
    }
    public void setJobId(Integer jobId){
      this.jobId = jobId;
    }
    public Integer getSeekerId(){
      return seekerId;
    }
    public void setSeekerId(Integer seekerId){
      this.seekerId = seekerId;
    }
    public String getResumeName(){
      return resumeName;
    }
    public void setResumeName(String resumeName){
      this.resumeName = resumeName;
    }
    public Integer getResumeStatus(){
      return resumeStatus;
    }
    public void setResumeStatus(Integer resumeStatus){
      this.resumeStatus = resumeStatus;
    }

}
