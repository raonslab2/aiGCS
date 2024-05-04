package egovframework.or.kr.GA00MAIN.service;

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
public class GA00MAINVO implements Serializable{ 
	
	private static final long serialVersionUID = -9219604963667213010L; 

	private	String	codePk ="";
	private	String	codeName =""; 
	
	
	public String getCodePk() {
		return codePk;
	}
	public void setCodePk(String codePk) {
		this.codePk = codePk;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	
 
}
