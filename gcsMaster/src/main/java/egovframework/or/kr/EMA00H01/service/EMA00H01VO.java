package egovframework.or.kr.EMA00H01.service;

import java.io.Serializable;


/**
 * 게시판의 이용정보를 관리하기 위한 모델 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.04.02
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.02  이삼섭          최초 생성
 *   2011.08.31  JJY            경량환경 커스터마이징버전 생성
 *
 * </pre>
 */
public class EMA00H01VO implements Serializable {

    

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -5774409406580829524L;

	/** test 아이디 */
    private String testId = "";

	private String dlUserId = "";
	
	/** test 아이디 */
	private String 	h01Id	 = "";


	private String 	h01NameCode	 = "";
	private String 	h01Name	 = "";
	private String 	h01NameYear	 = "";
	private String 	h01NameMale	 = "";
	private String 	h01NameNic	 = "";
	private String 	h01CompanyCode	 = "";
	private String 	h01Company	 = "";
	private String 	h01Department	 = "";
	private String 	h01Rank	 = "";
	private String 	h01Hp	 = "";
	private String 	h01Tel	 = "";
	private String 	h01PersonalEmail	 = "";
	private String 	h01CompnyEmail	 = "";
	private String 	h01Sns1	 = "";
	private String 	h01Sns2	 = "";
	private String 	h01Sns3	 = "";
	private String 	h01AddrCompany	 = "";
	private String 	h01AddrHome	 = "";
    
	
	public String getH01Company() {
		return h01Company;
	}

	public void setH01Company(String h01Company) {
		this.h01Company = h01Company;
	}

    public String getDlUserId() {
		return dlUserId;
	}

	public void setDlUserId(String dlUserId) {
		this.dlUserId = dlUserId;
	}

	public String getTestId() {
		return testId;
	}

	public void setTestId(String testId) {
		this.testId = testId;
	}
	
	public String getH01Id() {
		return h01Id;
	}

	public void setH01Id(String h01Id) {
		this.h01Id = h01Id;
	}

	public String getH01NameCode() {
		return h01NameCode;
	}

	public void setH01NameCode(String h01NameCode) {
		this.h01NameCode = h01NameCode;
	}

	public String getH01Name() {
		return h01Name;
	}

	public void setH01Name(String h01Name) {
		this.h01Name = h01Name;
	}

	public String getH01NameYear() {
		return h01NameYear;
	}

	public void setH01NameYear(String h01NameYear) {
		this.h01NameYear = h01NameYear;
	}

	public String getH01NameMale() {
		return h01NameMale;
	}

	public void setH01NameMale(String h01NameMale) {
		this.h01NameMale = h01NameMale;
	}

	public String getH01NameNic() {
		return h01NameNic;
	}

	public void setH01NameNic(String h01NameNic) {
		this.h01NameNic = h01NameNic;
	}

	public String getH01CompanyCode() {
		return h01CompanyCode;
	}

	public void setH01CompanyCode(String h01CompanyCode) {
		this.h01CompanyCode = h01CompanyCode;
	}

	public String getH01Department() {
		return h01Department;
	}

	public void setH01Department(String h01Department) {
		this.h01Department = h01Department;
	}

	public String getH01Rank() {
		return h01Rank;
	}

	public void setH01Rank(String h01Rank) {
		this.h01Rank = h01Rank;
	}

	public String getH01Hp() {
		return h01Hp;
	}

	public void setH01Hp(String h01Hp) {
		this.h01Hp = h01Hp;
	}

	public String getH01Tel() {
		return h01Tel;
	}

	public void setH01Tel(String h01Tel) {
		this.h01Tel = h01Tel;
	}

	public String getH01PersonalEmail() {
		return h01PersonalEmail;
	}

	public void setH01PersonalEmail(String h01PersonalEmail) {
		this.h01PersonalEmail = h01PersonalEmail;
	}

	public String getH01CompnyEmail() {
		return h01CompnyEmail;
	}

	public void setH01CompnyEmail(String h01CompnyEmail) {
		this.h01CompnyEmail = h01CompnyEmail;
	}

	public String getH01Sns1() {
		return h01Sns1;
	}

	public void setH01Sns1(String h01Sns1) {
		this.h01Sns1 = h01Sns1;
	}

	public String getH01Sns2() {
		return h01Sns2;
	}

	public void setH01Sns2(String h01Sns2) {
		this.h01Sns2 = h01Sns2;
	}

	public String getH01Sns3() {
		return h01Sns3;
	}

	public void setH01Sns3(String h01Sns3) {
		this.h01Sns3 = h01Sns3;
	}

	public String getH01AddrCompany() {
		return h01AddrCompany;
	}

	public void setH01AddrCompany(String h01AddrCompany) {
		this.h01AddrCompany = h01AddrCompany;
	}

	public String getH01AddrHome() {
		return h01AddrHome;
	}

	public void setH01AddrHome(String h01AddrHome) {
		this.h01AddrHome = h01AddrHome;
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
