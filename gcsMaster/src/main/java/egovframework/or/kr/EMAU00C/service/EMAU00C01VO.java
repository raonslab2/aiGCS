package egovframework.or.kr.EMAU00C.service;

import java.io.Serializable;

import com.ibm.icu.util.Calendar;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ ------- -------- --------------------------- @ 2009.03.03
 *   박지욱 최초 생성
 *
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.03
 * @version 1.0
 * @see
 * 
 */
public class EMAU00C01VO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	// 평가실위치 실명 사용여부 등록일

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
    private int pageUnit = 4;

    /** 페이지사이즈 */
    private int pageSize = 4;

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

	private String emVuPk;

	public String getEmVuPk() {
		return emVuPk;
	}

	public void setEmVuPk(String emVuPk) {
		this.emVuPk = emVuPk;
	}
	
	private String dateDay;
	private String gsPk;
	private String pjCode;
	private String pjYear;
	private String mbCode;
	private String pjInDate;
	private String pjTitle;
	private String grmName;
	private String grmCode;
	private String grpCode;
	private String mbName;
	private String pjInUse;
	private String pjInConfirm;
	private String mbRank;
	private String mbHp;
	private String inState;
	
	private String date1;
	private String date2;
	private String part1;
	private String part2;
	
	private String searchDateSt ="";
	private String searchDateEd = "";
	
	private String pjYmd = "";
	
	private String pjWeek = "";
	  
	private String plcNm  = "";
	 
	public String getPlcNm() {
		return plcNm;
	}

	public void setPlcNm(String plcNm) {
		this.plcNm = plcNm;
	}

	public String getPjYmd() {
		return pjYmd;
	}

	public void setPjYmd(String pjYmd) {
		this.pjYmd = pjYmd;
	}

	public String getPjWeek() {
		return pjWeek;
	}

	public void setPjWeek(String pjWeek) {
		this.pjWeek = pjWeek;
	}

	public String getSearchDateSt() {
		return searchDateSt;
	}

	public void setSearchDateSt(String searchDateSt) {
		this.searchDateSt = searchDateSt;
	}

	public String getSearchDateEd() {
		return searchDateEd;
	}

	public void setSearchDateEd(String searchDateEd) {
		this.searchDateEd = searchDateEd;
	}

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}

	public String getPart1() {
		return part1;
	}

	public void setPart1(String part1) {
		this.part1 = part1;
	}

	public String getPart2() {
		return part2;
	}

	public void setPart2(String part2) {
		this.part2 = part2;
	}

	public String getGsPk() {
		return gsPk;
	}

	public void setGsPk(String gsPk) {
		this.gsPk = gsPk;
	}

	public String getPjInDate() {
		return pjInDate;
	}

	public void setPjInDate(String pjInDate) {
		this.pjInDate = pjInDate;
	}

	public String getInState() {
		return inState;
	}

	public void setInState(String inState) {
		this.inState = inState;
	}

	public String getPjTitle() {
		return pjTitle;
	}

	public void setPjTitle(String pjTitle) {
		this.pjTitle = pjTitle;
	}

	public String getGrmName() {
		return grmName;
	}

	public void setGrmName(String grmName) {
		this.grmName = grmName;
	}

	public String getMbName() {
		return mbName;
	}

	public void setMbName(String mbName) {
		this.mbName = mbName;
	}

	public String getPjInUse() {
		return pjInUse;
	}

	public void setPjInUse(String pjInUse) {
		this.pjInUse = pjInUse;
	}

	public String getPjInConfirm() {
		return pjInConfirm;
	}

	public void setPjInConfirm(String pjInConfirm) {
		this.pjInConfirm = pjInConfirm;
	}

	public String getPjInRepleDate() {
		return pjInRepleDate;
	}

	public void setPjInRepleDate(String pjInRepleDate) {
		this.pjInRepleDate = pjInRepleDate;
	}

	public String getMbRank() {
		return mbRank;
	}

	public String getMbCode() {
		return mbCode;
	}

	public void setMbCode(String mbCode) {
		this.mbCode = mbCode;
	}

	public void setMbRank(String mbRank) {
		this.mbRank = mbRank;
	}

	public String getPjCode() {
		return pjCode;
	}

	public void setPjCode(String pjCode) {
		this.pjCode = pjCode;
	}

	public String getPjYear() {
		return pjYear;
	}

	public String getGrmCode() {
		return grmCode;
	}

	public void setGrmCode(String grmCode) {
		this.grmCode = grmCode;
	}

	public String getGrpCode() {
		return grpCode;
	}


	public void setGrpCode(String grpCode) {
		this.grpCode = grpCode;
	}

	public void setPjYear(String pjYear) {
		this.pjYear = pjYear;
	}

	public String getMbHp() {
		return mbHp;
	}

	public void setMbHp(String mbHp) {
		this.mbHp = mbHp;
	}

	private String pjInRepleDate;
	private String reqMbName;

	public String getReqMbName() {
		return reqMbName;
	}

	public void setReqMbName(String reqMbName) {
		this.reqMbName = reqMbName;
	}

	// 평가실명
	private String vuTitle;
	// 평가실사용여부
	private String vuUse;
	// 등록일
	private String writeTime;
	// 평가실 위치코드
	private String addrCode;
	// 평가실 위치이름
	private String addrName;
	
	private String vuPost;

	private String vuAddr;
	
	private String paPk;

	public String getVuPost() {
		return vuPost;
	}

	public void setVuPost(String vuPost) {
		this.vuPost = vuPost;
	}

	public String getVuAddr() {
		return vuAddr;
	}

	public void setVuAddr(String vuAddr) {
		this.vuAddr = vuAddr;
	}

	public String getAddrName() {
		return addrName;
	}

	public void setAddrName(String addrName) {
		this.addrName = addrName;
	}

	public String getVuTitle() {
		return vuTitle;
	}

	public void setVuTitle(String vuTitle) {
		this.vuTitle = vuTitle;
	}

	public String getVuUse() {
		return vuUse;
	}

	public void setVuUse(String vuUse) {
		this.vuUse = vuUse;
	}

	public String getWriteTime() {
		return writeTime;
	}

	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}

	public String getAddrCode() {
		return addrCode;
	}

	public void setAddrCode(String addrCode) {
		this.addrCode = addrCode;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getEsclusion() {
		return esclusion;
	}

	public void setEsclusion(String esclusion) {
		this.esclusion = esclusion;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}
	
	public String getPaPk() {
		return paPk;
	}

	public void setPaPk(String paPk) {
		this.paPk = paPk;
	}
	

	public String getDateDay() {
		return dateDay;
	}

	public void setDateDay(String dateDay) {
		this.dateDay = dateDay;
	}

	// 사업부서
	private String depart;

	// 제외조건
	private String esclusion;

	// 기간
	private String term;

	@Override
	public String toString() {
		return "EMAU00C01VO [emVuPk=" + emVuPk + ", dateDay=" + dateDay + ", gsPk=" + gsPk + ", pjCode=" + pjCode
				+ ", pjYear=" + pjYear + ", mbCode=" + mbCode + ", pjInDate=" + pjInDate + ", pjTitle=" + pjTitle
				+ ", grmName=" + grmName + ", grmCode=" + grmCode + ", grpCode=" + grpCode + ", mbName=" + mbName
				+ ", pjInUse=" + pjInUse + ", pjInConfirm=" + pjInConfirm + ", mbRank=" + mbRank + ", mbHp=" + mbHp
				+ ", inState=" + inState + ", date1=" + date1 + ", date2=" + date2 + ", part1=" + part1 + ", part2="
				+ part2 + ", pjInRepleDate=" + pjInRepleDate + ", reqMbName=" + reqMbName + ", vuTitle=" + vuTitle
				+ ", vuUse=" + vuUse + ", writeTime=" + writeTime + ", addrCode=" + addrCode + ", addrName=" + addrName
				+ ", vuPost=" + vuPost + ", vuAddr=" + vuAddr + ", paPk=" + paPk + ", depart=" + depart + ", esclusion="
				+ esclusion + ", term=" + term + "]";
	}

	


	
}
