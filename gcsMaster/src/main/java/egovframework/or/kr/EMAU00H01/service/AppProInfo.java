package egovframework.or.kr.EMAU00H01.service;

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
public class AppProInfo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	
 
	
	private String	coPk = "";
	private String	tlPk = "";
	private String	buAgnId = "";
	private String	buOrgName = "";
	private String	buCate = "";
	private String	buNum = "";
	private String	buNotice = "";
	private String	buPjName = "";
	private String	buPjDeNotice = "";
	private String	buPjService = "";
	private String	buStepOneSt = "";
	private String	buStepOneEd = "";
	private String	buStepTwoSt = "";
	private String	buStepTwoEd = "";
	private String	buStepThrSt = "";
	private String	buStepThrEd = "";
	private String	buDevAllSt = "";
	private String	buDevAllEd = "";
	private String	buObjSumEd = "";
	private String	buStepOneSum = "";
	private String	buStepTwoSum = "";
	private String	buStepThrSum = "";
	private String	buKeywordKor = "";
	private String	buKeywordKor2 = "";
	private String	buKeywordKor3 = "";
	private String	buKeywordKor4 = "";
	private String	buKeywordKor5 = "";
	private String	buKeywordEng = "";
	private String	buKeywordEng2 = "";
	private String	buKeywordEng3 = "";
	private String	buKeywordEng4 = "";
	private String	buKeywordEng5 = "";
	private String	buTecStaGro = "";
	private String	buTecStaGro2 = "";
	private String	buTecStaGro3 = "";
	private String	buSecGrade = "";
	private String	bu6tGro = "";
	private String	bu6tGro2 = "";
	private String	bu6tGro3 = "";
	private String	buNatSciTecGro = "";
	private String	buNatSciTecGro2 = "";
	private String	buNatSciTecGro3 = "";
	private String	buNatEmpTecGro = "";
	private String	buNatEmpTecGro2 = "";
	private String	buNatEmpTecGro3 = "";
	private String	buTecMapStrGro = "";
	private String	buTecMapStrGro2 = "";
	private String	buTecMapStrGro3 = "";
	private String	buKorStaIndGro = "";
	private String	buKorStaIndGro2 = "";
	private String	buKorStaIndGro3 = "";
	private String	buKorStaIndGro4 = "";
	private String	buKorStaIndGro5 = "";
	private String	buApp = "";
	private String	bu10MTech = "";
	private int FL_PK;
	private String flName;
	private String flPath;
	private String flWriteTime;
	private String uploadFileName;
	private String saveFileName; 
	private String flPk;
	
	public String getFlPk() {
		return flPk;
	}
	public void setFlPk(String flPk) {
		this.flPk = flPk;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public String getSaveFileName() {
		return saveFileName;
	}
	
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
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
	
	
	public int getFL_PK() {
		return FL_PK;
	}
	public void setFL_PK(int fL_PK) {
		FL_PK = fL_PK;
	}
	
	
	public String getTlPk() {
		return tlPk;
	}
	public void setTlPk(String tlPk) {
		this.tlPk = tlPk;
	}
	
	public String getBuAgnId() {
		return buAgnId;
	}
	public void setBuAgnId(String buAgnId) {
		this.buAgnId = buAgnId;
	}
	public String getBuOrgName() {
		return buOrgName;
	}
	public void setBuOrgName(String buOrgName) {
		this.buOrgName = buOrgName;
	}
	public String getCoPk() {
		return coPk;
	}
	public void setCoPk(String coPk) {
		this.coPk = coPk;
	}
	public String getBuTecStaGro2() {
		return buTecStaGro2;
	}
	public void setBuTecStaGro2(String buTecStaGro2) {
		this.buTecStaGro2 = buTecStaGro2;
	}
	public String getBuTecStaGro3() {
		return buTecStaGro3;
	}
	public void setBuTecStaGro3(String buTecStaGro3) {
		this.buTecStaGro3 = buTecStaGro3;
	}
	public String getBuKorStaIndGro4() {
		return buKorStaIndGro4;
	}
	public void setBuKorStaIndGro4(String buKorStaIndGro4) {
		this.buKorStaIndGro4 = buKorStaIndGro4;
	}
	public String getBuKorStaIndGro5() {
		return buKorStaIndGro5;
	}
	public void setBuKorStaIndGro5(String buKorStaIndGro5) {
		this.buKorStaIndGro5 = buKorStaIndGro5;
	}
	public String getBuTecMapStrGro2() {
		return buTecMapStrGro2;
	}
	public void setBuTecMapStrGro2(String buTecMapStrGro2) {
		this.buTecMapStrGro2 = buTecMapStrGro2;
	}
	public String getBuTecMapStrGro3() {
		return buTecMapStrGro3;
	}
	public void setBuTecMapStrGro3(String buTecMapStrGro3) {
		this.buTecMapStrGro3 = buTecMapStrGro3;
	}
	public String getBuKorStaIndGro2() {
		return buKorStaIndGro2;
	}
	public void setBuKorStaIndGro2(String buKorStaIndGro2) {
		this.buKorStaIndGro2 = buKorStaIndGro2;
	}
	public String getBuKorStaIndGro3() {
		return buKorStaIndGro3;
	}
	public void setBuKorStaIndGro3(String buKorStaIndGro3) {
		this.buKorStaIndGro3 = buKorStaIndGro3;
	}
	public String getBuNatSciTecGro2() {
		return buNatSciTecGro2;
	}
	public void setBuNatSciTecGro2(String buNatSciTecGro2) {
		this.buNatSciTecGro2 = buNatSciTecGro2;
	}
	public String getBuNatSciTecGro3() {
		return buNatSciTecGro3;
	}
	public void setBuNatSciTecGro3(String buNatSciTecGro3) {
		this.buNatSciTecGro3 = buNatSciTecGro3;
	}
	public String getBu10MTech() {
		return bu10MTech;
	}
	public void setBu10MTech(String bu10mTech) {
		bu10MTech = bu10mTech;
	}
	public String getBu6tGro2() {
		return bu6tGro2;
	}
	public void setBu6tGro2(String bu6tGro2) {
		this.bu6tGro2 = bu6tGro2;
	}
	public String getBu6tGro3() {
		return bu6tGro3;
	}
	public void setBu6tGro3(String bu6tGro3) {
		this.bu6tGro3 = bu6tGro3;
	}
	public String getBuApp() {
		return buApp;
	}
	public void setBuApp(String buApp) {
		this.buApp = buApp;
	}
	public String getBuNatEmpTecGro2() {
		return buNatEmpTecGro2;
	}
	public void setBuNatEmpTecGro2(String buNatEmpTecGro2) {
		this.buNatEmpTecGro2 = buNatEmpTecGro2;
	}
	public String getBuNatEmpTecGro3() {
		return buNatEmpTecGro3;
	}
	public void setBuNatEmpTecGro3(String buNatEmpTecGro3) {
		this.buNatEmpTecGro3 = buNatEmpTecGro3;
	}
	public String getBuKeywordEng2() {
		return buKeywordEng2;
	}
	public void setBuKeywordEng2(String buKeywordEng2) {
		this.buKeywordEng2 = buKeywordEng2;
	}
	public String getBuKeywordEng3() {
		return buKeywordEng3;
	}
	public void setBuKeywordEng3(String buKeywordEng3) {
		this.buKeywordEng3 = buKeywordEng3;
	}
	public String getBuKeywordEng4() {
		return buKeywordEng4;
	}
	public void setBuKeywordEng4(String buKeywordEng4) {
		this.buKeywordEng4 = buKeywordEng4;
	}
	public String getBuKeywordEng5() {
		return buKeywordEng5;
	}
	public void setBuKeywordEng5(String buKeywordEng5) {
		this.buKeywordEng5 = buKeywordEng5;
	}
	public String getBuKeywordKor2() {
		return buKeywordKor2;
	}
	public void setBuKeywordKor2(String buKeywordKor2) {
		this.buKeywordKor2 = buKeywordKor2;
	}
	public String getBuKeywordKor3() {
		return buKeywordKor3;
	}
	public void setBuKeywordKor3(String buKeywordKor3) {
		this.buKeywordKor3 = buKeywordKor3;
	}
	public String getBuKeywordKor4() {
		return buKeywordKor4;
	}
	public void setBuKeywordKor4(String buKeywordKor4) {
		this.buKeywordKor4 = buKeywordKor4;
	}
	public String getBuKeywordKor5() {
		return buKeywordKor5;
	}
	public void setBuKeywordKor5(String buKeywordKor5) {
		this.buKeywordKor5 = buKeywordKor5;
	}
	public String getBuSecGrade() {
		return buSecGrade;
	}
	public void setBuSecGrade(String buSecGrade) {
		this.buSecGrade = buSecGrade;
	}
	public String getBuCate() {
		return buCate;
	}
	public void setBuCate(String buCate) {
		this.buCate = buCate;
	}
	public String getBuNum() {
		return buNum;
	}
	public void setBuNum(String buNum) {
		this.buNum = buNum;
	}
	public String getBuNotice() {
		return buNotice;
	}
	public void setBuNotice(String buNotice) {
		this.buNotice = buNotice;
	}
	public String getBuPjName() {
		return buPjName;
	}
	public void setBuPjName(String buPjName) {
		this.buPjName = buPjName;
	}
	public String getBuPjDeNotice() {
		return buPjDeNotice;
	}
	public void setBuPjDeNotice(String buPjDeNotice) {
		this.buPjDeNotice = buPjDeNotice;
	}
	public String getBuPjService() {
		return buPjService;
	}
	public void setBuPjService(String buPjService) {
		this.buPjService = buPjService;
	}
	public String getBuStepOneSt() {
		return buStepOneSt;
	}
	public void setBuStepOneSt(String buStepOneSt) {
		this.buStepOneSt = buStepOneSt;
	}
	public String getBuStepOneEd() {
		return buStepOneEd;
	}
	public void setBuStepOneEd(String buStepOneEd) {
		this.buStepOneEd = buStepOneEd;
	}
	public String getBuStepTwoSt() {
		return buStepTwoSt;
	}
	public void setBuStepTwoSt(String buStepTwoSt) {
		this.buStepTwoSt = buStepTwoSt;
	}
	public String getBuStepTwoEd() {
		return buStepTwoEd;
	}
	public void setBuStepTwoEd(String buStepTwoEd) {
		this.buStepTwoEd = buStepTwoEd;
	}
	public String getBuStepThrSt() {
		return buStepThrSt;
	}
	public void setBuStepThrSt(String buStepThrSt) {
		this.buStepThrSt = buStepThrSt;
	}
	public String getBuStepThrEd() {
		return buStepThrEd;
	}
	public void setBuStepThrEd(String buStepThrEd) {
		this.buStepThrEd = buStepThrEd;
	}
	public String getBuDevAllSt() {
		return buDevAllSt;
	}
	public void setBuDevAllSt(String buDevAllSt) {
		this.buDevAllSt = buDevAllSt;
	}
	public String getBuDevAllEd() {
		return buDevAllEd;
	}
	public void setBuDevAllEd(String buDevAllEd) {
		this.buDevAllEd = buDevAllEd;
	}
	public String getBuObjSumEd() {
		return buObjSumEd;
	}
	public void setBuObjSumEd(String buObjSumEd) {
		this.buObjSumEd = buObjSumEd;
	}
	public String getBuStepOneSum() {
		return buStepOneSum;
	}
	public void setBuStepOneSum(String buStepOneSum) {
		this.buStepOneSum = buStepOneSum;
	}
	public String getBuStepTwoSum() {
		return buStepTwoSum;
	}
	public void setBuStepTwoSum(String buStepTwoSum) {
		this.buStepTwoSum = buStepTwoSum;
	}
	public String getBuStepThrSum() {
		return buStepThrSum;
	}
	public void setBuStepThrSum(String buStepThrSum) {
		this.buStepThrSum = buStepThrSum;
	}
	public String getBuKeywordKor() {
		return buKeywordKor;
	}
	public void setBuKeywordKor(String buKeywordKor) {
		this.buKeywordKor = buKeywordKor;
	}
	public String getBuKeywordEng() {
		return buKeywordEng;
	}
	public void setBuKeywordEng(String buKeywordEng) {
		this.buKeywordEng = buKeywordEng;
	}
	public String getBuTecStaGro() {
		return buTecStaGro;
	}
	public void setBuTecStaGro(String buTecStaGro) {
		this.buTecStaGro = buTecStaGro;
	}
	public String getBu6tGro() {
		return bu6tGro;
	}
	public void setBu6tGro(String bu6tGro) {
		this.bu6tGro = bu6tGro;
	}
	public String getBuNatSciTecGro() {
		return buNatSciTecGro;
	}
	public void setBuNatSciTecGro(String buNatSciTecGro) {
		this.buNatSciTecGro = buNatSciTecGro;
	}
	public String getBuNatEmpTecGro() {
		return buNatEmpTecGro;
	}
	public void setBuNatEmpTecGro(String buNatEmpTecGro) {
		this.buNatEmpTecGro = buNatEmpTecGro;
	}
	public String getBuTecMapStrGro() {
		return buTecMapStrGro;
	}
	public void setBuTecMapStrGro(String buTecMapStrGro) {
		this.buTecMapStrGro = buTecMapStrGro;
	}
	public String getBuKorStaIndGro() {
		return buKorStaIndGro;
	}
	public void setBuKorStaIndGro(String buKorStaIndGro) {
		this.buKorStaIndGro = buKorStaIndGro;
	}
	

	
	
}
