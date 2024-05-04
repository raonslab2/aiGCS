package egovframework.or.kr.EMAU00D.service;

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
public class EmauProcessVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	
	private int pcCode;
	private String pcName;
	private int pcPCode;
	private int pcOrderBy;
	private String pcScheduleCode;
	private String pcScheduleName;
	private int pcUse;
	private String pcNameP;
	
	private int clPk;
	private String clTitle;
	private int clOrderBy;
	private int clUse;
	
	private int pjPk;
	private int pcWorkPoint;
	private String pcDayStart;
	private String pcDayEnd;
	private String pcCateCode;

	public int getPcCode() {
		return pcCode;
	}

	public void setPcCode(int pcCode) {
		this.pcCode = pcCode;
	}

	public String getPcName() {
		return pcName;
	}

	public void setPcName(String pcName) {
		this.pcName = pcName;
	}

	public int getPcPCode() {
		return pcPCode;
	}

	public void setPcPCode(int pcPCode) {
		this.pcPCode = pcPCode;
	}

	public int getPcOrderBy() {
		return pcOrderBy;
	}

	public void setPcOrderBy(int pcOrderBy) {
		this.pcOrderBy = pcOrderBy;
	}

	public String getPcScheduleCode() {
		return pcScheduleCode;
	}

	public void setPcScheduleCode(String pcScheduleCode) {
		this.pcScheduleCode = pcScheduleCode;
	}

	public String getPcScheduleName() {
		return pcScheduleName;
	}

	public void setPcScheduleName(String pcScheduleName) {
		this.pcScheduleName = pcScheduleName;
	}

	public int getPcUse() {
		return pcUse;
	}

	public void setPcUse(int pcUse) {
		this.pcUse = pcUse;
	}

	public String getPcNameP() {
		return pcNameP;
	}

	public void setPcNameP(String pcNameP) {
		this.pcNameP = pcNameP;
	}

	public int getClPk() {
		return clPk;
	}

	public void setClPk(int clPk) {
		this.clPk = clPk;
	}

	public String getClTitle() {
		return clTitle;
	}

	public void setClTitle(String clTitle) {
		this.clTitle = clTitle;
	}

	public int getClOrderBy() {
		return clOrderBy;
	}

	public void setClOrderBy(int clOrderBy) {
		this.clOrderBy = clOrderBy;
	}

	public int getClUse() {
		return clUse;
	}

	public void setClUse(int clUse) {
		this.clUse = clUse;
	}

	public int getPjPk() {
		return pjPk;
	}

	public void setPjPk(int pjPk) {
		this.pjPk = pjPk;
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

	public String getPcCateCode() {
		return pcCateCode;
	}

	public void setPcCateCode(String pcCateCode) {
		this.pcCateCode = pcCateCode;
	}

	public int getPcWorkPoint() {
		return pcWorkPoint;
	}

	public void setPcWorkPoint(int pcWorkPoint) {
		this.pcWorkPoint = pcWorkPoint;
	}

	@Override
	public String toString() {
		return "EmauProcessVO [pcCode=" + pcCode + ", pcName=" + pcName + ", pcPCode=" + pcPCode + ", pcOrderBy="
				+ pcOrderBy + ", pcScheduleCode=" + pcScheduleCode + ", pcScheduleName=" + pcScheduleName + ", pcUse="
				+ pcUse + ", pcNameP=" + pcNameP + ", clPk=" + clPk + ", clTitle=" + clTitle + ", clOrderBy="
				+ clOrderBy + ", clUse=" + clUse + ", pjPk=" + pjPk + ", pcWorkPoint=" + pcWorkPoint + ", pcDayStart="
				+ pcDayStart + ", pcDayEnd=" + pcDayEnd + ", pcCateCode=" + pcCateCode + "]";
	}

}
