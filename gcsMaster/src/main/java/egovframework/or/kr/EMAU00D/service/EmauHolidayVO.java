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
public class EmauHolidayVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	
	private int hoPk;
	private String hoName;
	private String hoHoliday;
	private int hoRepeatCycle;
	private int hoUse;
	private String hoRepeatCycleName;
	
	public int getHoPk() {
		return hoPk;
	}
	public void setHoPk(int hoPk) {
		this.hoPk = hoPk;
	}
	public String getHoName() {
		return hoName;
	}
	public void setHoName(String hoName) {
		this.hoName = hoName;
	}
	public String getHoHoliday() {
		return hoHoliday;
	}
	public void setHoHoliday(String hoHoliday) {
		this.hoHoliday = hoHoliday;
	}
	public int getHoRepeatCycle() {
		return hoRepeatCycle;
	}
	public void setHoRepeatCycle(int hoRepeatCycle) {
		this.hoRepeatCycle = hoRepeatCycle;
	}
	public int getHoUse() {
		return hoUse;
	}
	public void setHoUse(int hoUse) {
		this.hoUse = hoUse;
	}
	public String getHoRepeatCycleName() {
		return hoRepeatCycleName;
	}
	public void setHoRepeatCycleName(String hoRepeatCycleName) {
		this.hoRepeatCycleName = hoRepeatCycleName;
	}
	
	@Override
	public String toString() {
		return "EmauHolidayVO [hoPk=" + hoPk + ", hoName=" + hoName + ", hoHoliday=" + hoHoliday + ", hoRepeatCycle="
				+ hoRepeatCycle + ", hoUse=" + hoUse + ", hoRepeatCycleName=" + hoRepeatCycleName + "]";
	}
	
}
