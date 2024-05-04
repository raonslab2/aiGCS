package egovframework.or.kr.EMAU00C.service;

public class AvailableVO {
	 
	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = -6744703112021062401L;
	
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
    private int pageUnit = 20;

    /** 페이지사이즈 */
    private int pageSize = 5;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;
    
    private String pjGubun = "";
    
    
    
	public String getPjGubun() {
		return pjGubun;
	}
	public void setPjGubun(String pjGubun) {
		this.pjGubun = pjGubun;
	}
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

	/** 자동증가키 */
    private String paPk = "";
    
    /** 사업년도 */
    private String pjYear = "";
    
    /** 사업코드 */
    private String pjCode = "";
    
    /** 평가코드 */
    private String vuReCode = "";
    
    /** 평가종류 */
    private String vuDiCode = "";
    
    /** 평가시작일 */
    private String vuDayStart = "";
    
    /** 평가종료일 */
    private String vuDayEnd = "";
    
    /** 자동증가키 */
    private String emplyrSttusCode = "";    
 
	private String vuDayWrite = "";
	
	private String pjTitle = "";

	private String pjState = "";

	private String searchVuDayStart = "";
	
	private String searchVuDayEnd = "";
	
	private String searchVuDiCode = "";
	
	private String searchYear = "";
	
	private String searchName = "";
	
	private String searchAreaName = "";
	
	private String searchMemberName = "";


	private String vuReTitle = "";
	
	private String vuDiTitle = "";
	
	private String coCateCode = "";
	
	private String coCateName = "";
	
	private String coPk = "";
	
	private String emVuPk = "";
	
	private String emVuTitle = "";
	
	private String grPCode = "";
	
	private String mbName = "";
	
	private String mbRName = "";
	
	private String grMName = "";
	
	private String grMCode = "";
	
	private String inState = "";
	
	private String emVuUse = "";
	private String emVuAddr = "";
	private String arAddrName = "";
	private String paUseDay = "";
	private String mbCode = "";
	
	public String getInState() {
		return inState;
	}
	public void setInState(String inState) {
		this.inState = inState;
	}
	public String getSearchMemberName() {
		return searchMemberName;
	}
	public void setSearchMemberName(String searchMemberName) {
		this.searchMemberName = searchMemberName;
	}
	public String getGrPCode() {
		return grPCode;
	}
	public void setGrPCode(String grPCode) {
		this.grPCode = grPCode;
	}
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getMbRName() {
		return mbRName;
	}
	public void setMbRName(String mbRName) {
		this.mbRName = mbRName;
	}
	public String getGrMName() {
		return grMName;
	}
	public void setGrMName(String grMName) {
		this.grMName = grMName;
	}
	public String getGrMCode() {
		return grMCode;
	}
	public void setGrMCode(String grMCode) {
		this.grMCode = grMCode;
	}

	
	public String getSearchAreaName() {
		return searchAreaName;
	}
	public void setSearchAreaName(String searchAreaName) {
		this.searchAreaName = searchAreaName;
	}
	 
	public String getEmVuPk() {
		return emVuPk;
	}
	public void setEmVuPk(String emVuPk) {
		this.emVuPk = emVuPk;
	}
	public String getEmVuTitle() {
		return emVuTitle;
	}
	public void setEmVuTitle(String emVuTitle) {
		this.emVuTitle = emVuTitle;
	}
	public String getCoPk() {
		return coPk;
	}
	public void setCoPk(String coPk) {
		this.coPk = coPk;
	}
	public String getCoCateCode() {
		return coCateCode;
	}
	public void setCoCateCode(String coCateCode) {
		this.coCateCode = coCateCode;
	}
	public String getCoCateName() {
		return coCateName;
	}
	public void setCoCateName(String coCateName) {
		this.coCateName = coCateName;
	}
	public String getVuDiTitle() {
		return vuDiTitle;
	}
	public void setVuDiTitle(String vuDiTitle) {
		this.vuDiTitle = vuDiTitle;
	}
	public String getVuReTitle() {
		return vuReTitle;
	}
	public void setVuReTitle(String vuReTitle) {
		this.vuReTitle = vuReTitle;
	}
	public String getSearchYear() {
		return searchYear;
	}
	public void setSearchYear(String searchYear) {
		this.searchYear = searchYear;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
    
    public String getPjTitle() {
		return pjTitle;
	}

	public void setPjTitle(String pjTitle) {
		this.pjTitle = pjTitle;
	}

	public String getPaPk() {
		return paPk;
	}

	public void setPaPk(String paPk) {
		this.paPk = paPk;
	}

	public String getPjYear() {
		return pjYear;
	}

	public void setPjYear(String pjYear) {
		this.pjYear = pjYear;
	}

	public String getPjCode() {
		return pjCode;
	}

	public void setPjCode(String pjCode) {
		this.pjCode = pjCode;
	}

	public String getVuReCode() {
		return vuReCode;
	}

	public void setVuReCode(String vuReCode) {
		this.vuReCode = vuReCode;
	}

	public String getVuDiCode() {
		return vuDiCode;
	}

	public void setVuDiCode(String vuDiCode) {
		this.vuDiCode = vuDiCode;
	}

	public String getVuDayStart() {
		return vuDayStart;
	}

	public void setVuDayStart(String vuDayStart) {
		this.vuDayStart = vuDayStart;
	}

	public String getVuDayEnd() {
		return vuDayEnd;
	}

	public void setVuDayEnd(String vuDayEnd) {
		this.vuDayEnd = vuDayEnd;
	}

	public String getEmplyrSttusCode() {
		return emplyrSttusCode;
	}

	public void setEmplyrSttusCode(String emplyrSttusCode) {
		this.emplyrSttusCode = emplyrSttusCode;
	}
	
    public String getVuDayWrite() {
		return vuDayWrite;
	}

	public void setVuDayWrite(String vuDayWrite) {
		this.vuDayWrite = vuDayWrite;
	}
	
	public String getSearchVuDayStart() {
		return searchVuDayStart;
	}

	public void setSearchVuDayStart(String searchVuDayStart) {
		this.searchVuDayStart = searchVuDayStart;
	}

	public String getSearchVuDayEnd() {
		return searchVuDayEnd;
	}

	public void setSearchVuDayEnd(String searchVuDayEnd) {
		this.searchVuDayEnd = searchVuDayEnd;
	}

	public String getSearchVuDiCode() {
		return searchVuDiCode;
	}

	public void setSearchVuDiCode(String searchVuDiCode) {
		this.searchVuDiCode = searchVuDiCode;
	}

	public String getPjState() {
		return pjState;
	}

	public void setPjState(String pjState) {
		this.pjState = pjState;
	}
	public String getEmVuUse() {
		return emVuUse;
	}
	public void setEmVuUse(String emVuUse) {
		this.emVuUse = emVuUse;
	}
	public String getEmVuAddr() {
		return emVuAddr;
	}
	public void setEmVuAddr(String emVuAddr) {
		this.emVuAddr = emVuAddr;
	}
	public String getArAddrName() {
		return arAddrName;
	}
	public void setArAddrName(String arAddrName) {
		this.arAddrName = arAddrName;
	}
	public String getPaUseDay() {
		return paUseDay;
	}
	public void setPaUseDay(String paUseDay) {
		this.paUseDay = paUseDay;
	}
	
	public String getMbCode() {
		return mbCode;
	}
	public void setMbCode(String mbCode) {
		this.mbCode = mbCode;
	}
	
	@Override
	public String toString() {
		return "AvailableVO [paPk=" + paPk + ", pjYear=" + pjYear + ", pjCode=" + pjCode + ", vuReCode=" + vuReCode
				+ ", vuDiCode=" + vuDiCode + ", vuDayStart=" + vuDayStart + ", vuDayEnd=" + vuDayEnd
				+ ", emplyrSttusCode=" + emplyrSttusCode + ", vuDayWrite=" + vuDayWrite + ", pjTitle=" + pjTitle
				+ ", pjState=" + pjState + ", searchVuDayStart=" + searchVuDayStart + ", searchVuDayEnd="
				+ searchVuDayEnd + ", searchVuDiCode=" + searchVuDiCode + ", searchYear=" + searchYear + ", searchName="
				+ searchName + ", searchAreaName=" + searchAreaName + ", searchMemberName=" + searchMemberName
				+ ", vuReTitle=" + vuReTitle + ", vuDiTitle=" + vuDiTitle + ", coCateCode=" + coCateCode
				+ ", coCateName=" + coCateName + ", coPk=" + coPk + ", emVuPk=" + emVuPk + ", emVuTitle=" + emVuTitle
				+ ", grPCode=" + grPCode + ", mbName=" + mbName + ", mbRName=" + mbRName + ", grMName=" + grMName
				+ ", grMCode=" + grMCode + ", inState=" + inState + ", emVuUse=" + emVuUse + ", emVuAddr=" + emVuAddr
				+ ", arAddrName=" + arAddrName + ", paUseDay=" + paUseDay + ", mbCode=" + mbCode + "]";
	}
	
}
