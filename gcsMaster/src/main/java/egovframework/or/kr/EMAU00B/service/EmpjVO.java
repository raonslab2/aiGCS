package egovframework.or.kr.EMAU00B.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @Class Name : EmpjVO.java
 * @Description : Login VO class
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
public class EmpjVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	 
	private String ancmId;
	private String pjGubun;
	
	private String grpCode;	
	private String pjYear;
	private String pjCode;
	private String pjCateCode1;
	private String pjCateCode2;
	private String grMCode;
	private String auCode;
	private String pjTitle;
	private String orderBy;
	private String WriteTime; 
	private List<EmpjPsVO> empjPsList;
	private Integer empjPsListCnt;
	
	private String pjStart;
	private String pjEnd;
	
	private String mbCode;
	
	private String pjYmd;
	private String evalGd;
	private String lginId2;
	private String mbrNm2;
	
    private String rsltNm;
    
    private String plcNm;
     
    private String agreCntrYmd;
    
    private String totDvlpSrtYmd;
    
    private String totDvlpEndYmd; 
    
    private String svorgnNm;
    
    private String sbjtNm;
     
    private String agreCntrYn = "";

	public String getAgreCntrYn() {
		return agreCntrYn;
	}
	public void setAgreCntrYn(String agreCntrYn) {
		this.agreCntrYn = agreCntrYn;
	}
	public String getAgreCntrYmd() {
		return agreCntrYmd;
	}
	public void setAgreCntrYmd(String agreCntrYmd) {
		this.agreCntrYmd = agreCntrYmd;
	}
	public String getTotDvlpSrtYmd() {
		return totDvlpSrtYmd;
	}
	public void setTotDvlpSrtYmd(String totDvlpSrtYmd) {
		this.totDvlpSrtYmd = totDvlpSrtYmd;
	}
	public String getTotDvlpEndYmd() {
		return totDvlpEndYmd;
	}
	public void setTotDvlpEndYmd(String totDvlpEndYmd) {
		this.totDvlpEndYmd = totDvlpEndYmd;
	}
	public String getSvorgnNm() {
		return svorgnNm;
	}
	public void setSvorgnNm(String svorgnNm) {
		this.svorgnNm = svorgnNm;
	}
	public String getSbjtNm() {
		return sbjtNm;
	}
	public void setSbjtNm(String sbjtNm) {
		this.sbjtNm = sbjtNm;
	}
	public String getPlcNm() {
		return plcNm;
	}
	public void setPlcNm(String plcNm) {
		this.plcNm = plcNm;
	}
	public String getRsltNm() {
		return rsltNm;
	}
	public void setRsltNm(String rsltNm) {
		this.rsltNm = rsltNm;
	}
	public String getEvalGd() {
		return evalGd;
	}
	public void setEvalGd(String evalGd) {
		this.evalGd = evalGd;
	}
	public String getLginId2() {
		return lginId2;
	}
	public void setLginId2(String lginId2) {
		this.lginId2 = lginId2;
	}
	public String getMbrNm2() {
		return mbrNm2;
	}
	public void setMbrNm2(String mbrNm2) {
		this.mbrNm2 = mbrNm2;
	}
	public String getAncmId() {
		return ancmId;
	}
	public void setAncmId(String ancmId) {
		this.ancmId = ancmId;
	}
	public String getPjGubun() {
		return pjGubun;
	}
	public void setPjGubun(String pjGubun) {
		this.pjGubun = pjGubun;
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
	//과제순번
	private String sbjtSn;
	//사업년도
	private String busiYy;
	
	private String nrmBuclCd;
	//과제ID번호
	private String sbjtId;
	//사업명
	private String busiNm;
	//내역사업명
	private String brdnBusiNm;
	//내내역 사업명
	private String bbrdnBusiNm;
	//공고일자
	private String ancmYmd;
	//공고명
	private String ancmNm;
	//세부공고명
	private String dtlAncmNm;
	//개발시작일자
	private String dvlpSrtYmd;
	//개발종료일자
	private String dvlpEndYmd;
	//접수마감일자
	private String rcptClosYmd;
	//제출완료일자
	private String submCmptYmd;
	//접수상태구분
	private String lastSbjtPrgSeNm;
	
	
	
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
	
    /** 검색 년도  */
    private String searchYear = "";
    
    /** 검색이름  */
    private String searchName = "";
    
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
	
	public String getLastSbjtPrgSeNm() {
		return lastSbjtPrgSeNm;
	}
	public void setLastSbjtPrgSeNm(String lastSbjtPrgSeNm) {
		this.lastSbjtPrgSeNm = lastSbjtPrgSeNm;
	}
	public String getSbjtSn() {
		return sbjtSn;
	}
	public void setSbjtSn(String sbjtSn) {
		this.sbjtSn = sbjtSn;
	}
	public String getBusiYy() {
		return busiYy;
	}
	public void setBusiYy(String busiYy) {
		this.busiYy = busiYy;
	}
	public String getAncmYmd() {
		return ancmYmd;
	}
	public void setAncmYmd(String ancmYmd) {
		this.ancmYmd = ancmYmd;
	}
	public String getDvlpSrtYmd() {
		return dvlpSrtYmd;
	}
	public void setDvlpSrtYmd(String dvlpSrtYmd) {
		this.dvlpSrtYmd = dvlpSrtYmd;
	}
	public String getDvlpEndYmd() {
		return dvlpEndYmd;
	}
	public void setDvlpEndYmd(String dvlpEndYmd) {
		this.dvlpEndYmd = dvlpEndYmd;
	}
	public String getRcptClosYmd() {
		return rcptClosYmd;
	}
	public void setRcptClosYmd(String rcptClosYmd) {
		this.rcptClosYmd = rcptClosYmd;
	}
	public String getSubmCmptYmd() {
		return submCmptYmd;
	}
	public void setSubmCmptYmd(String submCmptYmd) {
		this.submCmptYmd = submCmptYmd;
	}
	public String getBusyYy() {
		return busiYy;
	}
	public void setBusyYy(String busyYy) {
		this.busiYy = busyYy;
	}
	public String getSbjtId() {
		return sbjtId;
	}
	public void setSbjtId(String sbjtId) {
		this.sbjtId = sbjtId;
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
	public String getDtlAncmNm() {
		return dtlAncmNm;
	}
	public void setDtlAncmNm(String dtlAncmNm) {
		this.dtlAncmNm = dtlAncmNm;
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
	public Integer getEmpjPsListCnt() {
		return empjPsListCnt;
	}
	public void setEmpjPsListCnt(Integer empjPsListCnt) {
		this.empjPsListCnt = empjPsListCnt;
	}
	public String getGrpCode() {
		return grpCode;
	}
	public void setGrpCode(String grpCode) {
		this.grpCode = grpCode;
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
		return WriteTime;
	}
	public void setWriteTime(String writeTime) {
		WriteTime = writeTime;
	} 
	public String getNrmBuclCd() {
		return nrmBuclCd;
	}
	public void setNrmBuclCd(String nrmBuclCd) {
		this.nrmBuclCd = nrmBuclCd;
	}
	public List<EmpjPsVO> getEmpjPsList() {
		return empjPsList;
	}
	public void setEmpjPsList(List<EmpjPsVO> empjPsList) {
		this.empjPsList = empjPsList;
	}
	
	private String lastEvalYmd;
	private String ecmitNm;
	
	public String getLastEvalYmd() {
		return lastEvalYmd;
	}
	public void setLastEvalYmd(String lastEvalYmd) {
		this.lastEvalYmd = lastEvalYmd;
	}
	public String getEcmitNm() {
		return ecmitNm;
	}
	public void setEcmitNm(String ecmitNm) {
		this.ecmitNm = ecmitNm;
	}
	
	private String prblSbjtRcptYmd;
	private String prblSbjtRsn;
	private String spevlYmd;
	private String spevlRsltNm;
	
	public String getPrblSbjtRcptYmd() {
		return prblSbjtRcptYmd;
	}
	public void setPrblSbjtRcptYmd(String prblSbjtRcptYmd) {
		this.prblSbjtRcptYmd = prblSbjtRcptYmd;
	}
	public String getPrblSbjtRsn() {
		return prblSbjtRsn;
	}
	public void setPrblSbjtRsn(String prblSbjtRsn) {
		this.prblSbjtRsn = prblSbjtRsn;
	}
	public String getSpevlYmd() {
		return spevlYmd;
	}
	public void setSpevlYmd(String spevlYmd) {
		this.spevlYmd = spevlYmd;
	}
	public String getSpevlRsltNm() {
		return spevlRsltNm;
	}
	public void setSpevlRsltNm(String spevlRsltNm) {
		this.spevlRsltNm = spevlRsltNm;
	}
	
	private String lastRptpSubmYn;
	private String lastRptpSubmYmd;
	
	public String getLastRptpSubmYn() {
		return lastRptpSubmYn;
	}
	public void setLastRptpSubmYn(String lastRptpSubmYn) {
		this.lastRptpSubmYn = lastRptpSubmYn;
	}
	public String getLastRptpSubmYmd() {
		return lastRptpSubmYmd;
	}
	public void setLastRptpSubmYmd(String lastRptpSubmYmd) {
		this.lastRptpSubmYmd = lastRptpSubmYmd;
	}
	
	private String ymd2;
	private String rsltNm2;
	
	public String getYmd2() {
		return ymd2;
	}
	public void setYmd2(String ymd2) {
		this.ymd2 = ymd2;
	}
	public String getRsltNm2() {
		return rsltNm2;
	}
	public void setRsltNm2(String rsltNm2) {
		this.rsltNm2 = rsltNm2;
	}
	
	private String lastEvalObjapEvalYmd;
	private String lastEvalObjapEvalRsltNm;
	
	public String getLastEvalObjapEvalYmd() {
		return lastEvalObjapEvalYmd;
	}
	public void setLastEvalObjapEvalYmd(String lastEvalObjapEvalYmd) {
		this.lastEvalObjapEvalYmd = lastEvalObjapEvalYmd;
	}
	public String getLastEvalObjapEvalRsltNm() {
		return lastEvalObjapEvalRsltNm;
	}
	public void setLastEvalObjapEvalRsltNm(String lastEvalObjapEvalRsltNm) {
		this.lastEvalObjapEvalRsltNm = lastEvalObjapEvalRsltNm;
	}
	@Override
	public String toString() {
		return "EmpjVO [grpCode=" + grpCode + ", pjYear=" + pjYear + ", pjCode=" + pjCode + ", pjCateCode1="
				+ pjCateCode1 + ", pjCateCode2=" + pjCateCode2 + ", grMCode=" + grMCode + ", auCode=" + auCode
				+ ", pjTitle=" + pjTitle + ", orderBy=" + orderBy + ", WriteTime=" + WriteTime + ", empjPsList="
				+ empjPsList + ", empjPsListCnt=" + empjPsListCnt + ", pjStart=" + pjStart + ", pjEnd=" + pjEnd
				+ ", sbjtSn=" + sbjtSn + ", busiYy=" + busiYy + ", sbjtId=" + sbjtId + ", busiNm=" + busiNm
				+ ", brdnBusiNm=" + brdnBusiNm + ", bbrdnBusiNm=" + bbrdnBusiNm + ", ancmYmd=" + ancmYmd + ", ancmNm="
				+ ancmNm + ", dtlAncmNm=" + dtlAncmNm + ", dvlpSrtYmd=" + dvlpSrtYmd + ", dvlpEndYmd=" + dvlpEndYmd
				+ ", rcptClosYmd=" + rcptClosYmd + ", submCmptYmd=" + submCmptYmd + ", lastSbjtPrgSeNm="
				+ lastSbjtPrgSeNm + ", nrmBuclCd=" + nrmBuclCd + ", pageIndex=" + pageIndex
				+ ", pageUnit=" + pageUnit + ", pageSize=" + pageSize + ", firstIndex=" + firstIndex + ", lastIndex="
				+ lastIndex + ", recordCountPerPage=" + recordCountPerPage + ", searchYear=" + searchYear
				+ ", searchName=" + searchName + "]";
	}
	
	
}
