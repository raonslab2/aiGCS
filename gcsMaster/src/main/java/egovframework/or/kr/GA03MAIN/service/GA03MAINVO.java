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
public class GA03MAINVO implements Serializable{ 
	
	private static final long serialVersionUID = -9219604963667213010L;
	
 
	private	String	dlPk ="";
	
	private	String	dlName ="";
	
	private	String	dlAddr ="";
  
	private String dlUserId = "";
	
	private String dlHomeX = "";
	
	private String dlHomeY = "";
	
	private String dlWaypoint = "";
	
	private String dlWaypointDetail = "";
 
	private String dlCreateTime = ""; 
	
	private String dlNamePk = "";
	
	private String dlNameEtc = "";

	private String dlDroneNum = "";
	
	private String id="";
	 
	private String dlDiv =""; 
	
	private String dlModifyTime ="";
	
	private String projectNameInput ="";
	
	private String coordinateSystem ="";
	
 
	 
	public String getProjectNameInput() {
		return projectNameInput;
	}

	public void setProjectNameInput(String projectNameInput) {
		this.projectNameInput = projectNameInput;
	}

	public String getCoordinateSystem() {
		return coordinateSystem;
	}

	public void setCoordinateSystem(String coordinateSystem) {
		this.coordinateSystem = coordinateSystem;
	}

	public String getDlModifyTime() {
		return dlModifyTime;
	}

	public void setDlModifyTime(String dlModifyTime) {
		this.dlModifyTime = dlModifyTime;
	}

	public String getDlDiv() {
		return dlDiv;
	}

	public void setDlDiv(String dlDiv) {
		this.dlDiv = dlDiv;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDlWaypointDetail() {
		return dlWaypointDetail;
	}

	public void setDlWaypointDetail(String dlWaypointDetail) {
		this.dlWaypointDetail = dlWaypointDetail;
	}

	public String getDlDroneNum() {
		return dlDroneNum;
	}

	public void setDlDroneNum(String dlDroneNum) {
		this.dlDroneNum = dlDroneNum;
	}

	public String getDlNameEtc() {
		return dlNameEtc;
	}

	public void setDlNameEtc(String dlNameEtc) {
		this.dlNameEtc = dlNameEtc;
	}



	public String getDlNamePk() {
		return dlNamePk;
	}



	public void setDlNamePk(String dlNamePk) {
		this.dlNamePk = dlNamePk;
	}

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

	public String getDlPk() {
		return dlPk;
	}
	
	

	public String getDlName() {
		return dlName;
	}



	public void setDlName(String dlName) {
		this.dlName = dlName;
	}



	public String getDlAddr() {
		return dlAddr;
	}



	public void setDlAddr(String dlAddr) {
		this.dlAddr = dlAddr;
	}



	public void setDlPk(String dlPk) {
		this.dlPk = dlPk;
	}

	public String getDlUserId() {
		return dlUserId;
	}

	public void setDlUserId(String dlUserId) {
		this.dlUserId = dlUserId;
	}

	public String getDlHomeX() {
		return dlHomeX;
	}

	public void setDlHomeX(String dlHomeX) {
		this.dlHomeX = dlHomeX;
	}

	public String getDlHomeY() {
		return dlHomeY;
	}

	public void setDlHomeY(String dlHomeY) {
		this.dlHomeY = dlHomeY;
	}

	public String getDlWaypoint() {
		return dlWaypoint;
	}

	public void setDlWaypoint(String dlWaypoint) {
		this.dlWaypoint = dlWaypoint;
	}

	public String getDlCreateTime() {
		return dlCreateTime;
	}

	public void setDlCreateTime(String dlCreateTime) {
		this.dlCreateTime = dlCreateTime;
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
