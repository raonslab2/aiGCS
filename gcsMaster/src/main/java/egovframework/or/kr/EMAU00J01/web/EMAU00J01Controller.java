package egovframework.or.kr.EMAU00J01.web;

import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00J01.service.BusinessVO;
import egovframework.or.kr.EMAU00J01.service.EMAU00J01Service;
import egovframework.or.kr.EMAU00J01.service.PolicyConformVO;
import egovframework.or.kr.EMAU00J01.service.TechVO;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.or.kr.com.utill.EmpiUserDetailsHelper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * restFull(Sample 소스)
 * @author 실행환경 개발팀 JJY
 * @since 2011.08.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.08.31  JJY            최초 생성
 *
 * </pre>
 */
@Controller@SessionAttributes(types = ComDefaultVO.class)
public class EMAU00J01Controller {

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00J01Service")
    private EMAU00J01Service eMAU00J01Service;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
 

	/**
	 * 지능형평가모델 > 예비평가 결과분석
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0101.do")
	public String EMAU00J0101(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0101";
	} 
	
	/**
	 * 지능형평가모델 > 예비평가 결과분석 >과제 접수 현황
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/IncSubject.do")
	public String IncSubject(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/inc_subject";
	} 
	
	/**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0102.do")
	public String EMAU00J0102(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0102";
	} 
	
	/**
	 * 지능형평가모델 > 심층평가 > 기술성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/IncTabMenu01.do")
	public String IncTabMenu01(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/inc_tab_menu01";
	} 
	
	/**
	 * 지능형평가모델 > 심층평가 > 사업성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/IncTabMenu02.do")
	public String IncTabMenu02(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/inc_tab_menu02";
	} 
	
	/**
	 * 지능형평가모델 > 심층평가 > 정책부합성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/IncTabMenu03.do")
	public String IncTabMenu03(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/inc_tab_menu03";
	} 
	
	/**
	 * 지능형평가모델 > 심층평가 > 기술파급력
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0103.do")
	public String EMAU00J0103(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0103";
	} 
	
	/**
	 * 지능형평가모델 > 심층평가 > 실현가능성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0104.do")
	public String EMAU00J0104(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0104";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 기술개발역량
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0105.do")
	public String EMAU00J0105(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0105";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 계획의 구체성 및 적정성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0106.do")
	public String EMAU00J0106(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0106";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 기술보호 적정성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0107.do")
	public String EMAU00J0107(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0107";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 목표시장 혁신성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0108.do")
	public String EMAU00J0108(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0108";
	}
	
	
	/**
	 * 지능형평가모델 > 심층평가 > 목표시장 규모 및 성장성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0109.do")
	public String EMAU00J0109(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0109";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 사업화역량
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0110.do")
	public String EMAU00J0110(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0110";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 시장진입가능성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0111.do")
	public String EMAU00J0111(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0111";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 사업화투자계획적정성
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0112.do")
	public String EMAU00J0112(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0112";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 고용친화도
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0113.do")
	public String EMAU00J0113(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0113";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 산업별특화지표
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0114.do")
	public String EMAU00J0114(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0114";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 심층평가 결과
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0115.do")
	public String EMAU00J0115(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0115";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 예비평가결과분석
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/EMAU00J01/EMAU00J0116.do")
	public String EMAU00J0116(HttpServletRequest request, ModelMap model)
	  throws Exception{
		

		return "main/EMAU00J01/EMAU00J0116";
	}
	
	/**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0102.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0102(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String checkList1 = (String) map.get("checkList1");
    	String checkList2 = (String) map.get("checkList2");
    	String checkList3 = (String) map.get("checkList3");
    	String checkList4 = (String) map.get("checkList4");
    	String checkList5 = (String) map.get("checkList5");
    	String checkList6 = (String) map.get("checkList6");
    	String checkList7 = (String) map.get("checkList7");
    	String evalScore = (String) map.get("evalScore");
    	
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	paramMap.put("coPk", 1);
    	paramMap.put("buPk", 1);
    	
    	if(checkList1!=null && !checkList1.equals("")) {
    		paramMap.put("checkList1", checkList1);
		}
		
		if(checkList2!=null && !checkList2.equals("")) {
			paramMap.put("checkList2", checkList2);
		}
    	
			paramMap.put("checkList3", checkList3);
		
		if(checkList4!=null && !checkList4.equals("")) {
			paramMap.put("checkList4", checkList4);
		}
		
			paramMap.put("checkList5", checkList5);
		
		if(checkList6!=null && !checkList6.equals("")) {
			paramMap.put("checkList6", checkList6);
		}
		
			paramMap.put("checkList7", checkList7);
		
		
		if(evalScore!=null && !evalScore.equals("")) {
			paramMap.put("evalScore", evalScore);
		}
    	
		try {
			
				eMAU00J01Service.insertEMAU00J0102(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
	
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0103.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0103(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
     	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String checkList8 = (String) map.get("checkList8");
    	String checkList9 = (String) map.get("checkList9");
    	String checkList10 = (String) map.get("checkList10");
    	String checkList11 = (String) map.get("checkList11");
    	String checkList12 = (String) map.get("checkList12");
    	String checkList13 = (String) map.get("checkList13");
    	String checkList14 = (String) map.get("checkList14");
    	String checkList15 = (String) map.get("checkList15");
    	String evalScore2 = (String) map.get("evalScore2");
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
    	
    	if(checkList8!=null && !checkList8.equals("")) {
    		paramMap.put("checkList8", checkList8);
		}
    	
		if(checkList9!=null && !checkList9.equals("")) {
			paramMap.put("checkList9", checkList9);
		}
		
		if(checkList10!=null && !checkList10.equals("")) {
			paramMap.put("checkList10", checkList10);
		}
		
		if(checkList11!=null && !checkList11.equals("")) {
			paramMap.put("checkList11", checkList11);
		}
		
		if(checkList12!=null && !checkList12.equals("")) {
			paramMap.put("checkList12", checkList12);
		}
		
		if(checkList13!=null && !checkList13.equals("")) {
			paramMap.put("checkList13", checkList13);
		}
		
		if(checkList14!=null && !checkList14.equals("")) {
			paramMap.put("checkList14", checkList14);
		}
		
		if(checkList15!=null && !checkList15.equals("")) {
			paramMap.put("checkList15", checkList15);
		}
    	
		if(evalScore2!=null && !evalScore2.equals("")) {
			paramMap.put("evalScore2", evalScore2);
		}
    	
    	
    	
		try {
			
				eMAU00J01Service.insertEMAU00J0103(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0104.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0104(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
     	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String checkList16 = (String) map.get("checkList16");
    	String checkList17 = (String) map.get("checkList17");
    	String checkList18 = (String) map.get("checkList18");
    	String checkList19 = (String) map.get("checkList19");
    	String checkList20 = (String) map.get("checkList20");
    	String checkList21 = (String) map.get("checkList21");
    	String checkList22 = (String) map.get("checkList22");
    	String checkList23 = (String) map.get("checkList23");
    	String checkList24 = (String) map.get("checkList24");
    	String checkList25 = (String) map.get("checkList25");
    	String checkList26 = (String) map.get("checkList26");
    	String checkList27 = (String) map.get("checkList27");
    	String checkList28 = (String) map.get("checkList28");
    	String evalScore3 = (String) map.get("evalScore3");
    	
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();

    
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
    	if(checkList16!=null && !checkList16.equals("")) {
    		paramMap.put("checkList16", checkList16);
		}
		
		if(checkList17!=null && !checkList17.equals("")) {
			paramMap.put("checkList17", checkList17);
		}
    	
		if(checkList18!=null && !checkList18.equals("")) {
			paramMap.put("checkList18", checkList18);
		}
		
		if(checkList19!=null && !checkList19.equals("")) {
			paramMap.put("checkList19", checkList19);
		}
		
		if(checkList20!=null && !checkList20.equals("")) {
			paramMap.put("checkList20", checkList20);
		}
		
		if(checkList21!=null && !checkList21.equals("")) {
			paramMap.put("checkList21", checkList21);
		}
		
		if(checkList22!=null && !checkList22.equals("")) {
			paramMap.put("checkList22", checkList22);
		}
    	
    	if(checkList23!=null && !checkList23.equals("")) {
    		paramMap.put("checkList23", checkList23);
		}
    	
		if(checkList24!=null && !checkList24.equals("")) {
			paramMap.put("checkList24", checkList24);
		}
		
		if(checkList25!=null && !checkList25.equals("")) {
			paramMap.put("checkList25", checkList25);
		}
		
		if(checkList26!=null && !checkList26.equals("")) {
			paramMap.put("checkList26", checkList26);
		}
    	
		if(checkList27!=null && !checkList27.equals("")) {
			paramMap.put("checkList27", checkList27);
		}
		
		if(checkList28!=null && !checkList28.equals("")) {
			paramMap.put("checkList28", checkList28);
		}
		
		if(evalScore3!=null && !evalScore3.equals("")) {
			paramMap.put("evalScore3", evalScore3);
		}
    	
		try {
			
				eMAU00J01Service.insertEMAU00J0104(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0105.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0105(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
     	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String coPk = (String) map.get("coPk");
    	String buPk = (String) map.get("buPk");
    	String checkList29 = (String) map.get("checkList29");
    	String checkList30 = (String) map.get("checkList30");
    	String checkList31 = (String) map.get("checkList31");
    	String checkList32 = (String) map.get("checkList32");
    	String checkList33 = (String) map.get("checkList33");
    	String checkList34 = (String) map.get("checkList34");
    	String checkList35 = (String) map.get("checkList35");
    	String checkList36 = (String) map.get("checkList36");
    	String checkList37 = (String) map.get("checkList37");
    	String checkList38 = (String) map.get("checkList38");
    	String checkList39 = (String) map.get("checkList39");
    	String evalScore4 = (String) map.get("evalScore4");
    	
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
    	if(checkList29!=null && !checkList29.equals("")) {
    		paramMap.put("checkList29", checkList29);
		}
    	
    	if(checkList30!=null && !checkList30.equals("")) {
    		paramMap.put("checkList30", checkList30);
		}
    	
    	if(checkList31!=null && !checkList31.equals("")) {
    		paramMap.put("checkList31", checkList31);
		}
    	
    	if(checkList32!=null && !checkList32.equals("")) {
    		paramMap.put("checkList32", checkList32);
		}
    	
    	if(checkList33!=null && !checkList33.equals("")) {
    		paramMap.put("checkList33", checkList33);
		}
    	
    	if(checkList34!=null && !checkList34.equals("")) {
    		paramMap.put("checkList34", checkList34);
		}
    	
    	if(checkList35!=null && !checkList35.equals("")) {
    		paramMap.put("checkList35", checkList35);
		}
    	
    	if(checkList36!=null && !checkList36.equals("")) {
    		paramMap.put("checkList36", checkList36);
		}
    	
    	if(checkList37!=null && !checkList37.equals("")) {
    		paramMap.put("checkList37", checkList37);
		}
    	
    	if(checkList38!=null && !checkList38.equals("")) {
    		paramMap.put("checkList38", checkList38);
		}
    	
    	if(checkList39!=null && !checkList39.equals("")) {
    		paramMap.put("checkList39", checkList39);
		}
    	
    	if(evalScore4!=null && !evalScore4.equals("")) {
    		paramMap.put("evalScore4", evalScore4);
		}
    	
		try {
			
				eMAU00J01Service.insertEMAU00J0105(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0106.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0106(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
     	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String checkList40 = (String) map.get("checkList40");
    	String checkList41 = (String) map.get("checkList41");
    	String checkList42 = (String) map.get("checkList42");
    	String checkList43 = (String) map.get("checkList43");
    	String checkList44 = (String) map.get("checkList44");
    	String checkList45 = (String) map.get("checkList45");
    	String checkList46 = (String) map.get("checkList46");
    	String evalScore5 = (String) map.get("evalScore5");
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
    	if(checkList40!=null && !checkList40.equals("")) {
    		paramMap.put("checkList40", checkList40);
		}
    	
    	if(checkList41!=null && !checkList41.equals("")) {
    		paramMap.put("checkList41", checkList41);
		}
    	
    	if(checkList42!=null && !checkList42.equals("")) {
    		paramMap.put("checkList42", checkList42);
		}
    	
    	if(checkList43!=null && !checkList43.equals("")) {
    		paramMap.put("checkList43", checkList43);
		}
    	
    	if(checkList44!=null && !checkList44.equals("")) {
    		paramMap.put("checkList44", checkList44);
		}
    	
    	if(checkList45!=null && !checkList45.equals("")) {
    		paramMap.put("checkList45", checkList45);
		}
    	
    	if(checkList46!=null && !checkList46.equals("")) {
    		paramMap.put("checkList46", checkList46);
		}
    	
    	if(evalScore5!=null && !evalScore5.equals("")) {
    		paramMap.put("evalScore5", evalScore5);
		}
    	
    	
		try {
			
				eMAU00J01Service.insertEMAU00J0106(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0107.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0107(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
     	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String checkList47 = (String) map.get("checkList47");
    	String checkList48 = (String) map.get("checkList48");
    	String checkList49 = (String) map.get("checkList49");
    	String checkList50 = (String) map.get("checkList50");
    	String checkList51 = (String) map.get("checkList51");
    	String checkList52 = (String) map.get("checkList52");
    	String checkList53 = (String) map.get("checkList53");
    	String checkList54 = (String) map.get("checkList54");
    	String evalScore6 = (String) map.get("evalScore6");
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
    	if(checkList47!=null && !checkList47.equals("")) {
    		paramMap.put("checkList47", checkList47);
		}
    	
    	if(checkList48!=null && !checkList48.equals("")) {
    		paramMap.put("checkList48", checkList48);
		}
    	
    	if(checkList49!=null && !checkList49.equals("")) {
    		paramMap.put("checkList49", checkList49);
		}
    	if(checkList50!=null && !checkList50.equals("")) {
    		paramMap.put("checkList50", checkList50);
		}
    	if(checkList51!=null && !checkList51.equals("")) {
    		paramMap.put("checkList51", checkList51);
		}
    	
    	if(checkList52!=null && !checkList52.equals("")) {
    		paramMap.put("checkList52", checkList52);
		}
    	if(checkList53!=null && !checkList53.equals("")) {
    		paramMap.put("checkList53", checkList53);
		}
    	if(checkList54!=null && !checkList54.equals("")) {
    		paramMap.put("checkList54", checkList54);
		}
    	
    	if(evalScore6!=null && !evalScore6.equals("")) {
    		paramMap.put("evalScore6", evalScore6);
		}
    	
    	
		try {
			
				eMAU00J01Service.insertEMAU00J0107(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0108.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0108(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
     	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    
    	String checkList1 = (String) map.get("checkList1");
    	String checkList2 = (String) map.get("checkList2");
    	String checkList3 = (String) map.get("checkList3");
    	String checkList4 = (String) map.get("checkList4");
    	String checkList5 = (String) map.get("checkList5");
    	String checkList6 = (String) map.get("checkList6");
    	String evalScore = (String) map.get("evalScore");
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
    	if(checkList1!=null && !checkList1.equals("")) {
    		paramMap.put("checkList1", checkList1);
		}
		
		if(checkList2!=null && !checkList2.equals("")) {
			paramMap.put("checkList2", checkList2);
		}
    	
		if(checkList3!=null && !checkList3.equals("")) {
			paramMap.put("checkList3", checkList3);
		}
		
		if(checkList4!=null && !checkList4.equals("")) {
			paramMap.put("checkList4", checkList4);
		}
		
		if(checkList5!=null && !checkList5.equals("")) {
			paramMap.put("checkList5", checkList5);
		}
		
		if(checkList6!=null && !checkList6.equals("")) {
			paramMap.put("checkList6", checkList6);
		}
		
		
		if(evalScore!=null && !evalScore.equals("")) {
			paramMap.put("evalScore", evalScore);
		}
    	
		try {
			
				eMAU00J01Service.insertEMAU00J0108(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0109.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0109(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String coPk = (String) map.get("coPk");
    	String buPk = (String) map.get("buPk");
    	String checkList7 = (String) map.get("checkList7");
    	String checkList8 = (String) map.get("checkList8");
    	String checkList9 = (String) map.get("checkList9");
    	String checkList10 = (String) map.get("checkList10");
    	String checkList11 = (String) map.get("checkList11");
    	String checkList12 = (String) map.get("checkList12");
    	String checkList13 = (String) map.get("checkList13");
    	String checkList14 = (String) map.get("checkList14");
    	String checkList15 = (String) map.get("checkList15");
    	String checkList16 = (String) map.get("checkList16");
    	String checkList17 = (String) map.get("checkList17");
    	String checkList18 = (String) map.get("checkList18");
    	String checkList19 = (String) map.get("checkList19");
    	String evalScore2 = (String) map.get("evalScore2");
    	System.out.println(param);
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
		if(checkList7!=null && !checkList7.equals("")) {
			paramMap.put("checkList7", checkList7);
		}
		
		if(checkList8!=null && !checkList8.equals("")) {
			paramMap.put("checkList8", checkList8);
		}
    	
		if(checkList9!=null && !checkList9.equals("")) {
			paramMap.put("checkList9", checkList9);
		}
		
		if(checkList10!=null && !checkList10.equals("")) {
			paramMap.put("checkList10", checkList10);
		}
		
		if(checkList11!=null && !checkList11.equals("")) {
			paramMap.put("checkList11", checkList11);
		}
		
		if(checkList12!=null && !checkList12.equals("")) {
			paramMap.put("checkList12", checkList12);
		}
		
		if(checkList13!=null && !checkList13.equals("")) {
			paramMap.put("checkList13", checkList13);
		}
		
		if(checkList14!=null && !checkList14.equals("")) {
			paramMap.put("checkList14", checkList14);
		}
		
		if(checkList15!=null && !checkList15.equals("")) {
			paramMap.put("checkList15", checkList15);
		}
		
		if(checkList16!=null && !checkList16.equals("")) {
			paramMap.put("checkList16", checkList16);
		}
		
		if(checkList17!=null && !checkList17.equals("")) {
			paramMap.put("checkList17", checkList17);
		}
    	
		if(checkList18!=null && !checkList18.equals("")) {
			paramMap.put("checkList18", checkList18);
		}
		
		if(checkList19!=null && !checkList19.equals("")) {
			paramMap.put("checkList19", checkList19);
		}
		
		if(evalScore2!=null && !evalScore2.equals("")) {
			paramMap.put("evalScore2", evalScore2);
		}
		
		try {
			
				eMAU00J01Service.insertEMAU00J0109(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0110.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0110(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	
    	String checkList20 = (String) map.get("checkList20");
    	String checkList21 = (String) map.get("checkList21");
    	String checkList22 = (String) map.get("checkList22");
    	String checkList23 = (String) map.get("checkList23");
    	String checkList24 = (String) map.get("checkList24");
    	String checkList25 = (String) map.get("checkList25");
    	String checkList26 = (String) map.get("checkList26");
    	String evalScore3 = (String) map.get("evalScore3");
    	System.out.println(param);
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
		
		
		if(checkList20!=null && !checkList20.equals("")) {
			paramMap.put("checkList20", checkList20);
		}
		
		if(checkList21!=null && !checkList21.equals("")) {
			paramMap.put("checkList21", checkList21);
		}
		
		if(checkList22!=null && !checkList22.equals("")) {
			paramMap.put("checkList22", checkList22);
		}
		
		if(checkList23!=null && !checkList23.equals("")) {
    		paramMap.put("checkList23", checkList23);
		}
    	
		if(checkList24!=null && !checkList24.equals("")) {
			paramMap.put("checkList24", checkList24);
		}
		
		if(checkList25!=null && !checkList25.equals("")) {
			paramMap.put("checkList25", checkList25);
		}
		
		if(checkList26!=null && !checkList26.equals("")) {
			paramMap.put("checkList26", checkList26);
		}
		
		if(evalScore3!=null && !evalScore3.equals("")) {
			paramMap.put("evalScore3", evalScore3);
		}
		
		try {
			
				eMAU00J01Service.insertEMAU00J0110(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0111.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0111(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	
    	
    	String checkList27 = (String) map.get("checkList27");
    	String checkList28 = (String) map.get("checkList28");
    	String checkList29 = (String) map.get("checkList29");
    	String checkList30 = (String) map.get("checkList30");
    	String checkList31 = (String) map.get("checkList31");
    	String evalScore4 = (String) map.get("evalScore4");
    	String checkList32 = (String) map.get("checkList32");
    	String checkList33 = (String) map.get("checkList33");
    	String checkList34 = (String) map.get("checkList34");
    	String checkList35 = (String) map.get("checkList35");
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
    	
    	
		if(checkList27!=null && !checkList27.equals("")) {
			paramMap.put("checkList27", checkList27);
		}
		
		if(checkList28!=null && !checkList28.equals("")) {
			paramMap.put("checkList28", checkList28);
		}
		
		if(checkList29!=null && !checkList29.equals("")) {
			paramMap.put("checkList29", checkList29);
		}
		
		if(checkList30!=null && !checkList30.equals("")) {
			paramMap.put("checkList30", checkList30);
		}
		
		if(checkList31!=null && !checkList31.equals("")) {
			paramMap.put("checkList31", checkList31);
		}
		
		if(checkList32!=null && !checkList32.equals("")) {
			paramMap.put("checkList32", checkList32);
		}
		
		if(checkList33!=null && !checkList33.equals("")) {
			paramMap.put("checkList33", checkList33);
		}
		
		if(checkList34!=null && !checkList34.equals("")) {
			paramMap.put("checkList34", checkList34);
		}
    	
		if(checkList35!=null && !checkList35.equals("")) {
			paramMap.put("checkList35", checkList35);
		}
		
		if(evalScore4!=null && !evalScore4.equals("")) {
			paramMap.put("evalScore4", evalScore4);
		}
		
		try {
			
				eMAU00J01Service.insertEMAU00J0111(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0112.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0112(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String coPk = (String) map.get("coPk");
    	String buPk = (String) map.get("buPk");
    	
    	String checkList36 = (String) map.get("checkList36");
    	String checkList37 = (String) map.get("checkList37");
    	String checkList38 = (String) map.get("checkList38");
    	String checkList39 = (String) map.get("checkList39");
    	String checkList40 = (String) map.get("checkList40");
    	String checkList41 = (String) map.get("checkList41");
    	String evalScore5 = (String) map.get("evalScore5");
    	System.out.println(map);
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
		
		
		if(checkList36!=null && !checkList36.equals("")) {
			paramMap.put("checkList36", checkList36);
		}
		
		if(checkList37!=null && !checkList37.equals("")) {
			paramMap.put("checkList37", checkList37);
		}
		if(checkList38!=null && !checkList38.equals("")) {
			paramMap.put("checkList38", checkList38);
		}
		if(checkList39!=null && !checkList39.equals("")) {
			paramMap.put("checkList39", checkList39);
		}
		if(checkList40!=null && !checkList40.equals("")) {
			paramMap.put("checkList40", checkList40);
		}
		if(checkList41!=null && !checkList41.equals("")) {
			paramMap.put("checkList41", checkList41);
		}
		
		if(evalScore5!=null && !evalScore5.equals("")) {
			paramMap.put("evalScore5",evalScore5);
		}
		
		try {
			
				eMAU00J01Service.insertEMAU00J0112(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
    /**
	 * 지능형평가모델 > 심층평가 > 창의도전성
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0113.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0113(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String checkList1 = (String) map.get("checkList1");
    	String checkList2 = (String) map.get("checkList2");
    	String checkList3 = (String) map.get("checkList3");
    	String checkList4 = (String) map.get("checkList4");
    	String checkList5 = (String) map.get("checkList5");
    	String checkList6 = (String) map.get("checkList6");
    	String checkList7 = (String) map.get("checkList7");
    	String checkList8 = (String) map.get("checkList8");
    	String checkList9 = (String) map.get("checkList9");
    	String evalScore = (String) map.get("evalScore");
    	System.out.println(param);
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
		if(checkList1!=null && !checkList1.equals("")) {
			paramMap.put("checkList1",checkList1);
		}
		
		if(checkList2!=null && !checkList2.equals("")) {
			paramMap.put("checkList2",checkList2);
		}
		
		if(checkList3!=null && !checkList3.equals("")) {
			paramMap.put("checkList3",checkList3);
		}
    	
		if(checkList4!=null && !checkList4.equals("")) {
			paramMap.put("checkList4",checkList4);
		}
		
		if(checkList5!=null && !checkList5.equals("")) {
			paramMap.put("checkList5",checkList5);
		}
		
		if(checkList6!=null && !checkList6.equals("")) {
			paramMap.put("checkList6",checkList6);
		}
		
		if(checkList7!=null && !checkList7.equals("")) {
			paramMap.put("checkList7",checkList7);
		}
		
		if(checkList8!=null && !checkList8.equals("")) {
			paramMap.put("checkList8",checkList8);
		}
		
		if(checkList9!=null && !checkList9.equals("")) {
			paramMap.put("checkList9",checkList9);
		}
		
		if(evalScore!=null && !evalScore.equals("")) {
			paramMap.put("evalScore",evalScore);
		}
		
		try {
			
				eMAU00J01Service.insertEMAU00J0113(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
    
	/**
	 * 지능형평가모델 > 심층평가 > 산업별특화지표
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo PolicyConformVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/EMAU00J01/insertEMAU00J0114.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertEMAU00J0114(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
     	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String coPk = (String) map.get("coPk");
    	String buPk = (String) map.get("buPk");
    	String checkList10 = (String) map.get("checkList10");
    	String checkList11 = (String) map.get("checkList11");
    	String checkList12 = (String) map.get("checkList12");
    	String evalScore2 = (String) map.get("evalScore2");
    	System.out.println(param);
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	
    	//paramMap.put("coPk", 1);
    	//paramMap.put("buPk", 1)
		if(checkList10!=null && !checkList10.equals("")) {
			paramMap.put("checkList10",checkList10);
		}
		
		paramMap.put("checkList11",checkList11);
		
		if(checkList12!=null && !checkList12.equals("")) {
			paramMap.put("checkList12",checkList12);
		}
		
		if(evalScore2!=null && !evalScore2.equals("")) {
			paramMap.put("evalScore2",evalScore2);
		}
    	
		
		try {
			
				eMAU00J01Service.insertEMAU00J0114(paramMap);
				
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 
		
		
		return mav;
	}
}