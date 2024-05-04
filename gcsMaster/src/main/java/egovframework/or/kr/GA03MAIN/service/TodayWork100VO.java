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
public class TodayWork100VO implements Serializable{ 
	
	private static final long serialVersionUID = -9219604963667233010L;
	
	private	int	tdNum	;
	private	String	tdClassification	;
	private	String	tdService	;
	private	String	tdSubject	;
	private	String	tdOrder	;
	private	String	tdWorker	;
	private	String	tdOrderTime	;
	private	String	tdWorkSt	;
	private	String	tdProgressStatus	;
	private	String	tdEvent	;
	
	
	public int getTdNum() {
		return tdNum;
	}
	public void setTdNum(int tdNum) {
		this.tdNum = tdNum;
	}
	public String getTdClassification() {
		return tdClassification;
	}
	public void setTdClassification(String tdClassification) {
		this.tdClassification = tdClassification;
	}
	public String getTdService() {
		return tdService;
	}
	public void setTdService(String tdService) {
		this.tdService = tdService;
	}
	public String getTdSubject() {
		return tdSubject;
	}
	public void setTdSubject(String tdSubject) {
		this.tdSubject = tdSubject;
	}
	public String getTdOrder() {
		return tdOrder;
	}
	public void setTdOrder(String tdOrder) {
		this.tdOrder = tdOrder;
	}
	public String getTdWorker() {
		return tdWorker;
	}
	public void setTdWorker(String tdWorker) {
		this.tdWorker = tdWorker;
	}
	public String getTdOrderTime() {
		return tdOrderTime;
	}
	public void setTdOrderTime(String tdOrderTime) {
		this.tdOrderTime = tdOrderTime;
	}
	public String getTdWorkSt() {
		return tdWorkSt;
	}
	public void setTdWorkSt(String tdWorkSt) {
		this.tdWorkSt = tdWorkSt;
	}
	public String getTdProgressStatus() {
		return tdProgressStatus;
	}
	public void setTdProgressStatus(String tdProgressStatus) {
		this.tdProgressStatus = tdProgressStatus;
	}
	public String getTdEvent() {
		return tdEvent;
	}
	public void setTdEvent(String tdEvent) {
		this.tdEvent = tdEvent;
	}

	
      
     
}
