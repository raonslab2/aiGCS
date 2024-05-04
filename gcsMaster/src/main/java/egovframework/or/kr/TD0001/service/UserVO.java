package egovframework.or.kr.TD0001.service;
 
import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2022.03.08    민병안          최초 생성
 *
 *  @author 개발팀 박지욱
 *  @since 2022.03.08
 *  @version 1.0
 *  @see
 *  
 */


/**
 * @author 82105
 *
 */
public class UserVO implements Serializable{ 
	
	private static final long serialVersionUID = -9219604963667233010L;
	  
	private	String	searchUserId;
	
	private String grPCode;
	private String grMCode;
	private String grMName;
	private String mbCode;
	private String userId;
	private String mbPw;
	private String mbName;
	private String mbRankCode;
	private String mbRankName;
	private String mbTel;
	private String mbHp;
	private String mbEmail;
	private String mbState;
	
    private int coPsPk;
    private String coDiv;
    private String coCode;
    private String coCodeName;
    private String coOrderby;
    private String coUpdatetime;
    private String selectedTwStatus;
    
    private int twPk;
    private String twStatus;
   

	public String getTwStatus() {
		return twStatus;
	}

	public void setTwStatus(String twStatus) {
		this.twStatus = twStatus;
	}

	public int getTwPk() {
		return twPk;
	}

	public void setTwPk(int twPk) {
		this.twPk = twPk;
	}

	public String getSelectedTwStatus() {
		return selectedTwStatus;
	}

	public void setSelectedTwStatus(String selectedTwStatus) {
		this.selectedTwStatus = selectedTwStatus;
	}

	public int getCoPsPk() {
		return coPsPk;
	}

	public void setCoPsPk(int coPsPk) {
		this.coPsPk = coPsPk;
	}

	public String getCoDiv() {
		return coDiv;
	}

	public void setCoDiv(String coDiv) {
		this.coDiv = coDiv;
	}

	public String getCoCode() {
		return coCode;
	}

	public void setCoCode(String coCode) {
		this.coCode = coCode;
	}

	public String getCoCodeName() {
		return coCodeName;
	}

	public void setCoCodeName(String coCodeName) {
		this.coCodeName = coCodeName;
	}

	public String getCoOrderby() {
		return coOrderby;
	}

	public void setCoOrderby(String coOrderby) {
		this.coOrderby = coOrderby;
	}

	public String getCoUpdatetime() {
		return coUpdatetime;
	}

	public void setCoUpdatetime(String coUpdatetime) {
		this.coUpdatetime = coUpdatetime;
	}

	public String getGrPCode() {
		return grPCode;
	}

	public void setGrPCode(String grPCode) {
		this.grPCode = grPCode;
	}

	public String getGrMCode() {
		return grMCode;
	}

	public void setGrMCode(String grMCode) {
		this.grMCode = grMCode;
	}

	public String getGrMName() {
		return grMName;
	}

	public void setGrMName(String grMName) {
		this.grMName = grMName;
	}

	public String getMbCode() {
		return mbCode;
	}

	public void setMbCode(String mbCode) {
		this.mbCode = mbCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMbPw() {
		return mbPw;
	}

	public void setMbPw(String mbPw) {
		this.mbPw = mbPw;
	}

	public String getMbName() {
		return mbName;
	}

	public void setMbName(String mbName) {
		this.mbName = mbName;
	}

	public String getMbRankCode() {
		return mbRankCode;
	}

	public void setMbRankCode(String mbRankCode) {
		this.mbRankCode = mbRankCode;
	}

	public String getMbRankName() {
		return mbRankName;
	}

	public void setMbRankName(String mbRankName) {
		this.mbRankName = mbRankName;
	}

	public String getMbTel() {
		return mbTel;
	}

	public void setMbTel(String mbTel) {
		this.mbTel = mbTel;
	}

	public String getMbHp() {
		return mbHp;
	}

	public void setMbHp(String mbHp) {
		this.mbHp = mbHp;
	}

	public String getMbEmail() {
		return mbEmail;
	}

	public void setMbEmail(String mbEmail) {
		this.mbEmail = mbEmail;
	}

	public String getMbState() {
		return mbState;
	}

	public void setMbState(String mbState) {
		this.mbState = mbState;
	}

	public String getSearchUserId() {
		return searchUserId;
	}

	public void setSearchUserId(String searchUserId) {
		this.searchUserId = searchUserId;
	}
      
}
