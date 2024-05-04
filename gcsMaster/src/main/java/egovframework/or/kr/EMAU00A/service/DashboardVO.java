package egovframework.or.kr.EMAU00A.service;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.or.kr.EMAU00B.service.EmpjPsVO;


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
public class DashboardVO implements Serializable {

    

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -5774409406580829524L;

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
    
	/** 검색 사업명 사업부서  */
    private String searchDiv = "";
    
    /** 검색 년도  */
    private String searchYear = "";
    
    /** 검색이름  */
    private String searchName = "";
     
	/** 사업부서코드 **/
    private String searchGrmCode = "";
    
    private String searchGubun = ""; 
     
    private String pcName      = "";
    
    private String pcdayStart  = "";
    
    private String pcdayEnd    = "";
    
    private String searchToday = "";
    
    private String pjStart = "";
    
    private String pjEnd = "";
     
    private String pcOrderBy = "";
    
    private int pjTotal = 0;
    
    private int pjIng = 0;
    
    private int pjPre = 0;

    private String grMcode = "";

    private List<EmpjPsVO> empjPsList;
    
    private Integer empjPsListCnt;
    
    private String searchPjCode = "";
     
    private String pcDayStart = "";
    
    private String pcDayEnd = "";
    
    private String noPk = "";
    
    private String noInday = "";
    
    private String noTitle = "";
    
    private String noText = "";
    
    private String noEtc = "";
    
    private String noWriteDate = "";
    
    private String noReceiveMbCode = "";
    
    private String noRequestMbCode = ""; 
    
    private String gsPk = "";  
    
    private String gsReqMbCode = "";
    
    private String regMbName = "";
    
    private String gsTxt = ""; 
    
    private String  pjInDate = "";
    
    private String pjInMbCode = "";
    
    private String pjInUse = "";    
    
    private String  pjInConfirm = "";
    
    private String pjInRepleDate = ""; 
    
    private String  grPcode  = ""; 
    
    private String clPk = "";
    
    private String pcCode = "";
    
    private String clTitle = "";
    
    private String clOrderby = "";
    
    private String pjPk = "";
    
    private String searchMonth = ""; 
    
    private String noInDay = ""; 
    
    private String noTable = "";
    
    private String noDay  = "";
    
    private String searchStart = "";
    private String searchEnd = "";
    
    
    private String busiYy = "";
    private String busiTotlal = "";
    private String busiInTotal = "";
    
    private String pjYy = "";
    private String pjGubun = "";
    private String pjCnt = "";
    private String ecmitNm = "";
    private String mbrNm = "";
    private String mbrNm2 = "";
    public String getEcmitNm() {
		return ecmitNm;
	}

	public void setEcmitNm(String ecmitNm) {
		this.ecmitNm = ecmitNm;
	}

	public String getMbrNm() {
		return mbrNm;
	}

	public void setMbrNm(String mbrNm) {
		this.mbrNm = mbrNm;
	}

	public String getMbrNm2() {
		return mbrNm2;
	}

	public void setMbrNm2(String mbrNm2) {
		this.mbrNm2 = mbrNm2;
	}

	public String getPlcNm() {
		return plcNm;
	}

	public void setPlcNm(String plcNm) {
		this.plcNm = plcNm;
	}

	public String getAncmNm() {
		return ancmNm;
	}

	public void setAncmNm(String ancmNm) {
		this.ancmNm = ancmNm;
	}

	private String plcNm = "";
    
    
    private String bisiYy = "";
    private String dtlAncmNm = ""; 
     
    private String sbjtId = "";
    private String busiNm = "";
    private String ancmNm = "";
    private String svorgnNm = "";
    private String agreCntrYn = "";
    private String agreCntrYmd = "";
    
    private String searchPjStart = "";
    
    private String start_date = "";
    private String end_date = "";
    private String text = "";
    private String subject = "";
     
    
    
    
    public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getSearchPjStart() {
		return searchPjStart;
	}

	public void setSearchPjStart(String searchPjStart) {
		this.searchPjStart = searchPjStart;
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

	public String getSvorgnNm() {
		return svorgnNm;
	}

	public void setSvorgnNm(String svorgnNm) {
		this.svorgnNm = svorgnNm;
	}

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

	public String getDtlAncmNm() {
		return dtlAncmNm;
	}

	public void setDtlAncmNm(String dtlAncmNm) {
		this.dtlAncmNm = dtlAncmNm;
	}

	public String getBisiYy() {
		return bisiYy;
	}

	public void setBisiYy(String bisiYy) {
		this.bisiYy = bisiYy;
	}

	/** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 50;

    /** 페이지사이즈 */
    private int pageSize = 10;
 

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;
     
    private String brdnBusiNm ="";
    
    private String bbrdnBusiNm ="";
    
    private String agreCntrYnY ="";
    
    private String lastSbjtPrgSeNm ="";
    
    private String lastRptpSubmYn ="";
    
    private String lastEvalYmd =""; 
    
    private String pjSt =""; 
    
    private String pjEd ="";  
    
    private String pjText ="";  
    
    public String getPjSt() {
		return pjSt;
	}

	public void setPjSt(String pjSt) {
		this.pjSt = pjSt;
	}

	public String getPjEd() {
		return pjEd;
	}

	public void setPjEd(String pjEd) {
		this.pjEd = pjEd;
	}

	public String getPjText() {
		return pjText;
	}

	public void setPjText(String pjText) {
		this.pjText = pjText;
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

	public String getAgreCntrYnY() {
		return agreCntrYnY;
	}

	public void setAgreCntrYnY(String agreCntrYnY) {
		this.agreCntrYnY = agreCntrYnY;
	}

	public String getLastSbjtPrgSeNm() {
		return lastSbjtPrgSeNm;
	}

	public void setLastSbjtPrgSeNm(String lastSbjtPrgSeNm) {
		this.lastSbjtPrgSeNm = lastSbjtPrgSeNm;
	}

	public String getLastRptpSubmYn() {
		return lastRptpSubmYn;
	}

	public void setLastRptpSubmYn(String lastRptpSubmYn) {
		this.lastRptpSubmYn = lastRptpSubmYn;
	}

	public String getLastEvalYmd() {
		return lastEvalYmd;
	}

	public void setLastEvalYmd(String lastEvalYmd) {
		this.lastEvalYmd = lastEvalYmd;
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

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public String getPjYy() {
		return pjYy;
	}

	public void setPjYy(String pjYy) {
		this.pjYy = pjYy;
	}

	public String getPjGubun() {
		return pjGubun;
	}

	public void setPjGubun(String pjGubun) {
		this.pjGubun = pjGubun;
	}

	public String getPjCnt() {
		return pjCnt;
	}

	public void setPjCnt(String pjCnt) {
		this.pjCnt = pjCnt;
	}

	public String getBusiYy() {
		return busiYy;
	}

	public void setBusiYy(String busiYy) {
		this.busiYy = busiYy;
	}

	public String getBusiTotlal() {
		return busiTotlal;
	}

	public void setBusiTotlal(String busiTotlal) {
		this.busiTotlal = busiTotlal;
	}

	public String getBusiInTotal() {
		return busiInTotal;
	}

	public void setBusiInTotal(String busiInTotal) {
		this.busiInTotal = busiInTotal;
	}

	/** 첫페이지 인덱스 */
    private int firstIndex = 0;
    
    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 5;
    
	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchStart() {
		return searchStart;
	}

	public void setSearchStart(String searchStart) {
		this.searchStart = searchStart;
	}

	public String getSearchEnd() {
		return searchEnd;
	}

	public void setSearchEnd(String searchEnd) {
		this.searchEnd = searchEnd;
	}

	public String getNoDay() {
		return noDay;
	}

	public void setNoDay(String noDay) {
		this.noDay = noDay;
	}

	public String getNoInDay() {
		return noInDay;
	}

	public void setNoInDay(String noInDay) {
		this.noInDay = noInDay;
	}

	public String getNoTable() {
		return noTable;
	}

	public void setNoTable(String noTable) {
		this.noTable = noTable;
	}

	public String getSearchMonth() {
		return searchMonth;
	}

	public void setSearchMonth(String searchMonth) {
		this.searchMonth = searchMonth;
	}

	public String getPjPk() {
		return pjPk;
	}

	public void setPjPk(String pjPk) {
		this.pjPk = pjPk;
	}

	public String getClPk() {
		return clPk;
	}

	public void setClPk(String clPk) {
		this.clPk = clPk;
	}

	public String getClTitle() {
		return clTitle;
	}

	public void setClTitle(String clTitle) {
		this.clTitle = clTitle;
	}

	public String getClOrderby() {
		return clOrderby;
	}

	public void setClOrderby(String clOrderby) {
		this.clOrderby = clOrderby;
	}

	public String getPcCode() {
		return pcCode;
	}

	public void setPcCode(String pcCode) {
		this.pcCode = pcCode;
	}

	public String getGsPk() {
		return gsPk;
	}

	public void setGsPk(String gsPk) {
		this.gsPk = gsPk;
	}

	public String getGsReqMbCode() {
		return gsReqMbCode;
	}

	public void setGsReqMbCode(String gsReqMbCode) {
		this.gsReqMbCode = gsReqMbCode;
	}

	public String getRegMbName() {
		return regMbName;
	}

	public void setRegMbName(String regMbName) {
		this.regMbName = regMbName;
	}

	public String getGsTxt() {
		return gsTxt;
	}

	public void setGsTxt(String gsTxt) {
		this.gsTxt = gsTxt;
	}

	public String getPjInDate() {
		return pjInDate;
	}

	public void setPjInDate(String pjInDate) {
		this.pjInDate = pjInDate;
	}

	public String getPjInMbCode() {
		return pjInMbCode;
	}

	public void setPjInMbCode(String pjInMbCode) {
		this.pjInMbCode = pjInMbCode;
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

	public String getGrPcode() {
		return grPcode;
	}

	public void setGrPcode(String grPcode) {
		this.grPcode = grPcode;
	}

	public int getPjPre() {
		return pjPre;
	}

	public void setPjPre(int pjPre) {
		this.pjPre = pjPre;
	}

	public String getNoPk() {
		return noPk;
	}

	public void setNoPk(String noPk) {
		this.noPk = noPk;
	}

	public String getNoInday() {
		return noInday;
	}

	public void setNoInday(String noInday) {
		this.noInday = noInday;
	}

	public String getNoTitle() {
		return noTitle;
	}

	public void setNoTitle(String noTitle) {
		this.noTitle = noTitle;
	}

	public String getNoText() {
		return noText;
	}

	public void setNoText(String noText) {
		this.noText = noText;
	}

	public String getNoEtc() {
		return noEtc;
	}

	public void setNoEtc(String noEtc) {
		this.noEtc = noEtc;
	}

	public String getNoWriteDate() {
		return noWriteDate;
	}

	public void setNoWriteDate(String noWriteDate) {
		this.noWriteDate = noWriteDate;
	}

	public String getNoReceiveMbCode() {
		return noReceiveMbCode;
	}

	public void setNoReceiveMbCode(String noReceiveMbCode) {
		this.noReceiveMbCode = noReceiveMbCode;
	}

	public String getNoRequestMbCode() {
		return noRequestMbCode;
	}

	public void setNoRequestMbCode(String noRequestMbCode) {
		this.noRequestMbCode = noRequestMbCode;
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

	public String getSearchPjCode() {
		return searchPjCode;
	}

	public void setSearchPjCode(String searchPjCode) {
		this.searchPjCode = searchPjCode;
	}

	public Integer getEmpjPsListCnt() {
		return empjPsListCnt;
	}

	public void setEmpjPsListCnt(Integer empjPsListCnt) {
		this.empjPsListCnt = empjPsListCnt;
	}

	public List<EmpjPsVO> getEmpjPsList() {
		return empjPsList;
	}

	public void setEmpjPsList(List<EmpjPsVO> empjPsList) {
		this.empjPsList = empjPsList;
	}

	public String getGrMcode() {
		return grMcode;
	}

	public void setGrMcode(String grMcode) {
		this.grMcode = grMcode;
	}

 

	public int getPjTotal() {
		return pjTotal;
	}

	public void setPjTotal(int pjTotal) {
		this.pjTotal = pjTotal;
	}

	public int getPjIng() {
		return pjIng;
	}

	public void setPjIng(int pjIng) {
		this.pjIng = pjIng;
	}

	public String getPcOrderBy() {
		return pcOrderBy;
	}

	public void setPcOrderBy(String pcOrderBy) {
		this.pcOrderBy = pcOrderBy;
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

	public String getSearchToday() {
		return searchToday;
	}

	public void setSearchToday(String searchToday) {
		this.searchToday = searchToday;
	}

	public String getPcName() {
		return pcName;
	}

	public void setPcName(String pcName) {
		this.pcName = pcName;
	}

	public String getPcdayStart() {
		return pcdayStart;
	}

	public void setPcdayStart(String pcdayStart) {
		this.pcdayStart = pcdayStart;
	}

	public String getPcdayEnd() {
		return pcdayEnd;
	}

	public void setPcdayEnd(String pcdayEnd) {
		this.pcdayEnd = pcdayEnd;
	}

	public String getSearchGubun() {
		return searchGubun;
	}

	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
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

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchGrmCode() {
		return searchGrmCode;
	}

	public void setSearchGrmCode(String searchGrmCode) {
		this.searchGrmCode = searchGrmCode;
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
