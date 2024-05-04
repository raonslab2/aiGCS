package egovframework.or.kr.EMAU00B.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.or.kr.EMAU00A.service.DashboardVO;
import egovframework.or.kr.EMAU00B.service.EMAU00B01Service;
import egovframework.or.kr.EMAU00B.service.EmpjPsVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.or.kr.com.utill.EmpiUserDetailsHelper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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
public class EMAU00B01Controller {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovFileMngUtil.class);
	
	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00B01Service")
    private EMAU00B01Service eMAU00B01Service;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
 

	/**
	 * Schedule - year
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/schedule/eMAU00B01Main.do")
	public String eMAU00B01Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/schedule/schedule01Page";
	} 
	
   
	@RequestMapping(value = "/empo/schedule/eMAU00B01MainList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00B01MainList(@RequestParam Map<String, Object> param,HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		EmpjVO vo = new EmpjVO();
		String pjYear = (String) param.get("pjYear");
		String pjMonthday = (String) param.get("pjMonthday");
		String grMCode = user.getGrmCode();
		
		vo.setPjYear(pjYear);
		
		//접속사용자
		vo.setMbCode(user.getMbCode());
		vo.setGrMCode(grMCode);
		
		List<EmpjVO> list = null;
		
		try {
			list = eMAU00B01Service.selectPjList(vo);  
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		/*
		
		//각각 세부 공고 상세정보
		int tmNum = list.size(); 
		
		String busiYy;
		String nrmBuclCd;
		String busiNm;
		String brdnBusiNm;
		String bbrdnBusiNm;
		
		for (int i = 0; i < tmNum; i++) {
			busiYy = list.get(i).getBusiYy(); 
			nrmBuclCd  = list.get(i).getNrmBuclCd();
			busiNm  = list.get(i).getBusiNm();
			brdnBusiNm = list.get(i).getBrdnBusiNm();
			bbrdnBusiNm = list.get(i).getBbrdnBusiNm();
			
			EmpjVO element = new EmpjVO(); 
			
			
			EmpjPsVO vo2 = new EmpjPsVO();  
			vo2.setBusiYy(busiYy);
			vo2.setPjYmd(busiYy);
			vo2.setBbrdnBusiNm(bbrdnBusiNm);
			vo2.setMbCode(user.getMbCode());
			vo2.setGrMcode(user.getGrmCode()); 
			
			int empjPsListCnt = eMAU00B01Service.selectPjPsListCnt(vo2);
			
			List<EmpjPsVO> empjPsList =empjPsList(vo2); 			
			if(empjPsList!=null) { 
				element.setEmpjPsList(empjPsList);   
			} 
			
			element.setBusiYy(busiYy);
			element.setNrmBuclCd(nrmBuclCd);
			element.setBusiNm(busiNm);
			element.setBrdnBusiNm(brdnBusiNm);
			element.setBbrdnBusiNm(bbrdnBusiNm);
			element.setEmpjPsListCnt(empjPsListCnt);
			
			list.set(i, element);
		} 
		*/
		mav.addObject("list", list);  
		return mav;
	}
 
	@RequestMapping(value = "/empo/schedule/eMAU00B01EmPjList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00B01EmPjList(@RequestParam Map<String, Object> param,HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		ModelAndView mav = new ModelAndView("jsonView");
		
		String busiYy = (String) map.get("busiYy");		
		String pmMonth = (String) map.get("pmMonth");		
		String bbrdnBusiNm = (String) map.get("bbrdnBusiNm");
		String mbCode = user.getMbCode();
		
		String grMcode = user.getGrmCode();
		
		List<EmpjPsVO> list = null;
		
		EmpjPsVO vo = new EmpjPsVO();  
		vo.setBbrdnBusiNm(bbrdnBusiNm);
		vo.setBusiYy(busiYy);
		vo.setGrMcode(grMcode);
		vo.setPmMonth(pmMonth);
		vo.setMbCode(mbCode);
		 
		  
		try {
			list = eMAU00B01Service.selectPjPsList(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		 
		mav.addObject("list", list);  
		return mav;
	}
	 
	
	private List<EmpjPsVO> empjPsList(EmpjPsVO vo){  
	 
		List<EmpjPsVO> list = null;
  
		try {
			list = eMAU00B01Service.selectPjPsList(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LOGGER.debug("EmpjPsVO: {}",list.size());
	 
		return list;
	}
	
	@RequestMapping(value = "/empo/schedule/eMAU00B01DetailList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00B01DetailList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		EmpjPsVO vo = new EmpjPsVO();
		String pjCode = (String) param.get("pjCode");
		vo.setPjCode(pjCode);
	 
		List<EmpjPsVO> list = null;
  
		try {
			list = eMAU00B01Service.selectPjPsList(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LOGGER.debug("EmpjPsVO: {}",list.size());
		mav.addObject("list", list);
		
		return mav;
	}
	
	
	/**
	 * Schedule - month
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/schedule/eMAU00B02Main.do")
	public String eMAU00B02Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule02Page";
	} 
	
	
	@RequestMapping(value = "/empo/schedule/selectMonthList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectMonthList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		DashboardVO vo = new DashboardVO();
		String searchMonth = (String) map.get("searchMonth"); 
		
		
		if(searchMonth !=null && searchMonth != "") {
			vo.setSearchMonth(searchMonth);
		}
		vo.setMbCode(user.getMbCode());
		 
		List<DashboardVO> list = null;
		
		try {
			if(searchMonth != null && !searchMonth.equals("")  ) {
				list = eMAU00B01Service.selectMonthList(vo);
			}  
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LOGGER.debug("eMAU00B01Service: {}",list);
		mav.addObject("list", list);
		

		
		return mav;
	}
	
	/**
	 * Schedule - week
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/schedule/eMAU00B03Main.do")
	public String eMAU00B03Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
   
		return "main/schedule/schedule03Page";
	} 
	
	
	/**
	 * 월간 카렌다
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/schedule/eMAU00B041Main.do")
	public String eMAU00B041Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
   
		return "main/schedule/schedule04Page";
	} 
	
	
	@RequestMapping(value = "/empo/schedule/eMAU00B041Month.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00B041Month(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String tmMonth = (String) map.get("searchMonth");
		
		String[] arryVal = tmMonth.split(" ");
		String searchYear = arryVal[1];
		String searchMonth = arryVal[0].replaceAll("월", "");
		int tmttddddd = Integer.parseInt(searchMonth);
		String tmttt = "";
		if(tmttddddd<10) {
			tmttt = "0";
			tmttt =  tmttt.concat(Integer.toString(tmttddddd));
		}else {
			tmttt = Integer.toString(tmttddddd);
		}
		
		String searchData = arryVal[1]+""+tmttt;
 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		if(searchData !=null && searchData != "") {
			paramMap.put("searchData", searchData);
		} 
		
		
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		
		List<DashboardVO> list = null;
		 
		DashboardVO dashboardVO; 
	 
		try {
			list = eMAU00B01Service.selectPjMonthList(paramMap);
			for (int i = 0; i < list.size(); i++) {
				dashboardVO = list.get(i);
				HashMap<String, Object> tmMap = new HashMap<String,Object>();
				tmMap.put("start_date", dashboardVO.getStart_date());
				tmMap.put("end_date", dashboardVO.getEnd_date());
				tmMap.put("text", dashboardVO.getText());
				tmMap.put("subject", dashboardVO.getSubject());
				listMap.add(tmMap);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			//e.printStackTrace();
		}
	 
 

	    
		/*
		HashMap<String, Object> map5 = new HashMap<String,Object>();
		map5.put("start_date", "2021-10-05 09:00");
		map5.put("end_date", "2021-10-05 12:00");
		map5.put("text", "[RPA bot2 완료]");
		map5.put("subject", "english");
		listMap.add(map5);
		
		
		
		HashMap<String, Object> resultMap = null;
		try {
			resultMap = eMAU00001Service.seeSmtechId(vo);
			listMap.add(resultMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
			SELECT DISTINCT
			    T.YMD2 AS PJ_ST
			   ,T.YMD2 AS PJ_ED
			   ,T.PJ_GUBUN
			   ,CONCAT(T.MBR_NM2," (",PJ_GUBUN,")") AS PJ_TEXT   
			FROM VI_EDW_DM_SBJT_EVAL_INTG_PJ T
			WHERE BUSI_YY = '2021'
			 AND YMD2 LIKE '202108%'
			 ORDER BY PJ_ST ASC
		*/
	 
		
	  
		mav.addObject("list", listMap);
		return mav;
	}
	
	
	/**
	 * 그리드
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/schedule/eMAU00B051Main.do")
	public String eMAU00B051Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
   
		return "main/schedule/schedule05Page";
	} 
	
	/*
	@RequestMapping("/empo/schedule/test.do")
	public String test(@ModelAttribute("VO") ComDefaultVO commentVO, ModelMap model) throws Exception {
	    return "test/test";
	}
	*/
 
 
    @RequestMapping(value="/empo/schedule/eMAU00B02Main001.do", method=RequestMethod.POST)
    @ResponseBody
    public ModelAndView eMAU00B02Main001(@RequestParam Map<String,Object> commandMap, ModelMap model
  			,HttpSession session, HttpServletRequest request, HttpServletResponse response) {
     	
    	String testvalue = (String) commandMap.get("test");
    	
		Map<String, String> resultMap = new HashMap<String, String>();
	    
		   
	    resultMap.put("result1", "1");
	    resultMap.put("result2", "2");
	     	
		String challenge = "ddddd";		 
	    
	    ModelAndView modelAndView = new ModelAndView("jsonView",resultMap);
	    modelAndView.addObject("result",challenge);
	    modelAndView.addObject("option","test");
	    return modelAndView;
    }
    
    @RequestMapping(value = "/empo/schedule/scheduleInsertPopup.do")
	public String eMAU00C02USERPOPUP(HttpServletRequest request, ModelMap model)
	  throws Exception{ 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		} 
 
		return "main/schedule/scheduleInsertPopup";
	}
    
    @RequestMapping(value = "/empo/schedule/scheduleSave.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView scheduleInsert(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("mbCode", user.getMbCode());
		
		String noPk = (String) map.get("noPk");
		String noInDay = (String) map.get("noInDay");
		String noTitle = (String) map.get("noTitle");
		String noText = (String) map.get("noText");
		String noEtc = (String) map.get("noEtc");
		String mode = (String) map.get("mode");
		
		if(noPk !=null && noPk != "") {
			paramMap.put("noPk", noPk);
		}
		
		if(noInDay !=null && noInDay != "") {
			paramMap.put("noInDay", noInDay);
		}
		
		if(noTitle !=null && noTitle != "") {
			paramMap.put("noTitle", noTitle);
		}
		
		if(noText !=null && noText != "") {
			paramMap.put("noText", noText);
		}
		
		if(noEtc !=null && noEtc != "") {
			paramMap.put("noEtc", noEtc);
		}
		
		int result = 0;
		HashMap<String, Object> resultMap = null;
		try {
			if (mode.equals("insert")) {
				result = eMAU00B01Service.scheduleInsert(paramMap);
				paramMap.put("noPk", result);
				resultMap = eMAU00B01Service.newScheduleDetail(paramMap);
				resultMap.put("mode", "insert");
			} else {
				result = eMAU00B01Service.scheduleUpdate(paramMap);
				resultMap = eMAU00B01Service.newScheduleDetail(paramMap);
				resultMap.put("mode", "edit");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		mav.addObject("list", resultMap);
		
		return mav;
	}
    
    @RequestMapping(value = "/empo/schedule/scheduleDetail.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView scheduleDetail(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String noPk = String.valueOf(map.get("noPk")); 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		if(noPk !=null && noPk != "") {
			paramMap.put("noPk", noPk);
		}
		
		System.out.println(paramMap);
		
		HashMap<String, Object> resultMap = null;
		try {
			resultMap = eMAU00B01Service.newScheduleDetail(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		mav.addObject("list", resultMap);
		
		return mav;
	}
    
    @RequestMapping(value = "/empo/schedule/scheduleDelete.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView scheduleDelete(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String noPk = String.valueOf(map.get("noPk")); 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		if(noPk !=null && noPk != "") {
			paramMap.put("noPk", noPk);
		}
		
		System.out.println(paramMap);
		
		int result = 0;
		try {
			result = eMAU00B01Service.scheduleDelete(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("a");
		return mav;
	}
    
    @RequestMapping(value = "/empo/schedule/scheduleWeekList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView scheduleWeekList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		String searchDate1 = (String) map.get("searchDate1");
		String searchDate2 = (String) map.get("searchDate2");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(searchDate1 !=null && searchDate1 != "") {
			paramMap.put("searchDate1", searchDate1);
		}
		
		if(searchDate2 !=null && searchDate2 != "") {
			paramMap.put("searchDate2", searchDate2);
		}
		
		paramMap.put("mbCode", user.getMbCode());
		
		List<DashboardVO> list = null;
		try {
			list = eMAU00B01Service.scheduleWeekList(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", list);
		return mav;
	}
    
    /**
	 * Schedule - month
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/schedule/eMAU00B04Main.do")
	public String eMAU00B04Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_work2";
	} 
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05Main.do")
	public String eMAU00B05Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_work";
	} 
	
	/*
	 * 
	 */
	@RequestMapping(value = "/empo/schedule/eMAU00B05Main3.do")
	public String eMAU00B05Main2(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_work3";
	} 
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05MainFinal.do")
	public String eMAU00B05MainFinal(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_workFinal";
	} 
	
	@RequestMapping(value = "/empo/schedule/finalProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView finalProjectList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
		System.out.println(map);
		
		//검색조건, 사업명 or 사업부서
		String searchYear = (String) map.get("searchYear"); 
		
		//검색조건, 사업명 or 사업부서  ==> 검색명
		String searchName = (String) map.get("searchName"); 
		
		String page = String.valueOf(map.get("page"));
		
		//파라미터 수신데이터
		EmpjVO vo = new EmpjVO();
		
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//수신데이터 검증 , (사업년도)
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		List<EmpjVO> list = null;
		int resultCnt = 0;
		try { 
			list = eMAU00B01Service.finalProjectList(vo); 
			resultCnt = eMAU00B01Service.finalProjectListCnt(vo);
			
			paginationInfo.setTotalRecordCount(resultCnt);
 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		mav.addObject("list", list);
		mav.addObject("paginationInfo", paginationInfo);

		return mav;
	}
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05MainSE.do")
	public String eMAU00B05MainSE(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_workSE";
	} 
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05MainDAE.do")
	public String eMAU00B05MainDAE(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_workDAE";
	} 
	
	@RequestMapping(value = "/empo/schedule/seProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView seProjectList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
		System.out.println(map);
		
		//검색조건, 사업명 or 사업부서
		String searchYear = (String) map.get("searchYear"); 
		
		//검색조건, 사업명 or 사업부서  ==> 검색명
		String searchName = (String) map.get("searchName"); 
		
		String page = String.valueOf(map.get("page"));
		
		//파라미터 수신데이터
		EmpjVO vo = new EmpjVO();
		
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//수신데이터 검증 , (사업년도)
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		List<EmpjVO> list = null;
		int resultCnt = 0;
		try { 
			list = eMAU00B01Service.seProjectList(vo); 
			resultCnt = eMAU00B01Service.seProjectListCnt(vo);
			
			paginationInfo.setTotalRecordCount(resultCnt);
 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		mav.addObject("list", list);
		mav.addObject("paginationInfo", paginationInfo);

		return mav;
	}
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05MainApplication.do")
	public String eMAU00B05MainApplication(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_workApplication";
	} 
	
	@RequestMapping(value = "/empo/schedule/ApplicationProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView ApplicationProjectList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
		System.out.println(map);
		
		//검색조건, 사업명 or 사업부서
		String searchYear = (String) map.get("searchYear"); 
		
		//검색조건, 사업명 or 사업부서  ==> 검색명
		String searchName = (String) map.get("searchName"); 
		
		String page = String.valueOf(map.get("page"));
		
		//파라미터 수신데이터
		EmpjVO vo = new EmpjVO();
		
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//수신데이터 검증 , (사업년도)
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		List<EmpjVO> list = null;
		int resultCnt = 0;
		try { 
			list = eMAU00B01Service.applicationProjectList(vo); 
			resultCnt = eMAU00B01Service.applicationProjectListCnt(vo);
			
			paginationInfo.setTotalRecordCount(resultCnt);
 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		mav.addObject("list", list);
		mav.addObject("paginationInfo", paginationInfo);

		return mav;
	}
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05MainSpec.do")
	public String eMAU00B05MainSpec(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_workSpec";
	} 
	
	@RequestMapping(value = "/empo/schedule/specProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView specProjectList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
		System.out.println(map);
		
		//검색조건, 사업명 or 사업부서
		String searchYear = (String) map.get("searchYear"); 
		
		//검색조건, 사업명 or 사업부서  ==> 검색명
		String searchName = (String) map.get("searchName"); 
		
		String page = String.valueOf(map.get("page"));
		
		//파라미터 수신데이터
		EmpjVO vo = new EmpjVO();
		
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//수신데이터 검증 , (사업년도)
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		List<EmpjVO> list = null;
		int resultCnt = 0;
		try { 
			list = eMAU00B01Service.specProjectList(vo); 
			resultCnt = eMAU00B01Service.specProjectListCnt(vo);
			
			paginationInfo.setTotalRecordCount(resultCnt);
 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		mav.addObject("list", list);
		mav.addObject("paginationInfo", paginationInfo);

		return mav;
	}
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05MainReport.do")
	public String eMAU00B05MainReport(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_workReport";
	} 
	
	@RequestMapping(value = "/empo/schedule/reportProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView reportProjectList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
		System.out.println(map);
		
		//검색조건, 사업명 or 사업부서
		String searchYear = (String) map.get("searchYear"); 
		
		//검색조건, 사업명 or 사업부서  ==> 검색명
		String searchName = (String) map.get("searchName"); 
		
		String page = String.valueOf(map.get("page"));
		
		//파라미터 수신데이터
		EmpjVO vo = new EmpjVO();
		
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//수신데이터 검증 , (사업년도)
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		List<EmpjVO> list = null;
		int resultCnt = 0;
		try { 
			list = eMAU00B01Service.reportProjectList(vo); 
			resultCnt = eMAU00B01Service.reportProjectListCnt(vo);
			
			paginationInfo.setTotalRecordCount(resultCnt);
 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		mav.addObject("list", list);
		mav.addObject("paginationInfo", paginationInfo);

		return mav;
	}
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05MainSEObjection.do")
	public String eMAU00B05MainSEObjection(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_workSEObjection";
	} 
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05MainDAEObjection.do")
	public String eMAU00B05MainDAEObjection(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_workDAEObjection";
	} 
	
	@RequestMapping(value = "/empo/schedule/eMAU00B05MainFinalObjection.do")
	public String eMAU00B05MainFinalObjection(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		 

		return "main/schedule/schedule_workFinalObjection";
	} 
	
	@RequestMapping(value = "/empo/schedule/selectProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectProjectList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
		System.out.println(map);
		
		//검색조건, 사업명 or 사업부서
		String searchYear = (String) map.get("searchYear"); 
		
		//검색조건, 사업명 or 사업부서  ==> 검색명
		String searchName = (String) map.get("searchName"); 
		
		String page = String.valueOf(map.get("page"));
		
		//파라미터 수신데이터
		EmpjVO vo = new EmpjVO();
		
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//수신데이터 검증 , (사업년도)
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		List<EmpjVO> list = null;
		int resultCnt = 0;
		try { 
			list = eMAU00B01Service.selectProjectList(vo); 
			resultCnt = eMAU00B01Service.selectProjectListCnt(vo);
			
			paginationInfo.setTotalRecordCount(resultCnt);
 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		mav.addObject("list", list);
		mav.addObject("paginationInfo", paginationInfo);

		return mav;
	}
	
	/*
	 * 협약체결
	 */
	@RequestMapping(value = "/empo/schedule/selectProjectList2.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectProjectList2(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
	 
		
		//검색조건, 사업명 or 사업부서
		String searchYear = (String) map.get("searchYear"); 
		
		//검색조건, 사업명 or 사업부서  ==> 검색명
		String searchName = (String) map.get("searchName"); 
		
		String page = String.valueOf(map.get("page"));
		
		//파라미터 수신데이터
		EmpjVO vo = new EmpjVO();
		
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//수신데이터 검증 , (사업년도)
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		List<EmpjVO> list = null;
		int resultCnt = 0;
		try { 
			list = eMAU00B01Service.selectProjectList2(vo); 
			resultCnt = eMAU00B01Service.selectProjectListCnt2(vo);
			
			paginationInfo.setTotalRecordCount(resultCnt);
 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		mav.addObject("list", list);
		mav.addObject("paginationInfo", paginationInfo);

		return mav;
	}
	
	
	//엑셀 다운로드
	@RequestMapping(value = "/empo/schedule/excelDownloadList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView excelDownloadList(@RequestBody List<Map<String, Object>> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<Map<String, Object>> receive = param;
		
		System.out.println(receive);
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		List<EmpjVO> list = null;
		List<List<EmpjVO>> result = new ArrayList<>();
		
		try {
			for (int i = 0; i < receive.size(); i++ ) {
				System.out.println(i);

				String ancmId = String.valueOf(receive.get(i).get("ancmId"));
				
				if(ancmId!="null" && ! ancmId.equals("") && ancmId!=null) {
					paramMap.put("ancmId", ancmId);
				}
				
				
				System.out.println(paramMap);
				
				list = eMAU00B01Service.excelDownloadList(paramMap);
				System.out.println(list);
				result.add(list);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
			
		mav.addObject("list", result);
		
		return mav;
	}
}
 
