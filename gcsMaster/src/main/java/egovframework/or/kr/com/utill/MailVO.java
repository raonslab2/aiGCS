package egovframework.or.kr.com.utill;

import java.io.Serializable;
 
public class MailVO implements Serializable{
	
	private static final long serialVersionUID = -8274004534207618049L;
	
	/**
	 * 
	 */ 
	String sendMail;	

	String receiveMail;
	
	String password;
	
	String title;
	
	String txt;
	

	public String getSendMail() {
		return sendMail;
	}

	public void setSendMail(String sendMail) {
		this.sendMail = sendMail;
	}

	public String getReceiveMail() {
		return receiveMail;
	}

	public void setReceiveMail(String receiveMail) {
		this.receiveMail = receiveMail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

 
	
	 
 
}
