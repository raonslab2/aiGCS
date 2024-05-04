package egovframework.or.kr.EMAU00E.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;


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
public class BusinessPjVO implements Serializable {

    /**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -8164785314697750055L;

	/** 게시판 아이디 */
    private String bbsId = "";

    /** 대상시스템 아이디 */
    private String trgetId = "";

    /** 대상 구분 (커뮤니티, 동호회) */
    private String trgetType = "";

    /** 최초 등록자 아이디 */
    private String frstRegisterId = "";

    /** 최초등록시점 */
    private String frstRegisterPnttm = "";

    /** 최종수정자 아이디 */
    private String lastUpdusrId = "";

    /** 최종수정시점 */
    private String lastUpdusrPnttm = "";

    /** 등록구분코드 */
    private String registSeCode = "";

    /** 사용여부 */
    private String useAt = "";
    
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

	public String getPjCateCode1() {
		return pjCateCode1;
	}

	public void setPjCateCode1(String pjCateCode1) {
		this.pjCateCode1 = pjCateCode1;
	}

	public String getPjCateCode2() {
		return pjCateCode2;
	}

	public void setPjCateCode2(String pjCateCode2) {
		this.pjCateCode2 = pjCateCode2;
	}

	public String getGrMCode() {
		return grMCode;
	}

	public void setGrMCode(String grMCode) {
		this.grMCode = grMCode;
	}

	public String getPjCateName2() {
		return pjCateName2;
	}

	public void setPjCateName2(String pjCateName2) {
		this.pjCateName2 = pjCateName2;
	}

	public String getGrMname() {
		return grMname;
	}

	public void setGrMname(String grMname) {
		this.grMname = grMname;
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

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getWriteTime() {
		return writeTime;
	}

	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}

	public String getSysUpdate() {
		return sysUpdate;
	}

	public void setSysUpdate(String sysUpdate) {
		this.sysUpdate = sysUpdate;
	}

	public String getPjUse() {
		return pjUse;
	}

	public void setPjUse(String pjUse) {
		this.pjUse = pjUse;
	}

	private String pjYear = "";
    private String pjCode = "";
    private String pjCateCode1 = "";
    private String pjCateCode2 = "";
    private String grMCode = "";
    private String auCode = "";
    private String pjTitle = "";
    private String orderBy = "";
    private String writeTime = "";
    private String sysUpdate = "";
    private String pjUse = "";
    private String pjCateName1;
    private String pjCateName2;
    private String grSumName;
    private String auName;
    private String mbName;
    private String pjAuId;
    private String grMname;
    private String grpCode;
    private String grmCode;
    private String grmName;
    private String grOrderBy;
    private String mbRankName;
    private String mbCode;
    private String grSumNamee;
    
    

    public String getGrSumNamee() {
		return grSumNamee;
	}

	public void setGrSumNamee(String grSumNamee) {
		this.grSumNamee = grSumNamee;
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

	public String getGrOrderBy() {
		return grOrderBy;
	}

	public void setGrOrderBy(String grOrderBy) {
		this.grOrderBy = grOrderBy;
	}

	public String getPjAuId() {
		return pjAuId;
	}

	public void setPjAuId(String pjAuId) {
		this.pjAuId = pjAuId;
	}

	public String getAuName() {
		return auName;
	}

	public void setAuName(String auName) {
		this.auName = auName;
	}

	public String getMbName() {
		return mbName;
	}

	public void setMbName(String mbName) {
		this.mbName = mbName;
	}

	public String getPjCateName1() {
		return pjCateName1;
	}

	public void setPjCateName1(String pjCateName1) {
		this.pjCateName1 = pjCateName1;
	}

	/**
     * bbsId attribute를 리턴한다.
     *
     * @return the bbsId
     */
    public String getBbsId() {
	return bbsId;
    }

    /**
     * bbsId attribute 값을 설정한다.
     *
     * @param bbsId
     *            the bbsId to set
     */
    public void setBbsId(String bbsId) {
	this.bbsId = bbsId;
    }

    /**
     * trgetId attribute를 리턴한다.
     *
     * @return the trgetId
     */
    public String getTrgetId() {
	return trgetId;
    }

    /**
     * trgetId attribute 값을 설정한다.
     *
     * @param trgetId
     *            the trgetId to set
     */
    public void setTrgetId(String trgetId) {
	this.trgetId = trgetId;
    }

    /**
     * frstRegisterId attribute를 리턴한다.
     *
     * @return the frstRegisterId
     */
    public String getFrstRegisterId() {
	return frstRegisterId;
    }

    /**
     * frstRegisterId attribute 값을 설정한다.
     *
     * @param frstRegisterId
     *            the frstRegisterId to set
     */
    public void setFrstRegisterId(String frstRegisterId) {
	this.frstRegisterId = frstRegisterId;
    }

    /**
     * frstRegisterPnttm attribute를 리턴한다.
     *
     * @return the frstRegisterPnttm
     */
    public String getFrstRegisterPnttm() {
	return frstRegisterPnttm;
    }

    /**
     * frstRegisterPnttm attribute 값을 설정한다.
     *
     * @param frstRegisterPnttm
     *            the frstRegisterPnttm to set
     */
    public void setFrstRegisterPnttm(String frstRegisterPnttm) {
	this.frstRegisterPnttm = frstRegisterPnttm;
    }

    /**
     * lastUpdusrId attribute를 리턴한다.
     *
     * @return the lastUpdusrId
     */
    public String getLastUpdusrId() {
	return lastUpdusrId;
    }

    /**
     * lastUpdusrId attribute 값을 설정한다.
     *
     * @param lastUpdusrId
     *            the lastUpdusrId to set
     */
    public void setLastUpdusrId(String lastUpdusrId) {
	this.lastUpdusrId = lastUpdusrId;
    }

    /**
     * lastUpdusrPnttm attribute를 리턴한다.
     *
     * @return the lastUpdusrPnttm
     */
    public String getLastUpdusrPnttm() {
	return lastUpdusrPnttm;
    }

    /**
     * lastUpdusrPnttm attribute 값을 설정한다.
     *
     * @param lastUpdusrPnttm
     *            the lastUpdusrPnttm to set
     */
    public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
	this.lastUpdusrPnttm = lastUpdusrPnttm;
    }

    /**
     * registSeCode attribute를 리턴한다.
     *
     * @return the registSeCode
     */
    public String getRegistSeCode() {
	return registSeCode;
    }

    /**
     * registSeCode attribute 값을 설정한다.
     *
     * @param registSeCode
     *            the registSeCode to set
     */
    public void setRegistSeCode(String registSeCode) {
	this.registSeCode = registSeCode;
    }

    /**
     * useAt attribute를 리턴한다.
     *
     * @return the useAt
     */
    public String getUseAt() {
	return useAt;
    }

    /**
     * useAt attribute 값을 설정한다.
     *
     * @param useAt
     *            the useAt to set
     */
    public void setUseAt(String useAt) {
	this.useAt = useAt;
    }

    /**
     * trgetType attribute를 리턴한다.
     * @return the trgetType
     */
    public String getTrgetType() {
        return trgetType;
    }

    /**
     * trgetType attribute 값을 설정한다.
     * @param trgetType the trgetType to set
     */
    public void setTrgetType(String trgetType) {
        this.trgetType = trgetType;
    }

    /**
     * toString 메소드를 대치한다.
     */
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }

	public String getGrSumName() {
		return grSumName;
	}

	public void setGrSumName(String grSumName) {
		this.grSumName = grSumName;
	}
}
