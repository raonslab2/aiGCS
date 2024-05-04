package egovframework.or.kr.EMAU00F.service;

import java.io.Serializable;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.03.03    박지욱          최초 생성
 *
 *  @author 공통서비스 개발팀 박지욱
 *  @since 2009.03.03
 *  @version 1.0
 *  @see
 *  
 */
public class EmmbgroupVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	/** 검색조건 */
    private String searchCnd = "";

    /** 검색단어 */
    private String searchWrd = "";

    /** 정렬순서(DESC,ASC) */
    private long sortOrdr = 0L;

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 5;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;
    
    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

	public String getSearchCnd() {
		return searchCnd;
	}
	public void setSearchCnd(String searchCnd) {
		this.searchCnd = searchCnd;
	}
	public String getSearchWrd() {
		return searchWrd;
	}
	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
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


	private String groupPart1;
	private String groupPart2;
	private String searchName;

	public String getGroupPart1() {
		return groupPart1;
	}
	public void setGroupPart1(String groupPart1) {
		this.groupPart1 = groupPart1;
	}
	public String getGroupPart2() {
		return groupPart2;
	}
	public void setGroupPart2(String groupPart2) {
		this.groupPart2 = groupPart2;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}


	/** 상위 부서 코드 */
	private String grpCode;
	/** 부서코드 */
	private String grmCode;
	/** 부서 명 */
	private String grmName;
	/** 정열 순서 */
	private int grOrderBy;
	/** 부서 전체 이름 */
	private String grSumName;
	/** 상위 부서 이름 */
	private String grTname;
	
	/** 사원 이름 */
	private String mbName;
	/** 직급 명  */
	private String mbRankName;
	/** 사원 번호 */
	private String mbCode;
	
	/** 사원 아이디 */
	private String smtechId;
	/** 사원 이메일 */
	private String mbEmail;
	/** 사원 전화번호 */
	private String mbHp;
	
	/** 담당자 사업권한 아이디 */
	private String pjAuId;
	/** 프로젝트 번호 */
	private String pjCode;
	/** 프로젝트 권한 코드 */
	private String auCode;
	
	/** 프로젝트 번호 */
	private String pjTitle;
	/** 프로젝트 권한 코드 */
	private String auName;
	
	private String writeTime;
	private String pjCateName;
	private String pjCateCode1;
	private String pjYear;
	
	public String getGrpCode() {
		return grpCode;
	}
	public void setGrpCode(String grpCode) {
		this.grpCode = grpCode;
	}
	public String getGrmCode() {
		return grmCode;
	}
	public void setGrmCode(String grmCode) {
		this.grmCode = grmCode;
	}
	public String getGrmName() {
		return grmName;
	}
	public void setGrmName(String grmName) {
		this.grmName = grmName;
	}
	public int getGrOrderBy() {
		return grOrderBy;
	}
	public void setGrOrderBy(int grOrderBy) {
		this.grOrderBy = grOrderBy;
	}
	public String getGrSumName() {
		return grSumName;
	}
	public void setGrSumName(String grSumName) {
		this.grSumName = grSumName;
	}
	public String getGrTname() {
		return grTname;
	}
	public void setGrTname(String grTname) {
		this.grTname = grTname;
	}
	
	
	
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getMbRankName() {
		return mbRankName;
	}
	public void setMbRankName(String mbRankName) {
		this.mbRankName = mbRankName;
	}
	public String getMbCode() {
		return mbCode;
	}
	public void setMbCode(String mbCode) {
		this.mbCode = mbCode;
	}
	
	
	public String getSmtechId() {
		return smtechId;
	}
	public void setSmtechId(String smtechId) {
		this.smtechId = smtechId;
	}
	public String getMbEmail() {
		return mbEmail;
	}
	public void setMbEmail(String mbEmail) {
		this.mbEmail = mbEmail;
	}
	public String getMbHp() {
		return mbHp;
	}
	public void setMbHp(String mbHp) {
		this.mbHp = mbHp;
	}
	
	
	public String getPjAuId() {
		return pjAuId;
	}
	public void setPjAuId(String pjAuId) {
		this.pjAuId = pjAuId;
	}
	public String getPjCode() {
		return pjCode;
	}
	public void setPjCode(String pjCode) {
		this.pjCode = pjCode;
	}
	public String getAuCode() {
		return auCode;
	}
	public void setAuCode(String auCode) {
		this.auCode = auCode;
	}
	
	public String getPjTitle() {
		return pjTitle;
	}
	public void setPjTitle(String pjTitle) {
		this.pjTitle = pjTitle;
	}
	public String getAuName() {
		return auName;
	}
	public void setAuName(String auName) {
		this.auName = auName;
	}
	
	
	public String getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}
	public String getPjCateName() {
		return pjCateName;
	}
	public void setPjCateName(String pjCateName) {
		this.pjCateName = pjCateName;
	}
	
	public String getPjCateCode1() {
		return pjCateCode1;
	}
	public void setPjCateCode1(String pjCateCode1) {
		this.pjCateCode1 = pjCateCode1;
	}
	public String getPjYear() {
		return pjYear;
	}
	public void setPjYear(String pjYear) {
		this.pjYear = pjYear;
	}
	
	@Override
	public String toString() {
		return "EmmbgroupVO [searchCnd=" + searchCnd + ", searchWrd=" + searchWrd + ", sortOrdr=" + sortOrdr
				+ ", searchUseYn=" + searchUseYn + ", pageIndex=" + pageIndex + ", pageUnit=" + pageUnit + ", pageSize="
				+ pageSize + ", firstIndex=" + firstIndex + ", lastIndex=" + lastIndex + ", recordCountPerPage="
				+ recordCountPerPage + ", grpCode=" + grpCode + ", grmCode=" + grmCode + ", grmName=" + grmName
				+ ", grOrderBy=" + grOrderBy + ", grSumName=" + grSumName + ", grTname=" + grTname + ", mbName="
				+ mbName + ", mbRankName=" + mbRankName + ", mbCode=" + mbCode + ", smtechId=" + smtechId + ", mbEmail="
				+ mbEmail + ", mbHp=" + mbHp + ", pjAuId=" + pjAuId + ", pjCode=" + pjCode + ", auCode=" + auCode
				+ ", pjTitle=" + pjTitle + ", auName=" + auName + ", writeTime=" + writeTime + ", pjCateName="
				+ pjCateName + ", pjCateCode1=" + pjCateCode1 + ", pjYear=" + pjYear + "]";
	}
	
	
}
