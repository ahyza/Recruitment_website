package com.job.model;

/**
 * Created By FeastCoding.
 */
public class Job {
    private Integer id;
    private String jobName;
    private String jobType;
    private Integer jobNum;
    private String jobDesc;
    private String jobXlyq;
    private String jobYyyq;
    private String jobSalary;
    private String jobAddress;
    private String jobStart;
    private String jobEnd;
    private Integer companyId;
    private Integer jobStatus;
    private Company company;

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
    public String getJobName(){
      return jobName;
    }
    public void setJobName(String jobName){
      this.jobName = jobName;
    }
    public String getJobType(){
      return jobType;
    }
    public void setJobType(String jobType){
      this.jobType = jobType;
    }
    public Integer getJobNum(){
      return jobNum;
    }
    public void setJobNum(Integer jobNum){
      this.jobNum = jobNum;
    }
    public String getJobDesc(){
      return jobDesc;
    }
    public void setJobDesc(String jobDesc){
      this.jobDesc = jobDesc;
    }
    public String getJobXlyq(){
      return jobXlyq;
    }
    public void setJobXlyq(String jobXlyq){
      this.jobXlyq = jobXlyq;
    }
    public String getJobYyyq(){
      return jobYyyq;
    }
    public void setJobYyyq(String jobYyyq){
      this.jobYyyq = jobYyyq;
    }
    public String getJobSalary(){
      return jobSalary;
    }
    public void setJobSalary(String jobSalary){
      this.jobSalary = jobSalary;
    }
    public String getJobAddress(){
      return jobAddress;
    }
    public void setJobAddress(String jobAddress){
      this.jobAddress = jobAddress;
    }
    public String getJobStart(){
      return jobStart;
    }
    public void setJobStart(String jobStart){
      this.jobStart = jobStart;
    }
    public String getJobEnd(){
      return jobEnd;
    }
    public void setJobEnd(String jobEnd){
      this.jobEnd = jobEnd;
    }
    public Integer getCompanyId(){
      return companyId;
    }
    public void setCompanyId(Integer companyId){
      this.companyId = companyId;
    }
    public Integer getJobStatus(){
      return jobStatus;
    }
    public void setJobStatus(Integer jobStatus){
      this.jobStatus = jobStatus;
    }

}
