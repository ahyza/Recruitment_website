package com.job.model;

/**
 * Created By FeastCoding.
 */
public class Letter {
    private Integer id;
    private String letterTitle;
    private String letterContent;
    private Integer letterSend;
    private Integer letterReceive;
    private Integer letterStatus;
    private User send;
    private User receive;

    public User getReceive() {
		return receive;
	}
	public void setReceive(User receive) {
		this.receive = receive;
	}
	public User getSend() {
		return send;
	}
	public void setSend(User send) {
		this.send = send;
	}
	public Integer getId(){
      return id;
    }
    public void setId(Integer id){
      this.id = id;
    }
    public String getLetterTitle(){
      return letterTitle;
    }
    public void setLetterTitle(String letterTitle){
      this.letterTitle = letterTitle;
    }
    public String getLetterContent(){
      return letterContent;
    }
    public void setLetterContent(String letterContent){
      this.letterContent = letterContent;
    }
    public Integer getLetterSend(){
      return letterSend;
    }
    public void setLetterSend(Integer letterSend){
      this.letterSend = letterSend;
    }
    public Integer getLetterReceive(){
      return letterReceive;
    }
    public void setLetterReceive(Integer letterReceive){
      this.letterReceive = letterReceive;
    }
    public Integer getLetterStatus(){
      return letterStatus;
    }
    public void setLetterStatus(Integer letterStatus){
      this.letterStatus = letterStatus;
    }

}
