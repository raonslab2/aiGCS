package egovframework.or.kr.com;

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
public class EmauProjectVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	
	/** 상위 부서 코드 */
	private int pjYear;
	private String pjCode;
	private String pjCateCode1;
	private String pjCateCode2;
	private String pjTitle;
	private String grMCode;
	private String auCode;
	private String pjUse;
	private String pjCateName1;
	private String pjCateName2;
	private String pjCateCodeP1;
	private String pjCateCodeP2;
	private String pjOrderBy;
	private String pjCateNameP;
	private String grMName;
	private String auName;
	
	public int getPjYear() {
		return pjYear;
	}
	public void setPjYear(int pjYear) {
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
	public String getPjTitle() {
		return pjTitle;
	}
	public void setPjTitle(String pjTitle) {
		this.pjTitle = pjTitle;
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
	public String getPjUse() {
		return pjUse;
	}
	public void setPjUse(String pjUse) {
		this.pjUse = pjUse;
	}
	public String getPjCateName1() {
		return pjCateName1;
	}
	public void setPjCateName1(String pjCateName1) {
		this.pjCateName1 = pjCateName1;
	}
	public String getPjCateName2() {
		return pjCateName2;
	}
	public void setPjCateName2(String pjCateName2) {
		this.pjCateName2 = pjCateName2;
	}
	public String getPjCateCodeP1() {
		return pjCateCodeP1;
	}
	public void setPjCateCodeP1(String pjCateCodeP1) {
		this.pjCateCodeP1 = pjCateCodeP1;
	}
	public String getPjCateCodeP2() {
		return pjCateCodeP2;
	}
	public void setPjCateCodeP2(String pjCateCodeP2) {
		this.pjCateCodeP2 = pjCateCodeP2;
	}
	public String getPjOrderBy() {
		return pjOrderBy;
	}
	public void setPjOrderBy(String pjOrderBy) {
		this.pjOrderBy = pjOrderBy;
	}
	public String getPjCateNameP() {
		return pjCateNameP;
	}
	public void setPjCateNameP(String pjCateNameP) {
		this.pjCateNameP = pjCateNameP;
	}
	public String getGrMName() {
		return grMName;
	}
	public void setGrMName(String grMName) {
		this.grMName = grMName;
	}
	public String getAuName() {
		return auName;
	}
	public void setAuName(String auName) {
		this.auName = auName;
	}
	
	@Override
	public String toString() {
		return "EmauProjectVO [pjYear=" + pjYear + ", pjCode=" + pjCode + ", pjCateCode1=" + pjCateCode1
				+ ", pjCateCode2=" + pjCateCode2 + ", pjTitle=" + pjTitle + ", grMCode=" + grMCode + ", auCode="
				+ auCode + ", pjUse=" + pjUse + ", pjCateName1=" + pjCateName1 + ", pjCateName2=" + pjCateName2
				+ ", pjCateCodeP1=" + pjCateCodeP1 + ", pjCateCodeP2=" + pjCateCodeP2 + ", pjOrderBy=" + pjOrderBy
				+ ", pjCateNameP=" + pjCateNameP + ", grMName=" + grMName + ", auName=" + auName + "]";
	}
	
	
	
}
