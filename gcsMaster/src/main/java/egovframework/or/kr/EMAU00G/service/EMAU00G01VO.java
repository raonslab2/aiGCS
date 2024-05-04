package egovframework.or.kr.EMAU00G.service;

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
public class EMAU00G01VO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	/** 수행구분 */
	private String seCall;
	/** 자료구분 */
	private String reGubun;
	/** 사업코드 */
	private String pjCode;
	/** 사업명 */
	private String pjTitle;
	/** 사업차수 */
	private String pjTitleNum;
	/** 사업부서 */
	private String grmCode;
	/** 사업부서명 */
	private String grmName;
	public String getGrmName() {
		return grmName;
	}
	public void setGrmName(String grmName) {
		this.grmName = grmName;
	}

	private String year;
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}

	/** 담당자정보 */
	private String mbCode;
	/** 요청코드 */
	private String seqCode;
	/** 성공여부 */
	private String successYN;
	/** 실패사유 */
	private String failReason;
	/** 결과파일경로 */
	private String resultFile;
	
	public String getSeCode() {
		return seCode;
	}
	public void setSeCode(String seCode) {
		this.seCode = seCode;
	}
	public String getRpaPk() {
		return rpaPk;
	}
	public void setRpaPk(String rpaPk) {
		this.rpaPk = rpaPk;
	}
	public String getSysWriteTime() {
		return sysWriteTime;
	}
	public void setSysWriteTime(String sysWriteTime) {
		this.sysWriteTime = sysWriteTime;
	}

	private String seCode;
	
	private String rpaPk;
	
	private String sysWriteTime;
	
	private String pjTitle2;
	public String getPjTitle2() {
		return pjTitle2;
	}
	public void setPjTitle2(String pjTitle2) {
		this.pjTitle2 = pjTitle2;
	}
	public String getReGubun() {
		return reGubun;
	}
	public void setReGubun(String reGubun) {
		this.reGubun = reGubun;
	}
	public String getPjCode() {
		return pjCode;
	}
	public void setPjCode(String pjCode) {
		this.pjCode = pjCode;
	}
	public String getPjTitle() {
		return pjTitle;
	}
	public void setPjTitle(String pjTitle) {
		this.pjTitle = pjTitle;
	}
	public String getPjTitleNum() {
		return pjTitleNum;
	}
	public void setPjTitleNum(String pjTitleNum) {
		this.pjTitleNum = pjTitleNum;
	}
	public String getGrmCode() {
		return grmCode;
	}
	public void setGrmCode(String grmCode) {
		this.grmCode = grmCode;
	}
	public String getMbCode() {
		return mbCode;
	}
	public void setMbCode(String mbCode) {
		this.mbCode = mbCode;
	}
	public String getSeqCode() {
		return seqCode;
	}
	public void setSeqCode(String seqCode) {
		this.seqCode = seqCode;
	}
	public String getSuccessYN() {
		return successYN;
	}
	public void setSuccessYN(String successYN) {
		this.successYN = successYN;
	}
	public String getFailReason() {
		return failReason;
	}
	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}
	public String getResultFile() {
		return resultFile;
	}
	public void setResultFile(String resultFile) {
		this.resultFile = resultFile;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getSeCall() {
		return seCall;
	}
	public void setSeCall(String seCall) {
		this.seCall = seCall;
	}
	@Override
	public String toString() {
		return "EMAU00G01VO [seCall=" + seCall + ", reGubun=" + reGubun + ", pjCode=" + pjCode + ", pjTitle=" + pjTitle
				+ ", pjTitleNum=" + pjTitleNum + ", grmCode=" + grmCode + ", grmName=" + grmName + ", year=" + year
				+ ", mbCode=" + mbCode + ", seqCode=" + seqCode + ", successYN=" + successYN + ", failReason="
				+ failReason + ", resultFile=" + resultFile + ", seCode=" + seCode + ", rpaPk=" + rpaPk
				+ ", sysWriteTime=" + sysWriteTime + ", pjTitle2=" + pjTitle2 + "]";
	}
	
}
