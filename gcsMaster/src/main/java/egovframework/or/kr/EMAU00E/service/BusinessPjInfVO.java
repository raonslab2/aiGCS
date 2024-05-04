package egovframework.or.kr.EMAU00E.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;


/**
 * 게시판의 이용정보를 관리하기 위한 VO 클래스
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
 *   2011.05.31  JJY           경량환경 커스터마이징버전 생성
 *
 * </pre>
 */
public class BusinessPjInfVO extends BusinessPjInf implements Serializable {

    /**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = -2688781320530443850L;

	/** 검색시작일 */
    private String searchBgnDe = "";

    /** 검색조건 */
    private String searchCnd = "";

    /** 검색종료일 */
    private String searchEndDe = "";

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
    private int pageSize = 10;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

    /** 레코드 번호 */
    private int rowNo = 0;

    /** 최초 등록자명 */
    private String frstRegisterNm = "";

    /** 최종 수정자명 */
    private String lastUpdusrNm = "";

    /** 등록구분 코드명 */
    private String registSeCodeNm = "";

    /** 커뮤니티 아이디 */
    private String cmmntyId = "";

    /** 커뮤니티 명 */
    private String cmmntyNm = "";

    /** 동호회 아이디 */
    private String clbId = "";

    /** 동호회 명 */
    private String clbNm = "";

    /** 게시판 명 */
    private String bbsNm = "";

    /** 사용자 명 */
    private String userNm = "";

    /** 제공 URL */
    private String provdUrl = "";

    /** 게시판 유형코드 */
    private String bbsTyCode = "";
     
	/** 검색 사업명 사업부서  */
    private String searchDiv = "";
    
    /** 검색 년도  */
    private String searchYear = "";
    
    /** 검색이름  */
    private String searchName = "";
     
	/** 사업부서코드 **/
    private String searchGrmCode = "";
    
    /** 권한명  */
    private String authName = "";
    
	/** 권한코드  */
    private String authCode = "";
    
    /** 사업명  */
    private String pjTitle = "";
    
    private String grmCode = "";
    
    
    
    
    public String getGrmCode() {
		return grmCode;
	}

	public void setGrmCode(String grmCode) {
		this.grmCode = grmCode;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
    
    public String getSearchGrmCode() {
		return searchGrmCode;
	}

	public void setSearchGrmCode(String searchGrmCode) {
		this.searchGrmCode = searchGrmCode;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public String getPjTitle() {
		return pjTitle;
	}

	public void setPjTitle(String pjTitle) {
		this.pjTitle = pjTitle;
	}
    
    public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchDiv() {
		return searchDiv;
	}

	public void setSearchDiv(String searchDiv) {
		this.searchDiv = searchDiv;
	}

	public String getSearchYear() {
		return searchYear;
	}

	public void setSearchYear(String searchYear) {
		this.searchYear = searchYear;
	}
    
    public String getmCode() {
		return mCode;
	}
     
    /** mCode */
	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	private String mCode = "";
	
	private String searchPjTitle = "";

    public String getSearchPjTitle() {
		return searchPjTitle;
	}

	public void setSearchPjTitle(String searchPjTitle) {
		this.searchPjTitle = searchPjTitle;
	}

	/**
     * searchBgnDe attribute를 리턴한다.
     *
     * @return the searchBgnDe
     */
    public String getSearchBgnDe() {
	return searchBgnDe;
    }

    /**
     * searchBgnDe attribute 값을 설정한다.
     *
     * @param searchBgnDe
     *            the searchBgnDe to set
     */
    public void setSearchBgnDe(String searchBgnDe) {
	this.searchBgnDe = searchBgnDe;
    }

    /**
     * searchCnd attribute를 리턴한다.
     *
     * @return the searchCnd
     */
    public String getSearchCnd() {
	return searchCnd;
    }

    /**
     * searchCnd attribute 값을 설정한다.
     *
     * @param searchCnd
     *            the searchCnd to set
     */
    public void setSearchCnd(String searchCnd) {
	this.searchCnd = searchCnd;
    }

    /**
     * searchEndDe attribute를 리턴한다.
     *
     * @return the searchEndDe
     */
    public String getSearchEndDe() {
	return searchEndDe;
    }

    /**
     * searchEndDe attribute 값을 설정한다.
     *
     * @param searchEndDe
     *            the searchEndDe to set
     */
    public void setSearchEndDe(String searchEndDe) {
	this.searchEndDe = searchEndDe;
    }

    /**
     * searchWrd attribute를 리턴한다.
     *
     * @return the searchWrd
     */
    public String getSearchWrd() {
	return searchWrd;
    }

    /**
     * searchWrd attribute 값을 설정한다.
     *
     * @param searchWrd
     *            the searchWrd to set
     */
    public void setSearchWrd(String searchWrd) {
	this.searchWrd = searchWrd;
    }

    /**
     * sortOrdr attribute를 리턴한다.
     *
     * @return the sortOrdr
     */
    public long getSortOrdr() {
	return sortOrdr;
    }

    /**
     * sortOrdr attribute 값을 설정한다.
     *
     * @param sortOrdr
     *            the sortOrdr to set
     */
    public void setSortOrdr(long sortOrdr) {
	this.sortOrdr = sortOrdr;
    }

    /**
     * searchUseYn attribute를 리턴한다.
     *
     * @return the searchUseYn
     */
    public String getSearchUseYn() {
	return searchUseYn;
    }

    /**
     * searchUseYn attribute 값을 설정한다.
     *
     * @param searchUseYn
     *            the searchUseYn to set
     */
    public void setSearchUseYn(String searchUseYn) {
	this.searchUseYn = searchUseYn;
    }

    /**
     * pageIndex attribute를 리턴한다.
     *
     * @return the pageIndex
     */
    public int getPageIndex() {
	return pageIndex;
    }

    /**
     * pageIndex attribute 값을 설정한다.
     *
     * @param pageIndex
     *            the pageIndex to set
     */
    public void setPageIndex(int pageIndex) {
	this.pageIndex = pageIndex;
    }

    /**
     * pageUnit attribute를 리턴한다.
     *
     * @return the pageUnit
     */
    public int getPageUnit() {
	return pageUnit;
    }

    /**
     * pageUnit attribute 값을 설정한다.
     *
     * @param pageUnit
     *            the pageUnit to set
     */
    public void setPageUnit(int pageUnit) {
	this.pageUnit = pageUnit;
    }

    /**
     * pageSize attribute를 리턴한다.
     *
     * @return the pageSize
     */
    public int getPageSize() {
	return pageSize;
    }

    /**
     * pageSize attribute 값을 설정한다.
     *
     * @param pageSize
     *            the pageSize to set
     */
    public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
    }

    /**
     * firstIndex attribute를 리턴한다.
     *
     * @return the firstIndex
     */
    public int getFirstIndex() {
	return firstIndex;
    }

    /**
     * firstIndex attribute 값을 설정한다.
     *
     * @param firstIndex
     *            the firstIndex to set
     */
    public void setFirstIndex(int firstIndex) {
	this.firstIndex = firstIndex;
    }

    /**
     * lastIndex attribute를 리턴한다.
     *
     * @return the lastIndex
     */
    public int getLastIndex() {
	return lastIndex;
    }

    /**
     * lastIndex attribute 값을 설정한다.
     *
     * @param lastIndex
     *            the lastIndex to set
     */
    public void setLastIndex(int lastIndex) {
	this.lastIndex = lastIndex;
    }

    /**
     * recordCountPerPage attribute를 리턴한다.
     *
     * @return the recordCountPerPage
     */
    public int getRecordCountPerPage() {
	return recordCountPerPage;
    }

    /**
     * recordCountPerPage attribute 값을 설정한다.
     *
     * @param recordCountPerPage
     *            the recordCountPerPage to set
     */
    public void setRecordCountPerPage(int recordCountPerPage) {
	this.recordCountPerPage = recordCountPerPage;
    }

    /**
     * rowNo attribute를 리턴한다.
     *
     * @return the rowNo
     */
    public int getRowNo() {
	return rowNo;
    }

    /**
     * rowNo attribute 값을 설정한다.
     *
     * @param rowNo
     *            the rowNo to set
     */
    public void setRowNo(int rowNo) {
	this.rowNo = rowNo;
    }

    /**
     * frstRegisterNm attribute를 리턴한다.
     *
     * @return the frstRegisterNm
     */
    public String getFrstRegisterNm() {
	return frstRegisterNm;
    }

    /**
     * frstRegisterNm attribute 값을 설정한다.
     *
     * @param frstRegisterNm
     *            the frstRegisterNm to set
     */
    public void setFrstRegisterNm(String frstRegisterNm) {
	this.frstRegisterNm = frstRegisterNm;
    }

    /**
     * lastUpdusrNm attribute를 리턴한다.
     *
     * @return the lastUpdusrNm
     */
    public String getLastUpdusrNm() {
	return lastUpdusrNm;
    }

    /**
     * lastUpdusrNm attribute 값을 설정한다.
     *
     * @param lastUpdusrNm
     *            the lastUpdusrNm to set
     */
    public void setLastUpdusrNm(String lastUpdusrNm) {
	this.lastUpdusrNm = lastUpdusrNm;
    }

    /**
     * registSeCodeNm attribute를 리턴한다.
     *
     * @return the registSeCodeNm
     */
    public String getRegistSeCodeNm() {
	return registSeCodeNm;
    }

    /**
     * registSeCodeNm attribute 값을 설정한다.
     *
     * @param registSeCodeNm
     *            the registSeCodeNm to set
     */
    public void setRegistSeCodeNm(String registSeCodeNm) {
	this.registSeCodeNm = registSeCodeNm;
    }

    /**
     * cmmntyId attribute를 리턴한다.
     *
     * @return the cmmntyId
     */
    public String getCmmntyId() {
	return cmmntyId;
    }

    /**
     * cmmntyId attribute 값을 설정한다.
     *
     * @param cmmntyId
     *            the cmmntyId to set
     */
    public void setCmmntyId(String cmmntyId) {
	this.cmmntyId = cmmntyId;
    }

    /**
     * cmmntyNm attribute를 리턴한다.
     *
     * @return the cmmntyNm
     */
    public String getCmmntyNm() {
	return cmmntyNm;
    }

    /**
     * cmmntyNm attribute 값을 설정한다.
     *
     * @param cmmntyNm
     *            the cmmntyNm to set
     */
    public void setCmmntyNm(String cmmntyNm) {
	this.cmmntyNm = cmmntyNm;
    }

    /**
     * clbId attribute를 리턴한다.
     *
     * @return the clbId
     */
    public String getClbId() {
	return clbId;
    }

    /**
     * clbId attribute 값을 설정한다.
     *
     * @param clbId
     *            the clbId to set
     */
    public void setClbId(String clbId) {
	this.clbId = clbId;
    }

    /**
     * clbNm attribute를 리턴한다.
     *
     * @return the clbNm
     */
    public String getClbNm() {
	return clbNm;
    }

    /**
     * clbNm attribute 값을 설정한다.
     *
     * @param clbNm
     *            the clbNm to set
     */
    public void setClbNm(String clbNm) {
	this.clbNm = clbNm;
    }

    /**
     * bbsNm attribute를 리턴한다.
     *
     * @return the bbsNm
     */
    public String getBbsNm() {
	return bbsNm;
    }

    /**
     * bbsNm attribute 값을 설정한다.
     *
     * @param bbsNm
     *            the bbsNm to set
     */
    public void setBbsNm(String bbsNm) {
	this.bbsNm = bbsNm;
    }

    /**
     * userNm attribute를 리턴한다.
     *
     * @return the userNm
     */
    public String getUserNm() {
	return userNm;
    }

    /**
     * userNm attribute 값을 설정한다.
     *
     * @param userNm
     *            the userNm to set
     */
    public void setUserNm(String userNm) {
	this.userNm = userNm;
    }

    /**
     * provdUrl attribute를 리턴한다.
     *
     * @return the provdUrl
     */
    public String getProvdUrl() {
	return provdUrl;
    }

    /**
     * provdUrl attribute 값을 설정한다.
     *
     * @param provdUrl
     *            the provdUrl to set
     */
    public void setProvdUrl(String provdUrl) {
	this.provdUrl = provdUrl;
    }

    /**
     * bbsTyCode attribute를 리턴한다.
     * @return the bbsTyCode
     */
    public String getBbsTyCode() {
        return bbsTyCode;
    }

    /**
     * bbsTyCode attribute 값을 설정한다.
     * @param bbsTyCode the bbsTyCode to set
     */
    public void setBbsTyCode(String bbsTyCode) {
        this.bbsTyCode = bbsTyCode;
    }

    /**
     * toString 메소드를 대치한다.
     */
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }
}
