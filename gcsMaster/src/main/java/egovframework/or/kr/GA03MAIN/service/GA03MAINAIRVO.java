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
public class GA03MAINAIRVO implements Serializable{ 
	
	private static final long serialVersionUID = -9219604963667233010L;
	
	private	String aiPk ="";
	
	private	String aiDevicecode ="";
	
	private	String aiDevicename ="";
	 
	private	String aiDevicealias ="";
  
	private String aiDevicetype = "";
	
	private String aiAgency = "";
	
	private String aiMemo = "";
	
	private String aiRegisterid = "";
	
	private String aiRegistername = ""; 

	private String aiUse = ""; 
	
	private int droneCnt = 0; 
	
	private String droneAction = ""; 
	
	private int searchDroneCnt = 0;
	
	private String searchDroneAction = "";
	
	private int swPk = 0; 
	private String droneTitle = ""; 
	
	public int getSwPk() {
		return swPk;
	}

	public void setSwPk(int swPk) {
		this.swPk = swPk;
	}

	public String getDroneTitle() {
		return droneTitle;
	}

	public void setDroneTitle(String droneTitle) {
		this.droneTitle = droneTitle;
	}

	public int getSearchDroneCnt() {
		return searchDroneCnt;
	}

	public void setSearchDroneCnt(int searchDroneCnt) {
		this.searchDroneCnt = searchDroneCnt;
	}

	public String getSearchDroneAction() {
		return searchDroneAction;
	}

	public void setSearchDroneAction(String searchDroneAction) {
		this.searchDroneAction = searchDroneAction;
	}

	public int getDroneCnt() {
		return droneCnt;
	}

	public void setDroneCnt(int droneCnt) {
		this.droneCnt = droneCnt;
	}

	public String getDroneAction() {
		return droneAction;
	}

	public void setDroneAction(String droneAction) {
		this.droneAction = droneAction;
	}

	public String getAiUse() {
		return aiUse;
	}

	public void setAiUse(String aiUse) {
		this.aiUse = aiUse;
	}

	public String getAiWritetime() {
		return aiWritetime;
	}

	public void setAiWritetime(String aiWritetime) {
		this.aiWritetime = aiWritetime;
	}

	private String aiWritetime = "";
	
 
	 
 

	/** 정렬순서(DESC,ASC) */
    private long sortOrdr = 0L;

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;
 
	public String getAiPk() {
		return aiPk;
	}

	public void setAiPk(String aiPk) {
		this.aiPk = aiPk;
	}

	public String getAiDevicecode() {
		return aiDevicecode;
	}

	public void setAiDevicecode(String aiDevicecode) {
		this.aiDevicecode = aiDevicecode;
	}

	public String getAiDevicename() {
		return aiDevicename;
	}

	public void setAiDevicename(String aiDevicename) {
		this.aiDevicename = aiDevicename;
	}
	
	public String getAiDevicealias() {
		return aiDevicealias;
	}

	public void setAiDevicealias(String aiDevicealias) {
		this.aiDevicealias = aiDevicealias;
	}

	public String getAiDevicetype() {
		return aiDevicetype;
	}

	public void setAiDevicetype(String aiDevicetype) {
		this.aiDevicetype = aiDevicetype;
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

	public String getAiRegisterid() {
		return aiRegisterid;
	}

	public void setAiRegisterid(String aiRegisterid) {
		this.aiRegisterid = aiRegisterid;
	}

	public String getAiRegistername() {
		return aiRegistername;
	}

	public void setAiRegistername(String aiRegistername) {
		this.aiRegistername = aiRegistername;
	}

 
	public long getSortOrdr() {
		return sortOrdr;
	}

	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}



      
     
}
