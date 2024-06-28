package com.job.model;

/**
 * Created By FeastCoding.
 */
public class User {
    private Integer id;
    private String userName;
    private String userPass;
    private Integer userRole;

    public Integer getId(){
      return id;
    }
    public void setId(Integer id){
      this.id = id;
    }
    public String getUserName(){
      return userName;
    }
    public void setUserName(String userName){
      this.userName = userName;
    }
    public String getUserPass(){
      return userPass;
    }
    public void setUserPass(String userPass){
      this.userPass = userPass;
    }
    public Integer getUserRole(){
      return userRole;
    }
    public void setUserRole(Integer userRole){
      this.userRole = userRole;
    }

}
