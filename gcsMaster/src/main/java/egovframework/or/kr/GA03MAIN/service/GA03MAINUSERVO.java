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
 *  @author 개발팀 민병안
 *  @since 2022.03.08
 *  @version 1.0
 *  @see
 *  
 */
public class GA03MAINUSERVO implements Serializable{ 
	
	private static final long serialVersionUID = -9219604963667233010L;
	
	public String getGrPcode() {
		return grPcode;
	}

	public void setGrPcode(String grPcode) {
		this.grPcode = grPcode;
	}

	public String getGrMcode() {
		return grMcode;
	}

	public void setGrMcode(String grMcode) {
		this.grMcode = grMcode;
	}

	public String getGrMname() {
		return grMname;
	}

	public void setGrMname(String grMname) {
		this.grMname = grMname;
	}

	public String getMbCode() {
		return mbCode;
	}

	public void setMbCode(String mbCode) {
		this.mbCode = mbCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMbPw() {
		return mbPw;
	}

	public void setMbPw(String mbPw) {
		this.mbPw = mbPw;
	}

	public String getMbName() {
		return mbName;
	}

	public void setMbName(String mbName) {
		this.mbName = mbName;
	}

	public String getMbRankcode() {
		return mbRankcode;
	}

	public void setMbRankcode(String mbRankcode) {
		this.mbRankcode = mbRankcode;
	}

	public String getMbRankname() {
		return mbRankname;
	}

	public void setMbRankname(String mbRankname) {
		this.mbRankname = mbRankname;
	}

	public String getMbTel() {
		return mbTel;
	}

	public void setMbTel(String mbTel) {
		this.mbTel = mbTel;
	}

	public String getMbHp() {
		return mbHp;
	}

	public void setMbHp(String mbHp) {
		this.mbHp = mbHp;
	}

	public String getMbEmail() {
		return mbEmail;
	}

	public void setMbEmail(String mbEmail) {
		this.mbEmail = mbEmail;
	}

	public String getMbState() {
		return mbState;
	}

	public void setMbState(String mbState) {
		this.mbState = mbState;
	}

	public String getMbPwer() {
		return mbPwer;
	}

	public void setMbPwer(String mbPwer) {
		this.mbPwer = mbPwer;
	}

	public String getTimeWrite() {
		return timeWrite;
	}

	public void setTimeWrite(String timeWrite) {
		this.timeWrite = timeWrite;
	}

	public String getTimeUpdate() {
		return timeUpdate;
	}

	public void setTimeUpdate(String timeUpdate) {
		this.timeUpdate = timeUpdate;
	}

	public String getMbAuth() {
		return mbAuth;
	}

	public void setMbAuth(String mbAuth) {
		this.mbAuth = mbAuth;
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

	private	String grPcode  =""; 
	
	private	String grMcode ="";
	
	private	String grMname ="";
  
	private String mbCode = "";
	
	private String userId = "";
	
	private String mbPw = "";
	
	private String mbName = "";
	
	private String mbRankcode = ""; 
	
	private String mbRankname = ""; 
	
	private String mbTel = ""; 
	
	private String mbHp = ""; 
	
	private String mbEmail = ""; 
	
	private String mbState = ""; 
	
	private String mbPwer = ""; 
	
	private String timeWrite = ""; 
	
	private String timeUpdate = ""; 
	
	private String mbAuth = ""; 
	 
    private int coPsPk;
    private String coDiv;
    private String coCode;
    private String coCodeName;
    private String coOrderby;
    private String coUpdatetime;
    
    

	public int getCoPsPk() {
		return coPsPk;
	}

	public void setCoPsPk(int coPsPk) {
		this.coPsPk = coPsPk;
	}

	public String getCoDiv() {
		return coDiv;
	}

	public void setCoDiv(String coDiv) {
		this.coDiv = coDiv;
	}

	public String getCoCode() {
		return coCode;
	}

	public void setCoCode(String coCode) {
		this.coCode = coCode;
	}

	public String getCoCodeName() {
		return coCodeName;
	}

	public void setCoCodeName(String coCodeName) {
		this.coCodeName = coCodeName;
	}

	public String getCoOrderby() {
		return coOrderby;
	}

	public void setCoOrderby(String coOrderby) {
		this.coOrderby = coOrderby;
	}

	public String getCoUpdatetime() {
		return coUpdatetime;
	}

	public void setCoUpdatetime(String coUpdatetime) {
		this.coUpdatetime = coUpdatetime;
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
  
}
