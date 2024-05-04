package egovframework.or.kr.GA03MAIN.service;

import java.io.Serializable;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2022.03.08    민병안          최초 생성
 *
 *  @author 개발팀 박지욱
 *  @since 2022.03.08
 *  @version 1.0
 *  @see
 *  
 */
public class DeviceVO implements Serializable{ 
	
	private static final long serialVersionUID = -9219604963667233010L;
	
	private	String aiPk ="";	
	private	String dlPk ="";
	private	String deviceId ="";	
	private	String aiDeviceName ="";
	private	String aiDeviceAlias ="";
	private	String aiDeviceType ="";
	private	String aiAgency ="";
	private	String aiMemo ="";
	private	String aiRegisterName ="";
	private	String aiWriteTime ="";
	private	String aiDeviceCode ="";
	private	String aiRegisterId =""; 
	 
	private	String aiDevicename;
	private	String aiDevicetype; 
	private	String aiRegistername;
	private	String aiWritetime;
	private	String aiDevicecode;
	private	String aiRegisterid; 
	private	String aiDevicealias;
	
	

	public String getAiDevicename() {
		return aiDevicename;
	}
	public void setAiDevicename(String aiDevicename) {
		this.aiDevicename = aiDevicename;
	}
	public String getAiDevicetype() {
		return aiDevicetype;
	}
	public void setAiDevicetype(String aiDevicetype) {
		this.aiDevicetype = aiDevicetype;
	}
	public String getAiRegistername() {
		return aiRegistername;
	}
	public void setAiRegistername(String aiRegistername) {
		this.aiRegistername = aiRegistername;
	}
	public String getAiWritetime() {
		return aiWritetime;
	}
	public void setAiWritetime(String aiWritetime) {
		this.aiWritetime = aiWritetime;
	}
	public String getAiDevicecode() {
		return aiDevicecode;
	}
	public void setAiDevicecode(String aiDevicecode) {
		this.aiDevicecode = aiDevicecode;
	}
	public String getAiRegisterid() {
		return aiRegisterid;
	}
	public void setAiRegisterid(String aiRegisterid) {
		this.aiRegisterid = aiRegisterid;
	}
	public String getAiDevicealias() {
		return aiDevicealias;
	}
	public void setAiDevicealias(String aiDevicealias) {
		this.aiDevicealias = aiDevicealias;
	}
	private	String aiUse =""; 
	
	public String getAiUse() {
		return aiUse;
	}
	public void setAiUse(String aiUse) {
		this.aiUse = aiUse;
	}
	
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	
	public String getDlPk() {
		return dlPk;
	}
	public void setDlPk(String aiPk) {
		this.dlPk = dlPk;
	}
	
	public String getAiPk() {
		return aiPk;
	}
	public void setAiPk(String aiPk) {
		this.aiPk = aiPk;
	}
	public String getAiDeviceName() {
		return aiDeviceName;
	}
	public String getAiDeviceAlias() {
		return aiDeviceAlias;
	}
	public void setAiDeviceAlias(String aiDeviceAlias) {
		this.aiDeviceAlias = aiDeviceAlias;
	}
	public void setAiDeviceName(String aiDeviceName) {
		this.aiDeviceName = aiDeviceName;
	}
	public String getAiDeviceType() {
		return aiDeviceType;
	}
	public void setAiDeviceType(String aiDeviceType) {
		this.aiDeviceType = aiDeviceType;
	}
	public String getAiAgency() {
		return aiAgency;
	}
	public void setAiAgency(String aiAgency) {
		this.aiAgency = aiAgency;
	}
	public String getAiMemo() {
		return aiMemo;
	}
	public void setAiMemo(String aiMemo) {
		this.aiMemo = aiMemo;
	}
	public String getAiRegisterName() {
		return aiRegisterName;
	}
	public void setAiRegisterName(String aiRegisterName) {
		this.aiRegisterName = aiRegisterName;
	}
	public String getAiWriteTime() {
		return aiWriteTime;
	}
	public void setAiWriteTime(String aiWriteTime) {
		this.aiWriteTime = aiWriteTime;
	}
	public String getAiDeviceCode() {
		return aiDeviceCode;
	}
	public void setAiDeviceCode(String aiDeviceCode) {
		this.aiDeviceCode = aiDeviceCode;
	}
	public String getAiRegisterId() {
		return aiRegisterId;
	}
	public void setAiRegisterId(String aiRegisterId) {
		this.aiRegisterId = aiRegisterId;
	}

	
     
}
