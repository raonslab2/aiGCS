package egovframework.or.kr.EMAU00B.service;

import java.io.Serializable;

/**
 * @Class Name : EmpjPsVO.java
 * @Description : EmpjPsVO VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2021.07.09    민병안          최초 생성
 *
 *  @author 공통서비스 개발팀 민병안
 *  @since 2021.07.09
 *  @version 1.0
 *  @see
 *  
 */
public class EmpjPsVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;

	String pjPk;
	
	String pjCode;
	
	String pcCode;
	
	String pcName;
	
	String workPoint;
	
	String pcDayStart;
	
	String pcDayEnd; 
	
	String startYear;
	
	String startMonth;
	
	String startDay;
	
	String endYear;
	
	String endMonth;
	
	String endDay;
	
	String pjNum;
	
	String pjTitle;
	
	String pjCnt;
	
	String rowNum;
	
	String pjMonthday;
	
	String pjStart;
	
	String pjEnd;
	
	String grMcode;
	String ancmId;
	String busiYy;
	String busiNm;
	String brdnBusiNm;
	String bbrdnBusiNm;
	String ancmNm;
	String pjGubun;
	String lginId2;
	String pjMonth;
	String pjYmdSt;
	String pjYmdEd;  
	String mbCode;
	 
	private String pjYmd;
	
	private String bbrndBusiNm;
	
    private String pmMonth;
   
	public String getPmMonth() {
		return pmMonth;
	}

	public void setPmMonth(String pmMonth) {
		this.pmMonth = pmMonth;
	}

	public String getBbrndBusiNm() {
		return bbrndBusiNm;
	}

	public void setBbrndBusiNm(String bbrndBusiNm) {
		this.bbrndBusiNm = bbrndBusiNm;
	}

	public String getPjYmd() {
		return pjYmd;
	}

	public void setPjYmd(String pjYmd) {
		this.pjYmd = pjYmd;
	}

	public String getMbCode() {
		return mbCode;
	}

	public void setMbCode(String mbCode) {
		this.mbCode = mbCode;
	}

	public String getGrMcode() {
		return grMcode;
	}

	public void setGrMcode(String grMcode) {
		this.grMcode = grMcode;
	}

	public String getAncmId() {
		return ancmId;
	}

	public void setAncmId(String ancmId) {
		this.ancmId = ancmId;
	}

	public String getBusiYy() {
		return busiYy;
	}

	public void setBusiYy(String busiYy) {
		this.busiYy = busiYy;
	}

	public String getBusiNm() {
		return busiNm;
	}

	public void setBusiNm(String busiNm) {
		this.busiNm = busiNm;
	}

	public String getBrdnBusiNm() {
		return brdnBusiNm;
	}

	public void setBrdnBusiNm(String brdnBusiNm) {
		this.brdnBusiNm = brdnBusiNm;
	}

	public String getBbrdnBusiNm() {
		return bbrdnBusiNm;
	}

	public void setBbrdnBusiNm(String bbrdnBusiNm) {
		this.bbrdnBusiNm = bbrdnBusiNm;
	}

	public String getAncmNm() {
		return ancmNm;
	}

	public void setAncmNm(String ancmNm) {
		this.ancmNm = ancmNm;
	}

	public String getPjGubun() {
		return pjGubun;
	}

	public void setPjGubun(String pjGubun) {
		this.pjGubun = pjGubun;
	}

	public String getLginId2() {
		return lginId2;
	}

	public void setLginId2(String lginId2) {
		this.lginId2 = lginId2;
	}

	public String getPjMonth() {
		return pjMonth;
	}

	public void setPjMonth(String pjMonth) {
		this.pjMonth = pjMonth;
	}

	public String getPjYmdSt() {
		return pjYmdSt;
	}

	public void setPjYmdSt(String pjYmdSt) {
		this.pjYmdSt = pjYmdSt;
	}

	public String getPjYmdEd() {
		return pjYmdEd;
	}

	public void setPjYmdEd(String pjYmdEd) {
		this.pjYmdEd = pjYmdEd;
	}

	public String getPjStart() {
		return pjStart;
	}

	public void setPjStart(String pjStart) {
		this.pjStart = pjStart;
	}

	public String getPjEnd() {
		return pjEnd;
	}

	public void setPjEnd(String pjEnd) {
		this.pjEnd = pjEnd;
	}

	public String getPjMonthday() {
		return pjMonthday;
	}

	public void setPjMonthday(String pjMonthday) {
		this.pjMonthday = pjMonthday;
	}

	public String getPjCnt() {
		return pjCnt;
	}

	public void setPjCnt(String pjCnt) {
		this.pjCnt = pjCnt;
	}

	public String getRowNum() {
		return rowNum;
	}

	public void setRowNum(String rowNum) {
		this.rowNum = rowNum;
	}

	public String getPjTitle() {
		return pjTitle;
	}

	public void setPjTitle(String pjTitle) {
		this.pjTitle = pjTitle;
	}

	public String getStartYear() {
		return startYear;
	}

	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}

	public String getStartMonth() {
		return startMonth;
	}

	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndYear() {
		return endYear;
	}

	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}

	public String getEndMonth() {
		return endMonth;
	}

	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
 
	
	public String getPjPk() {
		return pjPk;
	}
	
	public void setPjPk(String pjPk) {
		this.pjPk = pjPk;
	}
	
	public String getPjCode() {
		return pjCode;
	}
	
	public void setPjCode(String pjCode) {
		this.pjCode = pjCode;
	}
	
	public String getPcCode() {
		return pcCode;
	}
	
	public void setPcCode(String pcCode) {
		this.pcCode = pcCode;
	}
	
	public String getPcName() {
		return pcName;
	}
	
	public void setPcName(String pcName) {
		this.pcName = pcName;
	}
	
	public String getWorkPoint() {
		return workPoint;
	}
	
	public void setWorkPoint(String workPoint) {
		this.workPoint = workPoint;
	}
	
	public String getPcDayStart() {
		return pcDayStart;
	}
	
	public void setPcDayStart(String pcDayStart) {
		this.pcDayStart = pcDayStart;
	}
	
	public String getPcDayEnd() {
		return pcDayEnd;
	}
	
	public void setPcDayEnd(String pcDayEnd) {
		this.pcDayEnd = pcDayEnd;
	}
 
	public String getPjNum() {
		return pjNum;
	}

	public void setPjNum(String pjNum) {
		this.pjNum = pjNum;
	}
}
