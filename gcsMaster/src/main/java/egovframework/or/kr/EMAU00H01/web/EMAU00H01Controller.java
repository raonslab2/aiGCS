package egovframework.or.kr.EMAU00H01.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00H.EMAU00H1VO;
import egovframework.or.kr.EMAU00H01.service.AppProInfo;
import egovframework.or.kr.EMAU00H01.service.EMAU00H01Service;
import egovframework.or.kr.EMAU00H01.service.InsInfoVO;
import egovframework.or.kr.EMAU00H01.service.PartManVO;
import egovframework.or.kr.EMAU00H01.service.PartOrgVO;
import egovframework.or.kr.EMAU00H01.service.RDCommercialVO;
import egovframework.or.kr.EMAU00J01.service.TechVO;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.or.kr.com.utill.EmpiUserDetailsHelper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * restFull(Sample 소스)
 * 
 * @author 실행환경 개발팀 JJY
 * @since 2011.08.31
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.08.31  JJY            최초 생성
 *
 *      </pre>
 */
@Controller
@SessionAttributes(types = ComDefaultVO.class)
public class EMAU00H01Controller {

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00H01Service")
	private EMAU00H01Service eMAU00H01Service;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/**
	 * 지능형평가모델 > 신청과제정보
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/EMAU00H0101.do")
	public String EMAU00H0101(HttpServletRequest request, ModelMap model) throws Exception {

		return "main/EMAU00H01/EMAU00H0101";
	}

	/**
	 * 지능형평가모델 > 참여기관
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/EMAU00H0102.do")
	public String EMAU00H0102(HttpServletRequest request, ModelMap model) throws Exception {

		return "main/EMAU00H01/EMAU00H0102";
	}

	/**
	 * 지능형평가모델 > 참여기관 > 기관 ID 또는 기관명 검색
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/EMAU00H0103.do")
	public String EMAU00H0103(HttpServletRequest request, ModelMap model) throws Exception {

		return "main/EMAU00H01/EMAU00H0103";
	}

	/**
	 * 지능형평가모델 > 참여인력
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/EMAU00H0104.do")
	public String EMAU00H0104(HttpServletRequest request, ModelMap model) throws Exception {

		return "main/EMAU00H01/EMAU00H0104";
	}

	/**
	 * 지능형평가모델 > 연구개발 및 사업화 계획
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/EMAU00H0105.do")
	public String EMAU00H0105(HttpServletRequest request, ModelMap model) throws Exception {

		return "main/EMAU00H01/EMAU00H0105";
	}

	/**
	 * 지능형평가모델 > 연구개발 및 사업화 계획 > 조회
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/EMAU00H0106.do")
	public String EMAU00H0106(HttpServletRequest request, ModelMap model) throws Exception {

		return "main/EMAU00H01/EMAU00H0106";
	}

	/**
	 * 지능형평가모델 > 기관정보 관리
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/EMAU00H0107.do")
	public String EMAU00H0107(HttpServletRequest request, ModelMap model) throws Exception {

		return "main/EMAU00H01/EMAU00H0107";
	}

	/**
	 * 지능형평가모델 > 과제접수 현황
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/EMAU00H0108.do")
	public String EMAU00H0108(HttpServletRequest request, ModelMap model) throws Exception {

		return "main/EMAU00H01/EMAU00H0108";
	}

	/**
	 * 지능형평가모델 > 과제접수 등록 > 신청과제 정보
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo    AppProInfo
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/insertEMAU00H0101.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00H0101(@RequestParam Map<String, Object> param, ModelMap model)
			throws Exception {
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
		}

		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);

		String buCate = (String) map.get("buCate");
		String buNotice = (String) map.get("buNotice");
		String buPjName = (String) map.get("buPjName");
		String buPjDeNotice = (String) map.get("buPjDeNotice");
		String buPjService = (String) map.get("buPjService");
		String buStepOneSt = (String) map.get("buStepOneSt");
		String buStepOneEd = (String) map.get("buStepOneEd");
		String buDevAllSt = (String) map.get("buDevAllSt");
		String buDevAllEd = (String) map.get("buDevAllEd");
		String buSecGrade = (String) map.get("buSecGrade");
		String buStepTwoSt = (String) map.get("buStepTwoSt");
		String buStepTwoEd = (String) map.get("buStepTwoEd");
		String buStepThrSt = (String) map.get("buStepThrSt");
		String buStepThrEd = (String) map.get("buStepThrEd");
		String buObjSumEd = (String) map.get("buObjSumEd");
		String buStepOneSum = (String) map.get("buStepOneSum");
		String buStepTwoSum = (String) map.get("buStepTwoSum");
		String buStepThrSum = (String) map.get("buStepThrSum");
		String buKeywordKor = (String) map.get("buKeywordKor");
		String buKeywordKor2 = (String) map.get("buKeywordKor2");
		String buKeywordKor3 = (String) map.get("buKeywordKor3");
		String buKeywordKor4 = (String) map.get("buKeywordKor4");
		String buKeywordKor5 = (String) map.get("buKeywordKor5");
		String buKeywordEng = (String) map.get("buKeywordEng");
		String buKeywordEng2 = (String) map.get("buKeywordEng2");
		String buKeywordEng3 = (String) map.get("buKeywordEng3");
		String buKeywordEng4 = (String) map.get("buKeywordEng4");
		String buKeywordEng5 = (String) map.get("buKeywordEng5");
		String buTecStaGro = (String) map.get("buTecStaGro");
		String buTecStaGro2 = (String) map.get("buTecStaGro2");
		String buTecStaGro3 = (String) map.get("buTecStaGro3");
		String buApp = (String) map.get("buApp");
		String bu6tGro = (String) map.get("bu6tGro");
		String bu6tGro2 = (String) map.get("bu6tGro2");
		String bu6tGro3 = (String) map.get("bu6tGro3");
		String bu10MTech = (String) map.get("bu10MTech");
		String buNatSciTecGro = (String) map.get("buNatSciTecGro");
		String buNatSciTecGro2 = (String) map.get("buNatSciTecGro2");
		String buNatSciTecGro3 = (String) map.get("buNatSciTecGro3");
		String buNatEmpTecGro = (String) map.get("buNatEmpTecGro");
		String buNatEmpTecGro2 = (String) map.get("buNatEmpTecGro2");
		String buNatEmpTecGro3 = (String) map.get("buNatEmpTecGro3");
		String buTecMapStrGro = (String) map.get("buTecMapStrGro");
		String buTecMapStrGro2 = (String) map.get("buTecMapStrGro2");
		String buTecMapStrGro3 = (String) map.get("buTecMapStrGro3");
		String buKorStaIndGro = (String) map.get("buKorStaIndGro");
		String buKorStaIndGro2 = (String) map.get("buKorStaIndGro2");
		String buKorStaIndGro3 = (String) map.get("buKorStaIndGro3");
		String buKorStaIndGro4 = (String) map.get("buKorStaIndGro4");
		String buKorStaIndGro5 = (String) map.get("buKorStaIndGro5");

		HashMap<String, Object> paramMap = new HashMap<String, Object>();

		if (buCate != null && !buCate.equals("")) {
			paramMap.put("buCate", buCate);
		}

		if (buNotice != null && !buNotice.equals("")) {
			paramMap.put("buNotice", buNotice);
		}

		if (buPjName != null && !buPjName.equals("")) {
			paramMap.put("buPjName", buPjName);
		}

		if (buPjDeNotice != null && !buPjDeNotice.equals("")) {
			paramMap.put("buPjDeNotice", buPjDeNotice);
		}

		if (buPjService != null && !buPjService.equals("")) {
			paramMap.put("buPjService", buPjService);
		}

		if (buStepOneSt != null && !buStepOneSt.equals("")) {
			paramMap.put("buStepOneSt", buStepOneSt);
		}

		if (buStepOneEd != null && !buStepOneEd.equals("")) {
			paramMap.put("buStepOneEd", buStepOneEd);
		}

		if (buDevAllSt != null && !buDevAllSt.equals("")) {
			paramMap.put("buDevAllSt", buDevAllSt);
		}

		if (buDevAllEd != null && !buDevAllEd.equals("")) {
			paramMap.put("buDevAllEd", buDevAllEd);
		}

		if (buSecGrade != null && !buSecGrade.equals("")) {
			paramMap.put("buSecGrade", buSecGrade);
		}

		if (buStepTwoSt != null && !buStepTwoSt.equals("")) {
			paramMap.put("buStepTwoSt", buStepTwoSt);
		}

		if (buStepTwoEd != null && !buStepTwoEd.equals("")) {
			paramMap.put("buStepTwoEd", buStepTwoEd);
		}

		if (buStepThrSt != null && !buStepThrSt.equals("")) {
			paramMap.put("buStepThrSt", buStepThrSt);
		}

		if (buStepThrEd != null && !buStepThrEd.equals("")) {
			paramMap.put("buStepThrEd", buStepThrEd);
		}

		if (buObjSumEd != null && !buObjSumEd.equals("")) {
			paramMap.put("buObjSumEd", buObjSumEd);
		}

		if (buStepOneSum != null && !buStepOneSum.equals("")) {
			paramMap.put("buStepOneSum", buStepOneSum);
		}

		if (buStepTwoSum != null && !buStepTwoSum.equals("")) {
			paramMap.put("buStepTwoSum", buStepTwoSum);
		}

		if (buStepThrSum != null && !buStepThrSum.equals("")) {
			paramMap.put("buStepThrSum", buStepThrSum);
		}

		if (buKeywordKor != null && !buKeywordKor.equals("")) {
			paramMap.put("buKeywordKor", buKeywordKor);
		}

		if (buKeywordKor2 != null && !buKeywordKor2.equals("")) {
			paramMap.put("buKeywordKor2", buKeywordKor2);
		}

		if (buKeywordKor3 != null && !buKeywordKor3.equals("")) {
			paramMap.put("buKeywordKor3", buKeywordKor3);
		}

		if (buKeywordKor4 != null && !buKeywordKor4.equals("")) {
			paramMap.put("buKeywordKor4", buKeywordKor4);
		}

		if (buKeywordKor5 != null && !buKeywordKor5.equals("")) {
			paramMap.put("buKeywordKor5", buKeywordKor5);
		}

		if (buKeywordEng != null && !buKeywordEng.equals("")) {
			paramMap.put("buKeywordEng", buKeywordEng);
		}

		if (buKeywordEng2 != null && !buKeywordEng2.equals("")) {
			paramMap.put("buKeywordEng2", buKeywordEng2);
		}

		if (buKeywordEng3 != null && !buKeywordEng3.equals("")) {
			paramMap.put("buKeywordEng3", buKeywordEng3);
		}

		if (buKeywordEng4 != null && !buKeywordEng4.equals("")) {
			paramMap.put("buKeywordEng4", buKeywordEng4);
		}

		if (buKeywordEng5 != null && !buKeywordEng5.equals("")) {
			paramMap.put("buKeywordEng5", buKeywordEng5);
		}

		if (buTecStaGro != null && !buTecStaGro.equals("")) {
			paramMap.put("buTecStaGro", buTecStaGro);
		}

		if (buTecStaGro2 != null && !buTecStaGro2.equals("")) {
			paramMap.put("buTecStaGro2", buTecStaGro2);
		}

		if (buTecStaGro3 != null && !buTecStaGro3.equals("")) {
			paramMap.put("buTecStaGro3", buTecStaGro3);
		}

		if (buApp != null && !buApp.equals("")) {
			paramMap.put("buApp", buApp);
		}

		if (bu6tGro != null && !bu6tGro.equals("")) {
			paramMap.put("bu6tGro", bu6tGro);
		}

		if (bu6tGro2 != null && !bu6tGro2.equals("")) {
			paramMap.put("bu6tGro2", bu6tGro2);
		}

		if (bu6tGro3 != null && !bu6tGro3.equals("")) {
			paramMap.put("bu6tGro3", bu6tGro3);
		}

		if (bu10MTech != null && !bu10MTech.equals("")) {
			paramMap.put("bu10MTech", bu10MTech);
		}

		if (buNatSciTecGro != null && !buNatSciTecGro.equals("")) {
			paramMap.put("buNatSciTecGro", buNatSciTecGro);
		}

		if (buNatSciTecGro2 != null && !buNatSciTecGro2.equals("")) {
			paramMap.put("buNatSciTecGro2", buNatSciTecGro2);
		}

		if (buNatSciTecGro3 != null && !buNatSciTecGro3.equals("")) {
			paramMap.put("buNatSciTecGro3", buNatSciTecGro3);
		}

		if (buNatEmpTecGro != null && !buNatEmpTecGro.equals("")) {
			paramMap.put("buNatEmpTecGro", buNatEmpTecGro);
		}

		if (buNatEmpTecGro2 != null && !buNatEmpTecGro2.equals("")) {
			paramMap.put("buNatEmpTecGro2", buNatEmpTecGro2);
		}

		if (buNatEmpTecGro3 != null && !buNatEmpTecGro3.equals("")) {
			paramMap.put("buNatEmpTecGro3", buNatEmpTecGro3);
		}

		if (buTecMapStrGro != null && !buTecMapStrGro.equals("")) {
			paramMap.put("buTecMapStrGro", buTecMapStrGro);
		}

		if (buTecMapStrGro2 != null && !buTecMapStrGro2.equals("")) {
			paramMap.put("buTecMapStrGro2", buTecMapStrGro2);
		}

		if (buTecMapStrGro3 != null && !buTecMapStrGro3.equals("")) {
			paramMap.put("buTecMapStrGro3", buTecMapStrGro3);
		}

		if (buKorStaIndGro != null && !buKorStaIndGro.equals("")) {
			paramMap.put("buKorStaIndGro", buKorStaIndGro);
		}

		if (buKorStaIndGro2 != null && !buKorStaIndGro2.equals("")) {
			paramMap.put("buKorStaIndGro2", buKorStaIndGro2);
		}

		if (buKorStaIndGro3 != null && !buKorStaIndGro3.equals("")) {
			paramMap.put("buKorStaIndGro3", buKorStaIndGro3);
		}

		if (buKorStaIndGro4 != null && !buKorStaIndGro4.equals("")) {
			paramMap.put("buKorStaIndGro4", buKorStaIndGro4);
		}

		if (buKorStaIndGro5 != null && !buKorStaIndGro5.equals("")) {
			paramMap.put("buKorStaIndGro5", buKorStaIndGro5);
		}

		try {

			eMAU00H01Service.insertEMAU00H0101(paramMap);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 지능형평가모델 > 과제접수 등록 > 참여기관
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo    PartOrgVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/insertEMAU00H0102.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00H0102(@RequestParam Map<String, Object> param, ModelMap model)
			throws Exception {
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
		}

		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);

		String coPk = (String) map.get("coPk");
		String buOrgName = (String) map.get("buOrgName");
		String buOrgName2 = (String) map.get("buOrgName2");
		String buOrgName3 = (String) map.get("buOrgName3");
		String buOrgName4 = (String) map.get("buOrgName4");
		String buOrgName5 = (String) map.get("buOrgName5");
		String buCorRegNum = (String) map.get("buComRegNum");
		String buCorRegNum2 = (String) map.get("buComRegNum2");
		String buCorRegNum3 = (String) map.get("buComRegNum3");
		String buCorRegNum4 = (String) map.get("buComRegNum4");
		String buCorRegNum5 = (String) map.get("buComRegNum5");
		String buComRegNum = (String) map.get("buComRegNum");
		String buComRegNum2 = (String) map.get("buComRegNum2");
		String buComRegNum3 = (String) map.get("buComRegNum3");
		String buComRegNum4 = (String) map.get("buComRegNum4");
		String buComRegNum5 = (String) map.get("buComRegNum5");
		String buRep = (String) map.get("buRep");
		String buRep2 = (String) map.get("buRep2");
		String buRep3 = (String) map.get("buRep3");
		String buRep4 = (String) map.get("buRep4");
		String buRep5 = (String) map.get("buRep5");
		String buAssType = (String) map.get("buAssType");
		String buAssType2 = (String) map.get("buAssType2");
		String buAssType3 = (String) map.get("buAssType3");
		String buAssType4 = (String) map.get("buAssType4");
		String buBusName = (String) map.get("buBusName");
		String buBusName2 = (String) map.get("buBusName2");
		String buBusName3 = (String) map.get("buBusName3");
		String buBusName4 = (String) map.get("buBusName4");
		String buProTit = (String) map.get("buProTit");
		String buProTit2 = (String) map.get("buProTit2");
		String buProTit3 = (String) map.get("buProTit3");
		String buProTit4 = (String) map.get("buProTit4");
		String buFinGoalCorCon = (String) map.get("buFinGoalCorCon");
		String buFinGoalCorCon2 = (String) map.get("buFinGoalCorCon2");
		String buFinGoalCorCon3 = (String) map.get("buFinGoalCorCon3");
		String buFinGoalCorCon4 = (String) map.get("buFinGoalCorCon4");
		String buParStDat = (String) map.get("buParStDat");
		String buParStDat2 = (String) map.get("buParStDat2");
		String buParStDat3 = (String) map.get("buParStDat3");
		String buParStDat4 = (String) map.get("buParStDat4");
		String buParEdDat = (String) map.get("buParEdDat");
		String buParEdDat2 = (String) map.get("buParEdDat2");
		String buParEdDat3 = (String) map.get("buParEdDat3");
		String buParEdDat4 = (String) map.get("buParEdDat4");
		String buBusExp = (String) map.get("buBusExp");
		String buBusExp2 = (String) map.get("buBusExp2");
		String buBusExp3 = (String) map.get("buBusExp3");
		String buBusExp4 = (String) map.get("buBusExp4");
		String buResRol = (String) map.get("buResRol");
		String buResRol2 = (String) map.get("buResRol2");
		String buResRol3 = (String) map.get("buResRol3");
		String buResRol4 = (String) map.get("buResRol4");
		String buTasSta = (String) map.get("buTasSta");
		String buTasSta2 = (String) map.get("buTasSta2");
		String buTasSta3 = (String) map.get("buTasSta3");
		String buTasSta4 = (String) map.get("buTasSta4");
		String buNum = (String) map.get("buNum");

		HashMap<String, Object> paramMap = new HashMap<String, Object>();

		try {
			for (int i = 1; i <= 5; i++) {
				if (i == 1) {

					paramMap.put("buAgnId", i);

					if (coPk != null && !coPk.equals("")) {
						paramMap.put("coPk", coPk);
					}
					if (buAssType != null && !buAssType.equals("")) {
						paramMap.put("buAssType", buAssType);
					}

					if (buOrgName != null && !buOrgName.equals("")) {
						paramMap.put("buOrgName", buOrgName);
					}

					if (buComRegNum != null && !buComRegNum.equals("")) {
						paramMap.put("buComRegNum", buComRegNum);
					}

					if (buCorRegNum != null && !buCorRegNum.equals("")) {
						paramMap.put("buCorRegNum", buCorRegNum);
					}

					if (buRep != null && !buRep.equals("")) {
						paramMap.put("buRep", buRep);
					}

					if (buBusName != null && !buBusName.equals("")) {
						paramMap.put("buBusName", buBusName);
					}

					if (buProTit != null && !buProTit.equals("")) {
						paramMap.put("buProTit", buProTit);
					}

					if (buFinGoalCorCon != null && !buFinGoalCorCon.equals("")) {
						paramMap.put("buFinGoalCorCon", buFinGoalCorCon);
					}

					if (buParStDat != null && !buParStDat.equals("")) {
						paramMap.put("buParStDat", buParStDat);
					}

					if (buParEdDat != null && !buParEdDat.equals("")) {
						paramMap.put("buParEdDat", buParEdDat);
					}

					if (buBusExp != null && !buBusExp.equals("")) {
						paramMap.put("buBusExp", buBusExp);
					}

					if (buResRol != null && !buResRol.equals("")) {
						paramMap.put("buResRol", buResRol);
					}

					if (buTasSta != null && !buTasSta.equals("")) {
						paramMap.put("buTasSta", buTasSta);
					}

					if (buNum != null && !buNum.equals("")) {
						paramMap.put("buNum", buNum);
					}
					eMAU00H01Service.insertEMAU00H01021(paramMap);
					eMAU00H01Service.insertEMAU00H01022(paramMap);
					eMAU00H01Service.insertEMAU00H01023(paramMap);
				}

				else if (i == 2) {

					paramMap.put("buAgnId", i);

					if (coPk != null && !coPk.equals("")) {
						paramMap.put("coPk", coPk);
					}

					if (buAssType2 != null && !buAssType2.equals("")) {
						paramMap.put("buAssType", buAssType2);
					} else {
						paramMap.put("buAssType", "");
					}

					if (buOrgName2 != null && !buOrgName2.equals("")) {
						paramMap.put("buOrgName", buOrgName2);
					} else {
						paramMap.put("buOrgName", "");
					}

					if (buComRegNum2 != null && !buComRegNum2.equals("")) {
						paramMap.put("buComRegNum", buComRegNum2);
					} else {
						paramMap.put("buComRegNum", "");
					}

					if (buCorRegNum2 != null && !buCorRegNum2.equals("")) {
						paramMap.put("buCorRegNum", buCorRegNum2);
					} else {
						paramMap.put("buCorRegNum", "");
					}

					if (buRep2 != null && !buRep2.equals("")) {
						paramMap.put("buRep", buRep2);
					} else {
						paramMap.put("buRep", "");
					}

					if (buBusName2 != null && !buBusName2.equals("")) {
						paramMap.put("buBusName", buBusName2);
					} else {
						paramMap.put("buBusName", "");
					}


					if (buProTit2 != null && !buProTit2.equals("")) {
						paramMap.put("buProTit", buProTit2);
					} else {
						paramMap.put("buProTit", "");
					}

					if (buFinGoalCorCon2 != null && !buFinGoalCorCon2.equals("")) {
						paramMap.put("buFinGoalCorCon", buFinGoalCorCon2);
					} else {
						paramMap.put("buFinGoalCorCon", "");
					}

					if (buParStDat2 != null && !buParStDat2.equals("")) {
						paramMap.put("buParStDat", buParStDat2);
					} else {
						paramMap.put("buParStDat", "");
					}

					if (buParEdDat2 != null && !buParEdDat2.equals("")) {
						paramMap.put("buParEdDat", buParEdDat2);
					} else {
						paramMap.put("buParEdDat", "");
					}

					if (buBusExp2 != null && !buBusExp2.equals("")) {
						paramMap.put("buBusExp", buBusExp2);
					} else {
						paramMap.put("buBusExp", "");
					}

					if (buResRol2 != null && !buResRol2.equals("")) {
						paramMap.put("buResRol", buResRol2);
					} else {
						paramMap.put("buResRol", "");
					}

					if (buTasSta2 != null && !buTasSta2.equals("")) {
						paramMap.put("buTasSta", buTasSta2);
					} else {
						paramMap.put("buTasSta", "");
					}

					if (buNum != null && !buNum.equals("")) {
						paramMap.put("buNum", buNum);
					}
					eMAU00H01Service.insertEMAU00H01021(paramMap);
					eMAU00H01Service.insertEMAU00H01022(paramMap);
					eMAU00H01Service.insertEMAU00H01023(paramMap);
				}

				else if (i == 3) {

					paramMap.put("buAgnId", i);

					if (coPk != null && !coPk.equals("")) {
						paramMap.put("coPk", coPk);
					}

					if (buAssType3 != null && !buAssType3.equals("")) {
						paramMap.put("buAssType", buAssType3);
					}else {
						paramMap.put("buAssType", "");
					}

					if (buOrgName3 != null && !buOrgName3.equals("")) {
						paramMap.put("buOrgName", buOrgName3);
					} else {
						paramMap.put("buOrgName", "");
					}

					if (buComRegNum3 != null && !buComRegNum3.equals("")) {
						paramMap.put("buComRegNum", buComRegNum3);
					} else {
						paramMap.put("buComRegNum", "");
					}

					if (buCorRegNum3 != null && !buCorRegNum3.equals("")) {
						paramMap.put("buCorRegNum", buCorRegNum3);
					} else {
						paramMap.put("buCorRegNum", "");
					}

					if (buRep3 != null && !buRep3.equals("")) {
						paramMap.put("buRep", buRep3);
					} else {
						paramMap.put("buRep", "");
					}

					if (buBusName3 != null && !buBusName3.equals("")) {
						paramMap.put("buBusName", buBusName3);
					} else {
						paramMap.put("buBusName", "");
					}

					if (buProTit3 != null && !buProTit3.equals("")) {
						paramMap.put("buProTit", buProTit3);
					} else {
						paramMap.put("buProTit", "");
					}

					if (buFinGoalCorCon3 != null && !buFinGoalCorCon3.equals("")) {
						paramMap.put("buFinGoalCorCon", buFinGoalCorCon3);
					} else {
						paramMap.put("buFinGoalCorCon", "");
					}

					if (buParStDat3 != null && !buParStDat3.equals("")) {
						paramMap.put("buParStDat", buParStDat3);
					} else {
						paramMap.put("buParStDat", "");
					}

					if (buParEdDat3 != null && !buParEdDat3.equals("")) {
						paramMap.put("buParEdDat", buParEdDat3);
					} else {
						paramMap.put("buParEdDat", "");
					}

					if (buBusExp3 != null && !buBusExp3.equals("")) {
						paramMap.put("buBusExp", buBusExp3);
					} else {
						paramMap.put("buBusExp", "");
					}

					if (buResRol3 != null && !buResRol3.equals("")) {
						paramMap.put("buResRol", buResRol3);
					} else {
						paramMap.put("buResRol", "");
					}

					if (buTasSta3 != null && !buTasSta3.equals("")) {
						paramMap.put("buTasSta", buTasSta3);
					} else {
						paramMap.put("buTasSta", "");
					}

					if (buNum != null && !buNum.equals("")) {
						paramMap.put("buNum", buNum);
					}
					eMAU00H01Service.insertEMAU00H01021(paramMap);
					eMAU00H01Service.insertEMAU00H01022(paramMap);
					eMAU00H01Service.insertEMAU00H01023(paramMap);
				}

				else if (i == 4) {

					paramMap.put("buAgnId", i);

					if (coPk != null && !coPk.equals("")) {
						paramMap.put("coPk", coPk);
					}

					if (buAssType4 != null && !buAssType4.equals("")) {
						paramMap.put("buAssType", buAssType4);
					} else {
						paramMap.put("buAssType", "");
					}

					if (buOrgName4 != null && !buOrgName4.equals("")) {
						paramMap.put("buOrgName", buOrgName4);
					} else {
						paramMap.put("buOrgName", "");
					}

					if (buComRegNum4 != null && !buComRegNum4.equals("")) {
						paramMap.put("buComRegNum", buComRegNum4);
					} else {
						paramMap.put("buComRegNum", "");
					}

					if (buCorRegNum4 != null && !buCorRegNum4.equals("")) {
						paramMap.put("buCorRegNum", buCorRegNum4);
					} else {
						paramMap.put("buCorRegNum", "");
					}

					if (buRep4 != null && !buRep4.equals("")) {
						paramMap.put("buRep", buRep4);
					} else {
						paramMap.put("buRep", "");
					}

					if (buBusName4 != null && !buBusName4.equals("")) {
						paramMap.put("buBusName", buBusName4);
					} else {
						paramMap.put("buBusName", "");
					}

					if (buProTit4 != null && !buProTit4.equals("")) {
						paramMap.put("buProTit", buProTit4);
					} else {
						paramMap.put("buProTit", "");
					}

					if (buFinGoalCorCon4 != null && !buFinGoalCorCon4.equals("")) {
						paramMap.put("buFinGoalCorCon", buFinGoalCorCon4);
					} else {
						paramMap.put("buFinGoalCorCon", "");
					}

					if (buParStDat4 != null && !buParStDat4.equals("")) {
						paramMap.put("buParStDat", buParStDat4);
					} else {
						paramMap.put("buParStDat", "");
					}

					if (buParEdDat4 != null && !buParEdDat4.equals("")) {
						paramMap.put("buParEdDat", buParEdDat4);
					} else {
						paramMap.put("buParEdDat", "");
					}

					if (buBusExp4 != null && !buBusExp4.equals("")) {
						paramMap.put("buBusExp", buBusExp4);
					} else {
						paramMap.put("buBusExp", "");
					}

					if (buResRol4 != null && !buResRol4.equals("")) {
						paramMap.put("buResRol", buResRol4);
					} else {
						paramMap.put("buResRol", "");
					}

					if (buTasSta4 != null && !buTasSta4.equals("")) {
						paramMap.put("buTasSta", buTasSta4);
					} else {
						paramMap.put("buTasSta", "");
					}

					if (buNum != null && !buNum.equals("")) {
						paramMap.put("buNum", buNum);
					}
					eMAU00H01Service.insertEMAU00H01021(paramMap);
					eMAU00H01Service.insertEMAU00H01022(paramMap);
					eMAU00H01Service.insertEMAU00H01023(paramMap);
				}

				else if (i == 5) {

					paramMap.put("buAgnId", i);

					paramMap.put("buAssType", null);

					if (coPk != null && !coPk.equals("")) {
						paramMap.put("coPk", coPk);
					}

					if (buOrgName5 != null && !buOrgName5.equals("")) {
						paramMap.put("buOrgName", buOrgName5);
					} else {
						paramMap.put("buOrgName", "");
					}

					if (buComRegNum5 != null && !buComRegNum5.equals("")) {
						paramMap.put("buComRegNum", buComRegNum5);
					} else {
						paramMap.put("buComRegNum", "");
					}

					if (buCorRegNum5 != null && !buCorRegNum5.equals("")) {
						paramMap.put("buCorRegNum", buCorRegNum5);
					} else {
						paramMap.put("buCorRegNum", "");
					}

					if (buRep5 != null && !buRep5.equals("")) {
						paramMap.put("buRep", buRep5);
					} else {
						paramMap.put("buRep", "");
					}

					paramMap.put("buBusName", null);

					paramMap.put("buProTit", null);

					paramMap.put("buFinGoalCorCon", null);

					paramMap.put("buParStDat", null);

					paramMap.put("buParEdDat", null);

					paramMap.put("buBusExp", null);

					paramMap.put("buResRol", null);

					paramMap.put("buTasSta", null);

					paramMap.put("buNum", null);

					eMAU00H01Service.insertEMAU00H01021(paramMap);
					eMAU00H01Service.insertEMAU00H01023(paramMap);
				}

			}

		} catch (Exception e) { // TODO: handle exception e.printStackTrace(); }

		}
		return mav;
	}

	/**
	 * 지능형평가모델 > 과제접수 등록 > 참여인력
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo    PartManVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/insertEMAU00H0104.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00H0104(@RequestParam Map<String, Object> param, ModelMap model)
			throws Exception {
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
		}

		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
		
		
		String coPk = (String) map.get("coPk");
		String buNum = (String) map.get("buNum");
		String buName = (String) map.get("buName");
		String buName2 = (String) map.get("buName2");
		String buName3 = (String) map.get("buName3");
		String buDateBir = (String) map.get("buDateBir");
		String buDateBir2 = (String) map.get("buDateBir2");
		String buDateBir3 = (String) map.get("buDateBir3");
		String buPhoNum = (String) map.get("buPhoNum");
		String buPhoNum2 = (String) map.get("buPhoNum2");
		String buPhoNum3 = (String) map.get("buPhoNum3");
		String buEmAdd = (String) map.get("buEmAdd");
		String buEmAdd2 = (String) map.get("buEmAdd2");
		String buEmAdd3 = (String) map.get("buEmAdd3");
		String buEmAdd4 = (String) map.get("buEmAdd4");
		String buEmAdd5 = (String) map.get("buEmAdd5");
		String buEmAdd6 = (String) map.get("buEmAdd6");
		String buFaxNum = (String) map.get("buFaxNum");
		String buFaxNum2 = (String) map.get("buFaxNum2");
		String buFaxNum3 = (String) map.get("buFaxNum3");
		String buMobPhoNum = (String) map.get("buMobPhoNum");
		String buMobPhoNum2 = (String) map.get("buMobPhoNum2");
		String buMobPhoNum3 = (String) map.get("buMobPhoNum3");
		String buMobPhoNum4 = (String) map.get("buMobPhoNum4");
		String buMobPhoNum5 = (String) map.get("buMobPhoNum5");
		String buMobPhoNum6 = (String) map.get("buMobPhoNum6");
		String buMobPhoNum7 = (String) map.get("buMobPhoNum7");
		String buMobPhoNum8 = (String) map.get("buMobPhoNum8");
		String buMobPhoNum9 = (String) map.get("buMobPhoNum9");
		String buDurWorSameInd = (String) map.get("buDurWorSameInd");
		String buDurWorSameInd2 = (String) map.get("buDurWorSameInd2");
		String buDurWorSameInd3 = (String) map.get("buDurWorSameInd3");
		String buRepAbl = (String) map.get("buRepAbl");
		String buSocManAbl = (String) map.get("buSocManAbl");
		String buTasManAbl = (String) map.get("buTasManAbl");
		String buAffType = (String) map.get("buAffType");
		String buOrgName = (String) map.get("buOrgName");
		String buResOrNot = (String) map.get("buResOrNot");
		String buName5 = (String) map.get("buName5");
		String buDateBir5 = (String) map.get("buDateBir5");
		String buDateEnt = (String) map.get("buDateEnt");
		String buSpot = (String) map.get("buSpot");
		String buTotAnnSal = (String) map.get("buTotAnnSal");
		String buTotAnnSal2 = (String) map.get("buTotAnnSal2");
		String buFinDeg = (String) map.get("buFinDeg");
		String buHolCer = (String) map.get("buHolCer");
		String buPatNatRdPro = (String) map.get("buPatNatRdPro");
		String buPatRatePro = (String) map.get("buPatRatePro");
		String buNewHir = (String) map.get("buNewHir");
		String buYonMan = (String) map.get("buYonMan");
		String buName4 = (String) map.get("buName4");
		String buDateBir4 = (String) map.get("buDateBir4");
		String buPhoNum4 = (String) map.get("buPhoNum4");
		String buEmAdd7 = (String) map.get("buEmAdd7");
		String buEmAdd8 = (String) map.get("buEmAdd8");
		String buFaxNum4 = (String) map.get("buFaxNum4");
		String buMobPhoNum10 = (String) map.get("buMobPhoNum10");
		String buMobPhoNum11 = (String) map.get("buMobPhoNum11");
		String buMobPhoNum12 = (String) map.get("buMobPhoNum12");
		String buPatRatePro2 = (String) map.get("buPatRatePro2");
		String buFinDeg2 = (String) map.get("buFinDeg2");
		String buAffType2 = (String) map.get("buAffType2");
		String buOrgName2 = (String) map.get("buOrgName2");

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		try {
			for (int i = 1; i <= 4; i++) {
				if (i == 1) {
					// 대표자 1
					paramMap.put("maGubun", i);
					
					if (coPk != null && !coPk.equals("")) {
						paramMap.put("coPk", coPk);
					}

					if (buNum != null && !buNum.equals("")) {
						paramMap.put("buNum", buNum);
					}
					// 성명
					if (buName != null && !buName.equals("")) {
						paramMap.put("buName", buName);
					}
					// 생년월일
					if (buDateBir != null && !buDateBir.equals("")) {
						paramMap.put("buDateBir", buDateBir);
					}
					// 전화번호
					if (buPhoNum != null && !buPhoNum.equals("")) {
						paramMap.put("buPhoNum", buPhoNum);
					}
					// 이메일1
					if (buEmAdd != null && !buEmAdd.equals("")) {
						paramMap.put("buEmAdd", buEmAdd);
					}
					// 이메일2

					if (buEmAdd2 != null && !buEmAdd2.equals("")) {
						paramMap.put("buEmAdd2", buEmAdd2);
					}
					// 팩스
					if (buFaxNum != null && !buFaxNum.equals("")) {
						paramMap.put("buFaxNum", buFaxNum);
					}
					// 전화1
					if (buMobPhoNum != null && !buMobPhoNum.equals("")) {
						paramMap.put("buMobPhoNum", buMobPhoNum);
					}
					// 전화2
					if (buMobPhoNum2 != null && !buMobPhoNum2.equals("")) {
						paramMap.put("buMobPhoNum2", buMobPhoNum2);
					}
					// 전화3
					if (buMobPhoNum3 != null && !buMobPhoNum3.equals("")) {
						paramMap.put("buMobPhoNum3", buMobPhoNum3);
					}
					// 동종
					if (buDurWorSameInd != null && !buDurWorSameInd.equals("")) {
						paramMap.put("buDurWorSameInd", buDurWorSameInd);
					}
					// 역량
					if (buRepAbl != null && !buRepAbl.equals("")) {
						paramMap.put("buRepAbl", buRepAbl);
					}
					eMAU00H01Service.insertEMAU00H01041(paramMap);
				} else if (i == 2) {
					paramMap.put("maGubun", i);
					
					if (coPk != null && !coPk.equals("")) {
						paramMap.put("coPk", coPk);
					}

					if (buNum != null && !buNum.equals("")) {
						paramMap.put("buNum", buNum);
					}
					// 성명
					if (buName2 != null && !buName2.equals("")) {
						paramMap.put("buName", buName2);
					} else {
						paramMap.put("buName", "");
					}
					// 생년월일
					if (buDateBir2 != null && !buDateBir2.equals("")) {
						paramMap.put("buDateBir", buDateBir2);
					} else {
						paramMap.put("buDateBir", "");
					}
					// 전화번호
					if (buPhoNum2 != null && !buPhoNum2.equals("")) {
						paramMap.put("buPhoNum", buPhoNum2);
					} else {
						paramMap.put("buPhoNum", "");
					}
					// 이메일1
					if (buEmAdd3 != null && !buEmAdd3.equals("")) {
						paramMap.put("buEmAdd", buEmAdd3);
					} else {
						paramMap.put("buEmAdd", "");
					}
					// 이메일2

					if (buEmAdd4 != null && !buEmAdd4.equals("")) {
						paramMap.put("buEmAdd2", buEmAdd4);
					} else {
						paramMap.put("buEmAdd2", "");
					}
					// 팩스
					if (buFaxNum2 != null && !buFaxNum2.equals("")) {
						paramMap.put("buFaxNum", buFaxNum2);
					} else {
						paramMap.put("buFaxNum", "");
					}
					// 전화1
					if (buMobPhoNum4 != null && !buMobPhoNum4.equals("")) {
						paramMap.put("buMobPhoNum", buMobPhoNum4);
					} else {
						paramMap.put("buMobPhoNum", "");
					}
					// 전화2
					if (buMobPhoNum5 != null && !buMobPhoNum5.equals("")) {
						paramMap.put("buMobPhoNum2", buMobPhoNum5);
					} else {
						paramMap.put("buMobPhoNum2", "");
					}
					// 전화3
					if (buMobPhoNum6 != null && !buMobPhoNum6.equals("")) {
						paramMap.put("buMobPhoNum3", buMobPhoNum6);
					} else {
						paramMap.put("buMobPhoNum3", "");
					}
					// 동종
					if (buDurWorSameInd2 != null && !buDurWorSameInd2.equals("")) {
						paramMap.put("buDurWorSameInd", buDurWorSameInd2);
					} else {
						paramMap.put("buDurWorSameInd", "");
					}
					// 역량
					if (buTasManAbl != null && !buTasManAbl.equals("")) {
						paramMap.put("buRepAbl", buTasManAbl);
					}
					eMAU00H01Service.insertEMAU00H01041(paramMap);
				} else if (i == 3) {
					paramMap.put("maGubun", i);
					
					if (coPk != null && !coPk.equals("")) {
						paramMap.put("coPk", coPk);
					}

					if (buNum != null && !buNum.equals("")) {
						paramMap.put("buNum", buNum);
					}
					// 성명
					if (buName3 != null && !buName3.equals("")) {
						paramMap.put("buName", buName3);
					} else {
						paramMap.put("buName", "");
					}
					// 생년월일
					if (buDateBir3 != null && !buDateBir3.equals("")) {
						paramMap.put("buDateBir", buDateBir3);
					} else {
						paramMap.put("buDateBir", "");
					}
					// 전화번호
					if (buPhoNum3 != null && !buPhoNum3.equals("")) {
						paramMap.put("buPhoNum", buPhoNum3);
					} else {
						paramMap.put("buPhoNum", "");
					}
					// 이메일1
					if (buEmAdd5 != null && !buEmAdd5.equals("")) {
						paramMap.put("buEmAdd", buEmAdd5);
					} else {
						paramMap.put("buEmAdd", "");
					}
					// 이메일2

					if (buEmAdd6 != null && !buEmAdd6.equals("")) {
						paramMap.put("buEmAdd2", buEmAdd6);
					} else {
						paramMap.put("buEmAdd2", "");
					}
					// 팩스
					if (buFaxNum3 != null && !buFaxNum3.equals("")) {
						paramMap.put("buFaxNum", buFaxNum3);
					} else {
						paramMap.put("buFaxNum", "");
					}
					// 전화1
					if (buMobPhoNum7 != null && !buMobPhoNum7.equals("")) {
						paramMap.put("buMobPhoNum", buMobPhoNum7);
					} else {
						paramMap.put("buMobPhoNum", "");
					}
					// 전화2
					if (buMobPhoNum8 != null && !buMobPhoNum8.equals("")) {
						paramMap.put("buMobPhoNum2", buMobPhoNum8);
					} else {
						paramMap.put("buMobPhoNum2", "");
					}
					// 전화3
					if (buMobPhoNum9 != null && !buMobPhoNum9.equals("")) {
						paramMap.put("buMobPhoNum3", buMobPhoNum9);
					} else {
						paramMap.put("buMobPhoNum3", "");
					}
					// 동종
					if (buDurWorSameInd3 != null && !buDurWorSameInd3.equals("")) {
						paramMap.put("buDurWorSameInd", buDurWorSameInd3);
					} else {
						paramMap.put("buDurWorSameInd", "");
					}
					// 역량
					if (buSocManAbl != null && !buSocManAbl.equals("")) {
						paramMap.put("buRepAbl", buSocManAbl);
					}

					eMAU00H01Service.insertEMAU00H01041(paramMap);
				} else if (i == 4) {
					paramMap.put("maGubun", i);
					
					if (coPk != null && !coPk.equals("")) {
						paramMap.put("coPk", coPk);
					}

					if (buNum != null && !buNum.equals("")) {
						paramMap.put("buNum", buNum);
					}
					// 성명
					if (buName4 != null && !buName4.equals("")) {
						paramMap.put("buName", buName4);
					} else {
						paramMap.put("buName", "");
					}
					// 생년월일
					if (buDateBir4 != null && !buDateBir4.equals("")) {
						paramMap.put("buDateBir", buDateBir4);
					} else {
						paramMap.put("buDateBir", "");
					}
					// 전화번호
					if (buPhoNum4 != null && !buPhoNum4.equals("")) {
						paramMap.put("buPhoNum", buPhoNum4);
					} else {
						paramMap.put("buPhoNum", "");
					}
					// 이메일1
					if (buEmAdd7 != null && !buEmAdd7.equals("")) {
						paramMap.put("buEmAdd", buEmAdd7);
					} else {
						paramMap.put("buEmAdd", "");
					}
					// 이메일2

					if (buEmAdd8 != null && !buEmAdd8.equals("")) {
						paramMap.put("buEmAdd2", buEmAdd8);
					} else {
						paramMap.put("buEmAdd2", "");
					}
					// 팩스
					if (buFaxNum4 != null && !buFaxNum4.equals("")) {
						paramMap.put("buFaxNum", buFaxNum4);
					} else {
						paramMap.put("buFaxNum", "");
					}
					// 전화1
					if (buMobPhoNum10 != null && !buMobPhoNum10.equals("")) {
						paramMap.put("buMobPhoNum", buMobPhoNum10);
					} else {
						paramMap.put("buMobPhoNum", "");
					}
					// 전화2
					if (buMobPhoNum11 != null && !buMobPhoNum11.equals("")) {
						paramMap.put("buMobPhoNum2", buMobPhoNum11);
					} else {
						paramMap.put("buMobPhoNum2", "");
					}
					// 전화3
					if (buMobPhoNum12 != null && !buMobPhoNum12.equals("")) {
						paramMap.put("buMobPhoNum3", buMobPhoNum12);
					} else {
						paramMap.put("buMobPhoNum3", "");
					}

					paramMap.put("buDurWorSameInd", null);
					paramMap.put("buRepAbl", null);
					eMAU00H01Service.insertEMAU00H01041(paramMap);
				}

			}

			if (buAffType != null && !buAffType.equals("")) {
				paramMap.put("buAffType", buAffType);
			}

			if (buOrgName != null && !buOrgName.equals("")) {
				paramMap.put("buOrgName", buOrgName);
			}

			if (buResOrNot != null && !buResOrNot.equals("")) {
				paramMap.put("buResOrNot", buResOrNot);
			}

			if (buName5 != null && !buName5.equals("")) {
				paramMap.put("buName5", buName5);
			} else {
				paramMap.put("buName5", "");
			}

			if (buDateBir5 != null && !buDateBir5.equals("")) {
				paramMap.put("buDateBir5", buDateBir5);
			} else {
				paramMap.put("buDateBir5", "");
			}

			if (buDateEnt != null && !buDateEnt.equals("")) {
				paramMap.put("buDateEnt", buDateEnt);
			}

			if (buSpot != null && !buSpot.equals("")) {
				paramMap.put("buSpot", buSpot);
			}

			if (buTotAnnSal != null && !buTotAnnSal.equals("")) {
				paramMap.put("buTotAnnSal", buTotAnnSal);
			}

			if (buPatNatRdPro != null && !buPatNatRdPro.equals("")) {
				paramMap.put("buPatNatRdPro", buPatNatRdPro);
			}

			if (buPatRatePro != null && !buPatRatePro.equals("")) {
				paramMap.put("buPatRatePro", buPatRatePro);
			}
			eMAU00H01Service.insertEMAU00H01042(paramMap);

			if (buAffType2 != null && !buAffType2.equals("")) {
				paramMap.put("buAffType", buAffType2);
			}

			if (buOrgName2 != null && !buOrgName2.equals("")) {
				paramMap.put("buOrgName2", buOrgName2);
			} else {
				paramMap.put("buOrgName2", "");
			}

			if (buFinDeg2 != null && !buFinDeg2.equals("")) {
				paramMap.put("buFinDeg", buFinDeg2);
			}

			if (buHolCer != null && !buHolCer.equals("")) {
				paramMap.put("buHolCer", buHolCer);
			}

			if (buNewHir != null && !buNewHir.equals("")) {
				paramMap.put("buNewHir", buNewHir);
			}

			if (buYonMan != null && !buYonMan.equals("")) {
				paramMap.put("buYonMan", buYonMan);
			}

			if (buTotAnnSal2 != null && !buTotAnnSal2.equals("")) {
				paramMap.put("buTotAnnSal", buTotAnnSal2);
			}

			if (buPatRatePro2 != null && !buPatRatePro2.equals("")) {
				paramMap.put("buPatRatePro2", buPatRatePro2);
			} else {
				paramMap.put("buPatRatePro2", "");
			}

			eMAU00H01Service.insertEMAU00H01043(paramMap);

		} catch (Exception e) { // TODO: handle exception e.printStackTrace(); }

		}
		return mav;
	}

	/**
	 * 지능형평가모델 > 과제접수 등록 > 연구개발 및 사업화 계획
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo    RDCommercialVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/insertEMAU00H0105.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00H0105(@RequestParam Map<String, Object> param, ModelMap model)
			throws Exception {
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
		}

		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);

		String coPk = (String) map.get("coPk");
		String buTecRodClaOne = (String) map.get("buTecRodClaOne");
		String buTecRodClaTwo = (String) map.get("buTecRodClaTwo");
		String buTecRodClaThr = (String) map.get("buTecRodClaThr");
		String buAssRelSrlRoa = (String) map.get("starData");
		String buSelRoaConTec = (String) map.get("buSelRoaConTec");
		String buRouPath = (String) map.get("buRouPath");
		String buRouPath2 = (String) map.get("buRouPath2");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();

		if (coPk != null && !coPk.equals("")) {
			paramMap.put("coPk", coPk);
		}

		if (buTecRodClaOne != null && !buTecRodClaOne.equals("")) {
			paramMap.put("buTecRodClaOne", buTecRodClaOne);
		}

		if (buTecRodClaTwo != null && !buTecRodClaTwo.equals("")) {
			paramMap.put("buTecRodClaTwo", buTecRodClaTwo);
		}

		if (buTecRodClaThr != null && !buTecRodClaThr.equals("")) {
			paramMap.put("buTecRodClaThr", buTecRodClaThr);
		}
		if (buAssRelSrlRoa != null && !buAssRelSrlRoa.equals("")) {
			paramMap.put("buAssRelSrlRoa", buAssRelSrlRoa);
		}

		if (buSelRoaConTec != null && !buSelRoaConTec.equals("")) {
			paramMap.put("buSelRoaConTec", buSelRoaConTec);
		}

		if (buRouPath != null && !buRouPath.equals("")) {
			paramMap.put("buRouPath", buRouPath);
		}

		if (buRouPath2 != null && !buRouPath2.equals("")) {
			paramMap.put("buRouPath2", buRouPath2);
		} else {
			paramMap.put("buRouPath2", "");
		}
		eMAU00H01Service.insertEMAU00H0105(paramMap);

		return mav;
	}

	/**
	 * 지능형평가모델 > 과제접수 등록 > 기관정보 관리
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo    InsInfoVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/insertEMAU00H0107.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00H0107(@RequestParam Map<String, Object> param, ModelMap model)
			throws Exception {
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
		}

		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);

		String buAgnId = (String) map.get("buAgnId");
		String buPw = (String) map.get("buPw");
		String buPwCon = (String) map.get("buPwCon");
		String buAccManName = (String) map.get("buAccManName");
		String buEmAdd = (String) map.get("buEmAdd");
		String buMobPhoNum = (String) map.get("buMobPhoNum");
		String buComRegNum = (String) map.get("buComRegNum");
		String buCorRegNum = (String) map.get("buCorRegNum");
		String buOrgName = (String) map.get("buOrgName");
		String buCorType = (String) map.get("buCorType");
		String buDateEst = (String) map.get("buDateEst");
		String buIndCla = (String) map.get("buIndCla");
		String buMainPro = (String) map.get("buMainPro");
		String buHomePage = (String) map.get("buHomePage");
		String buHeaAdd = (String) map.get("buHeaAdd");
		String buMainBusAdd = (String) map.get("buMainBusAdd");
		String buHeaArea = (String) map.get("buHeaArea");
		String buMainBusArea = (String) map.get("buMainBusArea");
		String buHeaOffDep = (String) map.get("buHeaOffDep");
		String buHeaOffMonRent = (String) map.get("buHeaOffMonRent");
		String buMainBusDep = (String) map.get("buMainBusDep");
		String buMainBusMonRent = (String) map.get("buMainBusMonRent");
		String buNumFtWor = (String) map.get("buNumFtWor");
		String buNumOffWor = (String) map.get("buNumOffWor");
		String buNumLabWor = (String) map.get("buNumLabWor");
		String buNumSkiWor = (String) map.get("buNumSkiWor");
		String buNumTecWor = (String) map.get("buNumTecWor");
		String buOther = (String) map.get("buOther");
		String buName = (String) map.get("buName");
		String buDateBir = (String) map.get("buDateBir");
		String buPhoNum = (String) map.get("buPhoNum");
		String buEmAdd2 = (String) map.get("buEmAdd2");
		String buFaxNum = (String) map.get("buFaxNum");
		String buMobPhoNum2 = (String) map.get("buMobPhoNum2");
		String buBaseFisYear = (String) map.get("buBaseFisYear");
		String buEaports = (String) map.get("buEaports");
		String buEaports2 = (String) map.get("buEaports2");
		String buTotDebt = (String) map.get("buTotDebt");
		String buOpePro = (String) map.get("buOpePro");
		String buCurAss = (String) map.get("buCurAss");
		String buTotInv = (String) map.get("buTotInv");
		String buRndInv = (String) map.get("buRndInv");
		String buCurLsa = (String) map.get("buCurLsa");
		String buTotAss = (String) map.get("buTotAss");
		String buIvn = (String) map.get("buIvn");
		String buCurFixAss = (String) map.get("buCurFixAss");
		String buNetInc = (String) map.get("buNetInc");
		String buCurSal = (String) map.get("buCurSal");
		String buRleSal = (String) map.get("buRleSal");
		String buComDesNum = (String) map.get("buComDesNum");
		String buComValPer = (String) map.get("buComValPer");
		String buVenComDesNum = (String) map.get("buVenComDesNum");
		String buVenComValPer = (String) map.get("buVenComValPer");
		String buShaName = (String) map.get("buShaName");
		String buRelMan = (String) map.get("buRelMan");
		String buHolStoOrdSto = (String) map.get("buHolStoOrdSto");
		String buHolStoSto = (String) map.get("buHolStoSto");
		String buAmoStoHel = (String) map.get("buAmoStoHel");
		String buProName = (String) map.get("buProName");
		String buProTit = (String) map.get("buProTit");
		String buFinGoalCorCon = (String) map.get("buFinGoalCorCon");
		String buAssStaDat = (String) map.get("buAssStaDat");
		String buAssEndDat = (String) map.get("buAssEndDat");
		String buParStaDat = (String) map.get("buParStaDat");
		String buParEndDat = (String) map.get("buParEndDat");
		String buTotGovApp = (String) map.get("buTotGovApp");
		String buResRole = (String) map.get("buResRole");
		String buIntGovApp = (String) map.get("buIntGovApp");
		String buTaskSta = (String) map.get("buTaskSta");
		String buComRes = (String) map.get("buComRes");
		String buBusName = (String) map.get("buBusName");
		String buProTit2 = (String) map.get("buProTit2");
		String buFinGoalCorCon2 = (String) map.get("buFinGoalCorCon2");
		String buBusStDate = (String) map.get("buBusStDate");
		String buBusEndDate = (String) map.get("buBusEndDate");
		String buParStDate = (String) map.get("buParStDate");
		String buParEndDate = (String) map.get("buParEndDate");
		String buTotProCost = (String) map.get("buTotProCost");
		String buResRole2 = (String) map.get("buResRole2");
		String buInsBusExp = (String) map.get("buInsBusExp");
		String buBusSta = (String) map.get("buBusSta");
		String buComRes2 = (String) map.get("buComRes2");
		String buFacEquName = (String) map.get("buFacEquName");
		String buStandard = (String) map.get("buStandard");
		String buPurPri = (String) map.get("buPurPri");
		String buTearPur = (String) map.get("buTearPur");
		String buPur = (String) map.get("buPur");
		String buComItemName = (String) map.get("buComItemName");
		String buComYear = (String) map.get("buComYear");
		String buItemUse = (String) map.get("buItemUse");
		String buQuaPriCom = (String) map.get("buQuaPriCom");
		String buExpNot = (String) map.get("buExpNot");
		String buSalCha = (String) map.get("buSalCha");

		HashMap<String, Object> paramMap = new HashMap<String, Object>();

		if (buAgnId != null && !buAgnId.equals("")) {
			paramMap.put("buAgnId", buAgnId);
		}

		if (buPw != null && !buPw.equals("")) {
			paramMap.put("buPw", buPw);
		}

		if (buPwCon != null && !buPwCon.equals("")) {
			paramMap.put("buPwCon", buPwCon);
		}

		if (buAccManName != null && !buAccManName.equals("")) {
			paramMap.put("buAccManName", buAccManName);
		}

		if (buEmAdd != null && !buEmAdd.equals("")) {
			paramMap.put("buEmAdd", buEmAdd);
		}

		if (buMobPhoNum != null && !buMobPhoNum.equals("")) {
			paramMap.put("buMobPhoNum", buMobPhoNum);
		}

		if (buComRegNum != null && !buComRegNum.equals("")) {
			paramMap.put("buComRegNum", buComRegNum);
		}

		if (buCorRegNum != null && !buCorRegNum.equals("")) {
			paramMap.put("buCorRegNum", buCorRegNum);
		}

		if (buOrgName != null && !buOrgName.equals("")) {
			paramMap.put("buOrgName", buOrgName);
		}

		if (buCorType != null && !buCorType.equals("")) {
			paramMap.put("buCorType", buCorType);
		}

		if (buDateEst != null && !buDateEst.equals("")) {
			paramMap.put("buDateEst", buDateEst);
		}

		if (buIndCla != null && !buIndCla.equals("")) {
			paramMap.put("buIndCla", buIndCla);
		}

		if (buMainPro != null && !buMainPro.equals("")) {
			paramMap.put("buMainPro", buMainPro);
		}

		if (buHomePage != null && !buHomePage.equals("")) {
			paramMap.put("buHomePage", buHomePage);
		}

		if (buHeaAdd != null && !buHeaAdd.equals("")) {
			paramMap.put("buHeaAdd", buHeaAdd);
		}

		if (buMainBusAdd != null && !buMainBusAdd.equals("")) {
			paramMap.put("buMainBusAdd", buMainBusAdd);
		}

		if (buHeaArea != null && !buHeaArea.equals("")) {
			paramMap.put("buHeaArea", buHeaArea);
		}

		if (buHeaOffDep != null && !buHeaOffDep.equals("")) {
			paramMap.put("buHeaOffDep", buHeaOffDep);
		}

		if (buHeaOffMonRent != null && !buHeaOffMonRent.equals("")) {
			paramMap.put("buHeaOffMonRent", buHeaOffMonRent);
		}

		if (buMainBusDep != null && !buMainBusDep.equals("")) {
			paramMap.put("buMainBusDep", buMainBusDep);
		}

		if (buMainBusMonRent != null && !buMainBusMonRent.equals("")) {
			paramMap.put("buMainBusMonRent", buMainBusMonRent);
		}

		if (buNumFtWor != null && !buNumFtWor.equals("")) {
			paramMap.put("buNumFtWor", buNumFtWor);
		}

		if (buNumOffWor != null && !buNumOffWor.equals("")) {
			paramMap.put("buNumOffWor", buNumOffWor);
		}

		if (buNumLabWor != null && !buNumLabWor.equals("")) {
			paramMap.put("buNumLabWor", buNumLabWor);
		}

		if (buNumSkiWor != null && !buNumSkiWor.equals("")) {
			paramMap.put("buNumSkiWor", buNumSkiWor);
		}

		if (buNumTecWor != null && !buNumTecWor.equals("")) {
			paramMap.put("buNumTecWor", buNumTecWor);
		}

		if (buOther != null && !buOther.equals("")) {
			paramMap.put("buOther", buOther);
		}

		if (buName != null && !buName.equals("")) {
			paramMap.put("buName", buName);
		}

		if (buDateBir != null && !buDateBir.equals("")) {
			paramMap.put("buDateBir", buDateBir);
		}

		if (buPhoNum != null && !buPhoNum.equals("")) {
			paramMap.put("buPhoNum", buPhoNum);
		}

		if (buEmAdd2 != null && !buEmAdd2.equals("")) {
			paramMap.put("buEmAdd2", buEmAdd2);
		}

		if (buFaxNum != null && !buFaxNum.equals("")) {
			paramMap.put("buFaxNum", buFaxNum);
		}

		if (buMobPhoNum2 != null && !buMobPhoNum2.equals("")) {
			paramMap.put("buMobPhoNum2", buMobPhoNum2);
		} else {
			paramMap.put("buMobPhoNum2", "");
		}

		if (buBaseFisYear != null && !buBaseFisYear.equals("")) {
			paramMap.put("buBaseFisYear", buBaseFisYear);
		}

		if (buEaports != null && !buEaports.equals("")) {
			paramMap.put("buEaports", buEaports);
		}

		if (buEaports2 != null && !buEaports2.equals("")) {
			paramMap.put("buEaports2", buEaports2);
		} else {
			paramMap.put("buEaports2", "");
		}

		if (buTotDebt != null && !buTotDebt.equals("")) {
			paramMap.put("buTotDebt", buTotDebt);
		}

		if (buIvn != null && !buIvn.equals("")) {
			paramMap.put("buIvn", buIvn);
		}

		if (buCurFixAss != null && !buCurFixAss.equals("")) {
			paramMap.put("buCurFixAss", buCurFixAss);
		}

		if (buNetInc != null && !buNetInc.equals("")) {
			paramMap.put("buNetInc", buNetInc);
		}

		if (buCurSal != null && !buCurSal.equals("")) {
			paramMap.put("buCurSal", buCurSal);
		}

		if (buRleSal != null && !buRleSal.equals("")) {
			paramMap.put("buRleSal", buRleSal);
		}

		if (buComDesNum != null && !buComDesNum.equals("")) {
			paramMap.put("buComDesNum", buComDesNum);
		}

		if (buComValPer != null && !buComValPer.equals("")) {
			paramMap.put("buComValPer", buComValPer);
		}

		if (buVenComDesNum != null && !buVenComDesNum.equals("")) {
			paramMap.put("buVenComDesNum", buVenComDesNum);
		}

		if (buOpePro != null && !buOpePro.equals("")) {
			paramMap.put("buOpePro", buOpePro);
		}

		if (buCurAss != null && !buCurAss.equals("")) {
			paramMap.put("buCurAss", buCurAss);
		}

		if (buTotInv != null && !buTotInv.equals("")) {
			paramMap.put("buTotInv", buTotInv);
		}

		if (buRndInv != null && !buRndInv.equals("")) {
			paramMap.put("buRndInv", buRndInv);
		}

		if (buCurLsa != null && !buCurLsa.equals("")) {
			paramMap.put("buCurLsa", buCurLsa);
		}

		if (buTotAss != null && !buTotAss.equals("")) {
			paramMap.put("buTotAss", buTotAss);
		}

		if (buVenComValPer != null && !buVenComValPer.equals("")) {
			paramMap.put("buVenComValPer", buVenComValPer);
		}

		if (buMainBusArea != null && !buMainBusArea.equals("")) {
			paramMap.put("buMainBusArea", buMainBusArea);
		}

		if (buProName != null && !buProName.equals("")) {
			paramMap.put("buProName", buProName);
		}

		if (buProTit != null && !buProTit.equals("")) {
			paramMap.put("buProTit", buProTit);
		}

		if (buFinGoalCorCon != null && !buFinGoalCorCon.equals("")) {
			paramMap.put("buFinGoalCorCon", buFinGoalCorCon);
		}

		if (buAssStaDat != null && !buAssStaDat.equals("")) {
			paramMap.put("buAssStaDat", buAssStaDat);
		}

		if (buAssEndDat != null && !buAssEndDat.equals("")) {
			paramMap.put("buAssEndDat", buAssEndDat);
		}

		if (buParStaDat != null && !buParStaDat.equals("")) {
			paramMap.put("buParStaDat", buParStaDat);
		}

		if (buParEndDat != null && !buParEndDat.equals("")) {
			paramMap.put("buParEndDat", buParEndDat);
		}

		if (buTotGovApp != null && !buTotGovApp.equals("")) {
			paramMap.put("buTotGovApp", buTotGovApp);
		}

		if (buResRole != null && !buResRole.equals("")) {
			paramMap.put("buResRole", buResRole);
		}

		if (buIntGovApp != null && !buIntGovApp.equals("")) {
			paramMap.put("buIntGovApp", buIntGovApp);
		}

		if (buTaskSta != null && !buTaskSta.equals("")) {
			paramMap.put("buTaskSta", buTaskSta);
		}

		if (buComRes != null && !buComRes.equals("")) {
			paramMap.put("buComRes", buComRes);
		}

		if (buShaName != null && !buShaName.equals("")) {
			paramMap.put("buShaName", buShaName);
		}

		if (buRelMan != null && !buRelMan.equals("")) {
			paramMap.put("buRelMan", buRelMan);
		}

		if (buHolStoOrdSto != null && !buHolStoOrdSto.equals("")) {
			paramMap.put("buHolStoOrdSto", buHolStoOrdSto);
		}

		if (buHolStoSto != null && !buHolStoSto.equals("")) {
			paramMap.put("buHolStoSto", buHolStoSto);
		}

		if (buAmoStoHel != null && !buAmoStoHel.equals("")) {
			paramMap.put("buAmoStoHel", buAmoStoHel);
		}

		if (buBusName != null && !buBusName.equals("")) {
			paramMap.put("buBusName", buBusName);
		}

		if (buProTit2 != null && !buProTit2.equals("")) {
			paramMap.put("buProTit2", buProTit2);
		} else { 
			paramMap.put("buProTit2", "");
		}

		if (buFinGoalCorCon2 != null && !buFinGoalCorCon2.equals("")) {
			paramMap.put("buFinGoalCorCon2", buFinGoalCorCon2);
		} else { 
			paramMap.put("buFinGoalCorCon2", "");
		}

		if (buBusStDate != null && !buBusStDate.equals("")) {
			paramMap.put("buBusStDate", buBusStDate);
		}

		if (buBusEndDate != null && !buBusEndDate.equals("")) {
			paramMap.put("buBusEndDate", buBusEndDate);
		}

		if (buParStDate != null && !buParStDate.equals("")) {
			paramMap.put("buParStDate", buParStDate);
		}

		if (buParEndDate != null && !buParEndDate.equals("")) {
			paramMap.put("buParEndDate", buParEndDate);
		}

		if (buTotProCost != null && !buTotProCost.equals("")) {
			paramMap.put("buTotProCost", buTotProCost);
		}

		if (buResRole2 != null && !buResRole2.equals("")) {
			paramMap.put("buResRole2", buResRole2);
		} else { 
			paramMap.put("buResRole2", "");
		}

		if (buInsBusExp != null && !buInsBusExp.equals("")) {
			paramMap.put("buInsBusExp", buInsBusExp);
		}

		if (buBusSta != null && !buBusSta.equals("")) {
			paramMap.put("buBusSta", buBusSta);
		}

		if (buComRes2 != null && !buComRes2.equals("")) {
			paramMap.put("buComRes2", buComRes2);
		}

		if (buFacEquName != null && !buFacEquName.equals("")) {
			paramMap.put("buFacEquName", buFacEquName);
		}

		if (buStandard != null && !buStandard.equals("")) {
			paramMap.put("buStandard", buStandard);
		}

		if (buPurPri != null && !buPurPri.equals("")) {
			paramMap.put("buPurPri", buPurPri);
		}

		if (buTearPur != null && !buTearPur.equals("")) {
			paramMap.put("buTearPur", buTearPur);
		}

		if (buPur != null && !buPur.equals("")) {
			paramMap.put("buPur", buPur);
		}

		if (buComItemName != null && !buComItemName.equals("")) {
			paramMap.put("buComItemName", buComItemName);
		}

		if (buComYear != null && !buComYear.equals("")) {
			paramMap.put("buComYear", buComYear);
		}

		if (buItemUse != null && !buItemUse.equals("")) {
			paramMap.put("buItemUse", buItemUse);
		}

		if (buQuaPriCom != null && !buQuaPriCom.equals("")) {
			paramMap.put("buQuaPriCom", buQuaPriCom);
		}

		if (buExpNot != null && !buExpNot.equals("")) {
			paramMap.put("buExpNot", buExpNot);
		}

		if (buSalCha != null && !buSalCha.equals("")) {
			paramMap.put("buSalCha", buSalCha);
		}

		try {

			eMAU00H01Service.insertEMAU00H01071(paramMap);
			eMAU00H01Service.insertEMAU00H01072(paramMap);
			eMAU00H01Service.insertEMAU00H01073(paramMap);
			eMAU00H01Service.insertEMAU00H01074(paramMap);
			eMAU00H01Service.insertEMAU00H01075(paramMap);
			eMAU00H01Service.insertEMAU00H01076(paramMap);

		} catch (Exception e) { // TODO: handle exception e.printStackTrace(); }

		}
		return mav;

	}

	/**
	 * 지능형평가모델 > 과제접수 등록 > 신청과제 정보
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo    InsInfoVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/searchPk.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00H01SearchFirstOption(@RequestParam Map<String, Object> param,
			ModelMap model) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);

		String buPjName = (String) map.get("buPjName");
		AppProInfo vo = new AppProInfo();

		if (buPjName != null && !buPjName.equals("")) {
			vo.setBuPjName(buPjName);
		}

		List<AppProInfo> list = null;

		try {
			list = eMAU00H01Service.searchPk(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}

	/**
	 * 지능형평가모델 > 과제접수 등록 > 참여기관
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo    InsInfoVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/searchPk2.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00H01SearchFirstOption2(@RequestParam Map<String, Object> param,
			ModelMap model) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);

		String coPk = (String) map.get("coPk");
		AppProInfo vo = new AppProInfo();

		if (coPk != null && !coPk.equals("")) {
			vo.setCoPk(coPk);
		}

		List<AppProInfo> list = null;

		try {
			list = eMAU00H01Service.searchPk2(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}

	/**
	 * 지능형평가모델 > 과제접수 등록 > 참여기관
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo    InsInfoVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/searchPk3.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00H01SearchFirstOption3(@RequestParam Map<String, Object> param,
			ModelMap model) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);

		String coPk = (String) map.get("coPk");
		AppProInfo vo = new AppProInfo();

		if (coPk != null && !coPk.equals("")) {
			vo.setCoPk(coPk);
		}

		List<AppProInfo> list = null;

		try {
			list = eMAU00H01Service.searchPk3(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	/**
	 * 지능형평가모델 > 과제접수 등록 > 참여기관
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo    InsInfoVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00H01/searchPk4.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00H01SearchFirstOption4(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
		
		String coPk = (String) map.get("coPk"); 
		AppProInfo vo = new AppProInfo();
		
		
		if(coPk!=null && !coPk.equals("")) {
			vo.setCoPk(coPk);
		}
		
		List<AppProInfo> list = null;
		
		try {
			list = eMAU00H01Service.searchPk4(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	@RequestMapping(value = "/empo/EMAU00H01/uploadFile.do", method = RequestMethod.POST)
	public void uploadFile(MultipartFile[] uploadFile, String tlPk) {
		System.out.println(tlPk);
		String uploadFolder = "D:\\testFile";
		AppProInfo vo = new AppProInfo();
		long result = 0;
		vo.setFlPk("0");
		if (tlPk!=null && ! tlPk.equals("")) {
			vo.setTlPk(tlPk);
		}
		
		for (MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			// IE has file path uploadFileName =
			uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			File saveFile = new File(uploadFolder, uploadFileName);
			String FilePath = uploadFolder + "/" + uploadFileName;
			
			try {
				multipartFile.transferTo(saveFile);
				System.out.println(uploadFileName); // 파일이름
				System.out.println(saveFile); // 파일 경로 이름
				vo.setSaveFileName(FilePath);
				vo.setUploadFileName(uploadFileName);
				System.out.println(vo);
				result = eMAU00H01Service.uploadFile(vo);
			} catch (Exception e) {
			}
		}
	}
}