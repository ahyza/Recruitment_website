package com.job.model;

/**
 * Created By FeastCoding.
 */
public class Company {
    private Integer id;
    private String companyName;
    private String companyLogo;
    private String companyUser;
    private Integer companyUserid;
    private Integer companyType;
    private String companyDesc;
    private String companyScale;
    private String companyAddress;
    private String companyEmail;
    private String companyPhone;
    private String companyManager;
    private String companyTel;

    public Integer getId(){
      return id;
    }
    public void setId(Integer id){
      this.id = id;
    }
    public String getCompanyName(){
      return companyName;
    }
    public void setCompanyName(String companyName){
      this.companyName = companyName;
    }
    public String getCompanyLogo(){
      return companyLogo;
    }
    public void setCompanyLogo(String companyLogo){
      this.companyLogo = companyLogo;
    }
    public String getCompanyUser(){
      return companyUser;
    }
    public void setCompanyUser(String companyUser){
      this.companyUser = companyUser;
    }
    public Integer getCompanyUserid(){
      return companyUserid;
    }
    public void setCompanyUserid(Integer companyUserid){
      this.companyUserid = companyUserid;
    }
    public Integer getCompanyType(){
      return companyType;
    }
    public void setCompanyType(Integer companyType){
      this.companyType = companyType;
    }
    public String getCompanyDesc(){
      return companyDesc;
    }
    public void setCompanyDesc(String companyDesc){
      this.companyDesc = companyDesc;
    }
    public String getCompanyScale(){
      return companyScale;
    }
    public void setCompanyScale(String companyScale){
      this.companyScale = companyScale;
    }
    public String getCompanyAddress(){
      return companyAddress;
    }
    public void setCompanyAddress(String companyAddress){
      this.companyAddress = companyAddress;
    }
    public String getCompanyEmail(){
      return companyEmail;
    }
    public void setCompanyEmail(String companyEmail){
      this.companyEmail = companyEmail;
    }
    public String getCompanyPhone(){
      return companyPhone;
    }
    public void setCompanyPhone(String companyPhone){
      this.companyPhone = companyPhone;
    }
    public String getCompanyManager(){
      return companyManager;
    }
    public void setCompanyManager(String companyManager){
      this.companyManager = companyManager;
    }
    public String getCompanyTel(){
      return companyTel;
    }
    public void setCompanyTel(String companyTel){
      this.companyTel = companyTel;
    }

}
