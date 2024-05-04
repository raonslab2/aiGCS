package egovframework.or.kr.EMAU00H;

import java.io.File;
import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

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

public class EMAU00H1VO implements Serializable{
	
	private static final long serialVersionUID = -8274004534207618049L;
	
	private int FL_PK;
	
	
	public int getFL_PK() {
		return FL_PK;
	}
	public void setFL_PK(int fL_PK) {
		FL_PK = fL_PK;
	}
	private String flName;
	private String flPath;
	public String getFlName() {
		return flName;
	}
	public void setFlName(String flName) {
		this.flName = flName;
	}
	public String getFlPath() {
		return flPath;
	}
	public void setFlPath(String flPath) {
		this.flPath = flPath;
	}
	public String getFlWriteTime() {
		return flWriteTime;
	}
	public void setFlWriteTime(String flWriteTime) {
		this.flWriteTime = flWriteTime;
	}
	private String flWriteTime;
	private String coPk;
	private String flPk;
	private String tlCommentMbCode;
	private String tlCommentText;
	private String tlCommentDate;
	private String grpCode;
	private String uploadFileName;
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	private String saveFileName; 
	public String getGrpCode() {
		return grpCode;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public void setGrpCode(String grpCode) {
		this.grpCode = grpCode;
	}
	public String getCoPk() {
		return coPk;
	}
	public void setCoPk(String coPk) {
		this.coPk = coPk;
	}
	public String getFlPk() {
		return flPk;
	}
	public void setFlPk(String flPk) {
		this.flPk = flPk;
	}
	public String getTlCommentMbCode() {
		return tlCommentMbCode;
	}
	public void setTlCommentMbCode(String tlCommentMbCode) {
		this.tlCommentMbCode = tlCommentMbCode;
	}
	public String getTlCommentText() {
		return tlCommentText;
	}
	public void setTlCommentText(String tlCommentText) {
		this.tlCommentText = tlCommentText;
	}
	public String getTlCommentDate() {
		return tlCommentDate;
	}
	public void setTlCommentDate(String tlCommentDate) {
		this.tlCommentDate = tlCommentDate;
	}
	private String lastInsertId;
	public String getLastInsertId() {
		return lastInsertId;
	}
	public void setLastInsertId(String lastInsertId) {
		this.lastInsertId = lastInsertId;
	}
	// 전담당자 카운트
	private int cnt;
	private String tlWorkMbName;
	private String tlWorkGrmName;
	// 제목
	private String tlTitle;
	// 내용
	private String tlTxt;
	// 요청자 코드
	private String mbCode;
	// 요청자
	private String mbName;
	// 요청기관
	private String grmCode;
	private String grmName;
	private String tlCommentMbName;
	public String getTlCommentMbName() {
		return tlCommentMbName;
	}
	public void setTlCommentMbName(String tlCommentMbName) {
		this.tlCommentMbName = tlCommentMbName;
	}
	// 완료확인
	private String tlConfirm;
	public String getGrmName() {
		return grmName;
	}
	public void setGrmName(String grmName) {
		this.grmName = grmName;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	// 필요일정
	private String tlWorkDay;
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	// 담당자
	private String tlWorkMbCode;
	// 담당기관
	private String tlWorkGrmCode;
	// 요청일시
	private String tlWriteTime;
	// 변경 전 담당자 사번
	private String tlWorkOldMbCode;
	// 변경 전 담당자 사원명
	private String tlWorkOldMbName;
	private String tlCommentgrmName;
	public String getTlCommentgrmName() {
		return tlCommentgrmName;
	}
	
	public MultipartFile getFile1() {
		return file1;
	}
	
	@Override
	public String toString() {
		return "EMAU00H1VO [FL_PK=" + FL_PK + ", flName=" + flName + ", flPath=" + flPath + ", flWriteTime="
				+ flWriteTime + ", coPk=" + coPk + ", flPk=" + flPk + ", tlCommentMbCode=" + tlCommentMbCode
				+ ", tlCommentText=" + tlCommentText + ", tlCommentDate=" + tlCommentDate + ", grpCode=" + grpCode
				+ ", uploadFileName=" + uploadFileName + ", saveFileName=" + saveFileName + ", lastInsertId="
				+ lastInsertId + ", cnt=" + cnt + ", tlWorkMbName=" + tlWorkMbName + ", tlWorkGrmName=" + tlWorkGrmName
				+ ", tlTitle=" + tlTitle + ", tlTxt=" + tlTxt + ", mbCode=" + mbCode + ", mbName=" + mbName
				+ ", grmCode=" + grmCode + ", grmName=" + grmName + ", tlCommentMbName=" + tlCommentMbName
				+ ", tlConfirm=" + tlConfirm + ", tlWorkDay=" + tlWorkDay + ", tlWorkMbCode=" + tlWorkMbCode
				+ ", tlWorkGrmCode=" + tlWorkGrmCode + ", tlWriteTime=" + tlWriteTime + ", tlWorkOldMbCode="
				+ tlWorkOldMbCode + ", tlWorkOldMbName=" + tlWorkOldMbName + ", tlCommentgrmName=" + tlCommentgrmName
				+ ", file1=" + file1 + ", tlWorkOldGrmCode=" + tlWorkOldGrmCode + ", tlWorkOldGrmName="
				+ tlWorkOldGrmName + ", tlEndDay=" + tlEndDay + ", tlPk=" + tlPk + "]";
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	private MultipartFile file1;
	
	public void setTlCommentgrmName(String tlCommentgrmName) {
		this.tlCommentgrmName = tlCommentgrmName;
	}
	public String getTlWorkOldMbCode() {
		return tlWorkOldMbCode;
	}
	public void setTlWorkOldMbCode(String tlWorkOldMbCode) {
		this.tlWorkOldMbCode = tlWorkOldMbCode;
	}
	public String getTlWorkOldMbName() {
		return tlWorkOldMbName;
	}
	public void setTlWorkOldMbName(String tlWorkOldMbName) {
		this.tlWorkOldMbName = tlWorkOldMbName;
	}
	public String getTlWorkOldGrmCode() {
		return tlWorkOldGrmCode;
	}
	public void setTlWorkOldGrmCode(String tlWorkOldGrmCode) {
		this.tlWorkOldGrmCode = tlWorkOldGrmCode;
	}
	public String getTlWorkOldGrmName() {
		return tlWorkOldGrmName;
	}
	public void setTlWorkOldGrmName(String tlWorkOldGrmName) {
		this.tlWorkOldGrmName = tlWorkOldGrmName;
	}
	// 변경 전 담당자 부서
	private String tlWorkOldGrmCode;
	// 변경 전 담당자 부서명
	private String tlWorkOldGrmName;
	// 완료일
	private String tlEndDay;
	// 자동증가
	private String tlPk;

	public String getTlPk() {
		return tlPk;
	}
	public void setTlPk(String tlPk) {
		this.tlPk = tlPk;
	}
	public String getTlTitle() {
		return tlTitle;
	}
	public void setTlTitle(String tlTitle) {
		this.tlTitle = tlTitle;
	}
	public String getTlTxt() {
		return tlTxt;
	}
	public void setTlTxt(String tlTxt) {
		this.tlTxt = tlTxt;
	}
	public String getMbCode() {
		return mbCode;
	}
	public void setMbCode(String mbCode) {
		this.mbCode = mbCode;
	}
	public String getGrmCode() {
		return grmCode;
	}
	public void setGrmCode(String grmCode) {
		this.grmCode = grmCode;
	}
	public String getTlConfirm() {
		return tlConfirm;
	}
	public void setTlConfirm(String tlConfirm) {
		this.tlConfirm = tlConfirm;
	}
	public String getTlWorkDay() {
		return tlWorkDay;
	}
	public void setTlWorkDay(String tlWorkDay) {
		this.tlWorkDay = tlWorkDay;
	}
	public String getTlWorkMbCode() {
		return tlWorkMbCode;
	}
	public void setTlWorkMbCode(String tlWorkMbCode) {
		this.tlWorkMbCode = tlWorkMbCode;
	}
	public String getTlWorkGrmCode() {
		return tlWorkGrmCode;
	}
	public void setTlWorkGrmCode(String tlWorkGrmCode) {
		this.tlWorkGrmCode = tlWorkGrmCode;
	}
	public String getTlWriteTime() {
		return tlWriteTime;
	}
	public String getTlWorkMbName() {
		return tlWorkMbName;
	}
	public void setTlWorkMbName(String tlWorkMbName) {
		this.tlWorkMbName = tlWorkMbName;
	}
	public String getTlWorkGrmName() {
		return tlWorkGrmName;
	}
	public void setTlWorkGrmName(String tlWorkGrmName) {
		this.tlWorkGrmName = tlWorkGrmName;
	}
	public void setTlWriteTime(String tlWriteTime) {
		this.tlWriteTime = tlWriteTime;
	}
	
	public String getTlEndDay() {
		return tlEndDay;
	}
	public void setTlEndDay(String tlEndDay) {
		this.tlEndDay = tlEndDay;
	}
	
}
