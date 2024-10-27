package com.job.model;

/**
 * Created By FeastCoding.
 */
public class Info {
    private Integer id;
    private String infoTitle;
    private String infoContent;
    private String infoTime;
    private Integer infoUserid;
    private Integer infoType;
    private Double expectedSalary; // 预期薪资
    private String expectedLocation; // 预期地点
    private User user;

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getInfoTitle() {
        return infoTitle;
    }
    public void setInfoTitle(String infoTitle) {
        this.infoTitle = infoTitle;
    }
    public String getInfoContent() {
        return infoContent;
    }
    public void setInfoContent(String infoContent) {
        this.infoContent = infoContent;
    }
    public String getInfoTime() {
        return infoTime;
    }
    public void setInfoTime(String infoTime) {
        this.infoTime = infoTime;
    }
    public Integer getInfoUserid() {
        return infoUserid;
    }
    public void setInfoUserid(Integer infoUserid) {
        this.infoUserid = infoUserid;
    }
    public Integer getInfoType() {
        return infoType;
    }
    public void setInfoType(Integer infoType) {
        this.infoType = infoType;
    }
    public Double getExpectedSalary() {
        return expectedSalary;
    }
    public void setExpectedSalary(Double expectedSalary) {
        this.expectedSalary = expectedSalary;
    }
    public String getExpectedLocation() {
        return expectedLocation;
    }
    public void setExpectedLocation(String expectedLocation) {
        this.expectedLocation = expectedLocation;
    }
}
