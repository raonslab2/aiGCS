package egovframework.or.kr.EMAU00C.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00C.service.CommonVO;
import egovframework.or.kr.EMAU00C.service.EMAU00C01Service;
import egovframework.or.kr.EMAU00C.service.EMAU00C01VO;
import egovframework.or.kr.EMAU00C.service.EmPaDiVO;
import egovframework.or.kr.EMAU00E.service.BusinessPjInfVO;
import egovframework.or.kr.EMAU00E.service.EMAU00E01Service;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.or.kr.com.utill.EmpiUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
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
public class EMAU00C01Controller {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovFileMngUtil.class);

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00C01Service")
    private EMAU00C01Service eMAU00C01Service;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
 
	

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00E01Service")
    private EMAU00E01Service eMAU00E01Service;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
 

	/**
	 * 가용자원 - 분과구성 현황
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/eMAU00C01Main.do")
	public String eMAU00C01Main(@ModelAttribute("searchVO") BusinessPjInfVO bdUseVO , HttpServletRequest request, ModelMap model)
	  throws Exception{
		
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "main/login/empilogin";
    	}
    	
    	LOGGER.error("{} : test.", "eMAU00C01Main");
  
	  
		return "main/resources/resources01Page";
	} 
	
	/**
	 * 가용자원 - 분과구성 현황
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/eMAU00C011Main.do")
	public String eMAU00C011Main(@ModelAttribute("searchVO") BusinessPjInfVO bdUseVO , HttpServletRequest request, ModelMap model, @RequestParam Map<String, Object> param)
	  throws Exception{
		
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "main/login/empilogin";
    	}
    	
    	LOGGER.error("{} : test.", "eMAU00C011Main");
    	System.out.println(param);
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String pjCode = (String) map.get("pjCode");
		String pjYear = (String) map.get("pjYear");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjCode!=null && !pjCode.equals("")) {
			paramMap.put("pjCode", pjCode);
		}
		if(pjYear!=null && !pjYear.equals("")) {
			paramMap.put("pjYear", pjYear);
		}
		
		//HashMap<String, Object> resultMap = null;
		//resultMap = eMAU00C01Service.paDataDetail(paramMap);
		
		//model.addAttribute("list", resultMap);
		
		return "main/resources/resources011Page";
	} 
	
	
	@RequestMapping(value = "/empo/resources/eMAU00C01List.do", method = {RequestMethod.POST})
	public @ResponseBody ModelAndView eMAU00C01List(@RequestParam Map<String, Object> commandMap,HttpServletRequest request) {
		
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		EgovMap map = CommUtil.makeEgovMap(commandMap); 
		String searchVuDayStart = (String) map.get("searchVuDayStart");
		String searchVuDayEnd = (String) map.get("searchVuDayEnd");
		String searchVuDiCode = (String) map.get("searchVuDiCode");
		String grMCode = user.getGrmCode();
		
		String page = String.valueOf(map.get("page"));
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		AvailableVO availableVO = new AvailableVO();
		
		if(page !="") {
			int page1 = Integer.parseInt(page);
			availableVO.setPageIndex(page1);
		}
		
		//availableVO.setPageUnit(propertyService.getInt("pageUnit"));
		//availableVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(availableVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(availableVO.getPageUnit());
		paginationInfo.setPageSize(availableVO.getPageSize());

		availableVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		availableVO.setLastIndex(paginationInfo.getLastRecordIndex());
		availableVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		if(searchVuDayStart !="") {
			availableVO.setSearchVuDayStart(searchVuDayStart);
		}
		
		if(searchVuDayEnd !="") {
			availableVO.setSearchVuDayEnd(searchVuDayEnd);
		}
		
		if(searchVuDiCode !="") {
			availableVO.setSearchVuDiCode(searchVuDiCode);
		}
		
		if(grMCode !="") {
			availableVO.setGrMCode(grMCode);
		}
		
		List<AvailableVO> list = null;
		int resultCnt = 0;
		try {
			list = eMAU00C01Service.selectAvailableList(availableVO);
			resultCnt = eMAU00C01Service.selectCount(availableVO);
			
			paginationInfo.setTotalRecordCount(resultCnt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list); 
		mav.addObject("paginationInfo", paginationInfo);
		
		return mav;
	}
	
	/**
	 * 가용자원 - 가용자원 조회_간사
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/eMAU00C02Main.do")
	public String eMAU00C02Main(HttpServletRequest request, ModelMap model)
	  throws Exception{ 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		} 
 
		return "main/resources/resources02Page";
	}
	
	
	/**
	 * 가용자원 - 가용자원 조회_간사 ( 지원여부 확인요청 )
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/eMAU00C0201Main.do")
	public String eMAU00C0201Main(HttpServletRequest request, ModelMap model)
	  throws Exception{ 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		} 
 
		return "main/resources/resources0201Page";
	}
	
	/**
	 * 가용자원 - 가용자원 조회_간사 ( 간사 팝업 )
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/eMAU00C02USERPOPUP.do")
	public String eMAU00C02USERPOPUP(HttpServletRequest request, ModelMap model)
	  throws Exception{ 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		} 
 
		return "main/resources/resources02userpopup";
	}
	
	/**
	 * 가용자원 - 가용자원 조회_간사 ( 간사 팝업 )
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/eMAU00C02DEPTPOPUP.do")
	public String eMAU00C02DEPTPOPUP(HttpServletRequest request, ModelMap model)
	  throws Exception{ 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		} 
 
		return "main/resources/resources02deptpopup";
	}
	
	
	/**
	 * 가용자원 - 가용자원 조회_평가장
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/eMAU00C03Main.do")
	public String eMAU00C03Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		} 
		
//		ModelAndView mav = new ModelAndView("jsonView");
//		AvailableVO availableVO = null;
//		List<AvailableVO> list = eMAU00C01Service.selectAvilableList(availableVO);
// 
//		LOGGER.debug("fnfe: {}", list);
//		
//		mav.addObject("list", list);	 

		return "main/resources/resources03Page";
	}
	
	/**
	 * 가용자원 - 가용자원 조회_평가장 ( 평가장 관리 )
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/eMAU00C03manage.do")
	public String eMAU00C03manage(HttpServletRequest request, ModelMap model)
	  throws Exception{ 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		} 
 
		return "main/resources/resources03manage";
	}
	
	
	/**
	 * 평가구분
	 * EM_PJ_DI_CODE
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/searchEmPjVuCode.do", method = RequestMethod.GET)
	public @ResponseBody ModelAndView searchEmPjVuCode(@RequestParam("searchCode") String searchCode) {
		ModelAndView mav = new ModelAndView("jsonView");

		List<EmPaDiVO> list = null;
		try {
			list = eMAU00C01Service.searchEmPjVuCode(searchCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		LOGGER.debug("searchEmPjVuCode: {}", list);

		mav.addObject("list", list);

		return mav;
	}
	
	
	/**
	 * 평가종류
	 * EM_PJ_DI_CODE
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/searchEmPjDiCode.do", method = RequestMethod.GET)
	public @ResponseBody ModelAndView searchEmPjDiCode() {
		ModelAndView mav = new ModelAndView("jsonView");

		List<EmPaDiVO> list = null;
		try {
			list = eMAU00C01Service.searchEmPjDiCode();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		LOGGER.debug("searchEmPjDiCode: {}", list);

		mav.addObject("list", list);

		return mav;
	}
	
	/**
	 * 권한받은 사업목록
	 * searchUserPjList
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/searchUserPjList.do", method = RequestMethod.GET)
	public @ResponseBody ModelAndView searchUserPjList(@RequestParam("searchCode") String searchCode) {
		ModelAndView mav = new ModelAndView("jsonView");

		List<CommonVO> list = null;
		try {
			//list = eMAU00C01Service.searchUserPjList(searchCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		LOGGER.debug("searchUserPjList: {}", list);

		mav.addObject("list", list);

		return mav;
	}
	
	// ex) 협력사업본부 대외협력기획실
	@RequestMapping(value = "/empo/resources/autocomplete.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView autocomplete(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		 
		List<EmmbgroupVO> list = null;
		try {
			list = eMAU00C01Service.autocomplete(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		
		LOGGER.debug("list: {}", list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/empo/resources/autocomplete2.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView autocomplete2(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EmpjVO> list = null;
		try {
			list = eMAU00C01Service.autocomplete2(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resources/autocomplete3.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView autocomplete3(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EmpjVO> list = null;
		try {
			list = eMAU00C01Service.autocomplete3(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resource/selectAreaList2.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectAreaList2() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<EMAU00C01VO> list = null;
		EMAU00C01VO vo = new EMAU00C01VO();
		
		try {
			list = eMAU00C01Service.selectAreaList2(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resource/selectAreaDetail.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectAreaDetail(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		System.out.println(map);
		
		String addrCode = (String) map.get("addrCode");
		String dateDay = (String) map.get("dateDay");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(addrCode!=null && !addrCode.equals("")) {
			paramMap.put("addrCode", addrCode);
		}
		if(dateDay!=null && !dateDay.equals("")) {
			paramMap.put("dateDay", dateDay);
		}
		
		List<EMAU00C01VO> list = null;
		EMAU00C01VO vo = new EMAU00C01VO();
		
		try {
			list = eMAU00C01Service.selectAreaDetail(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resources/selectAreaCateList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00C01AddrOption() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<EMAU00C01VO> list = null;
		EMAU00C01VO vo = new EMAU00C01VO();
		
		try {
			list = eMAU00C01Service.selectAreaCateList(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		mav.addObject("list", list);

		return mav;
	}
	
	@RequestMapping(value = "/empo/resource/addEvaluation.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView addEvaluation(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EMAU00C01VO> list = null;
		try {
			list = eMAU00C01Service.addEvaluation(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
 
	// 팝업창 세부사업명 호출
	@RequestMapping(value = "/empo/resources/autocomplete4.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView autocomplete4(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EmpjVO> list = null;
		try {
			list = eMAU00C01Service.autocomplete4(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resource/insertUser.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertUser(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EMAU00C01VO> list = null;
		try {
			list = eMAU00C01Service.insertUser(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resource/selectPjUsertList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectPjUsertList(@RequestParam Map<String, Object> param) throws Exception {
		
//		EgovMap map = CommUtil.makeEgovMap(commandMap); 
//		String searchVuDayStart = (String) map.get("searchVuDayStart");
//		String searchVuDayEnd = (String) map.get("searchVuDayEnd");
//		String searchVuDiCode = (String) map.get("searchVuDiCode");
//		String page = String.valueOf(map.get("page"));
//		
//		ModelAndView mav = new ModelAndView("jsonView");
//		
//		AvailableVO availableVO = new AvailableVO();
//		
//		if(page !="") {
//			int page1 = Integer.parseInt(page);
//			availableVO.setPageIndex(page1);
//		}
//		
//		//availableVO.setPageUnit(propertyService.getInt("pageUnit"));
//		//availableVO.setPageSize(propertyService.getInt("pageSize"));
//
//		PaginationInfo paginationInfo = new PaginationInfo();
//		
//		//paginationInfo.setCurrentPageNo(1);
//		paginationInfo.setCurrentPageNo(availableVO.getPageIndex());
//		paginationInfo.setRecordCountPerPage(availableVO.getPageUnit());
//		paginationInfo.setPageSize(availableVO.getPageSize());
//
//		availableVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
//		availableVO.setLastIndex(paginationInfo.getLastRecordIndex());
//		availableVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
//		
//		if(searchVuDayStart !="") {
//			availableVO.setSearchVuDayStart(searchVuDayStart);
//		}
//		
//		if(searchVuDayEnd !="") {
//			availableVO.setSearchVuDayEnd(searchVuDayEnd);
//		}
//		
//		if(searchVuDiCode !="") {
//			availableVO.setSearchVuDiCode(searchVuDiCode);
//		}
//		
//		List<AvailableVO> list = null;
//		int resultCnt = 0;
//		try {
//			list = eMAU00C01Service.selectAvailableList(availableVO);
//			resultCnt = eMAU00C01Service.selectCount(availableVO);
//			
//			paginationInfo.setTotalRecordCount(resultCnt);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println(list);
//
//		mav.addObject("list", list); 
//		mav.addObject("paginationInfo", paginationInfo);
//		
//		return mav;
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		EgovMap map = CommUtil.makeEgovMap(param); 
		String page = String.valueOf(map.get("page"));
		
		String pjYear = String.valueOf(map.get("pjYear"));
		String pjTitle = (String) map.get("pjTitle");
		String date1 = (String) map.get("date1");
		String date2 = (String) map.get("date2");
		String part1 = (String) map.get("part1");
		String part2 = (String) map.get("part2");
		String reqMbName = (String) map.get("reqMbName");
		
		EMAU00C01VO vo = new EMAU00C01VO();
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		//availableVO.setPageUnit(propertyService.getInt("pageUnit"));
		//availableVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjYear!=null && !pjYear.equals("")) {
			vo.setPjYear(pjYear);
		}
		
		if(pjTitle!=null && !pjTitle.equals("")) {
			vo.setPjTitle(pjTitle);
		}
		
		if(date1!=null && !date1.equals("")) {
			vo.setDate1(date1);
		}
		
		if(date2!=null && !date2.equals("")) {
			vo.setDate2(date2);
		}
		
		if(part1!=null && !part1.equals("")) {
			vo.setPart1(part1);
		}
		
		if(part2!=null && !part2.equals("")) {
			vo.setPart2(part2);
		}

		if(reqMbName!=null && !reqMbName.equals("")) {
			vo.setReqMbName(reqMbName);
		}
		
		List<EMAU00C01VO> list = null;
		int resultCnt = 0;
		try {
			list = eMAU00C01Service.selectPjUsertList(vo);
			resultCnt = eMAU00C01Service.selectPjUserCount(vo);
			paginationInfo.setTotalRecordCount(resultCnt);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		mav.addObject("paginationInfo", paginationInfo);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resource/selectAreaList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectAreaList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EMAU00C01VO> list = null;
		try {
			list = eMAU00C01Service.selectAreaList(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}

	@RequestMapping(value = "/empo/resource/selectAreaDetailList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectAreaDetailList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EMAU00C01VO> list = null;
		try {
			list = eMAU00C01Service.selectAreaDetailList(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resource/selectUserList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectUserList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EMAU00C01VO> list = null;
		try {
			list = eMAU00C01Service.selectUserList(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resource/selectWeekUserList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectWeekUserList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EMAU00C01VO> list = null;
		try {
			list = eMAU00C01Service.selectWeekUserList(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	/**
	 * 분과구성 현황 검색 >추가검색
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo BusinessPjInfVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/resources/searchBusinessList.do", method = RequestMethod.POST)
    public @ResponseBody ModelAndView searchBusinessList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{
		
    	ModelAndView mav = new ModelAndView("jsonView");
    	
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String searchYear = (String) map.get("searchYear"); //기준년도	
    	String searchName = (String) map.get("searchName"); //사업명
    	String page = String.valueOf(map.get("page"));
    	
    	AvailableVO availableVO = new AvailableVO();
    	
    	if(page!= null && !page.equals("")) {
			int page1 = Integer.parseInt(page);
			availableVO.setPageIndex(page1);
		}
    	
    	//availableVO.setPageUnit(propertyService.getInt("pageUnit"));
		//availableVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(availableVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(availableVO.getPageUnit());
		paginationInfo.setPageSize(availableVO.getPageSize());

		availableVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		availableVO.setLastIndex(paginationInfo.getLastRecordIndex());
		availableVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    	
    	//기준년도
    	if(searchYear!= null && !searchYear.equals("")) {
    		availableVO.setSearchYear(searchYear);
    		
    	}
    	//사업명
    	if(searchName!= null && !searchName.equals("")) {
    		availableVO.setSearchName(searchName);    		
    	}
    	
    	List<AvailableVO> list = null;
    	
    	int totalCnt = 0;
    	
    	try {
			list = eMAU00C01Service.searchBusinessList(availableVO);
			totalCnt = eMAU00C01Service.selectSearch1Count(availableVO);
			paginationInfo.setTotalRecordCount(totalCnt);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    	mav.addObject("list", list);
    	mav.addObject("totalCnt", totalCnt);
    	mav.addObject("paginationInfo", paginationInfo);
    	
    	return mav;
    }
	
	/**
	 * 분과구성 현황 검색 >추가검색
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo BusinessPjInfVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/resources/searchAddList.do", method = RequestMethod.POST)
    public @ResponseBody ModelAndView searchAddList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String searchYear = (String) map.get("searchYear");  //기준년도	
    	String searchName = (String) map.get("searchName"); //사업명
    	String searchVuDayStart = (String) map.get("searchVuDayStart"); // 평가기간 시작일
    	String searchVuDayEnd = (String) map.get("searchVuDayEnd"); // 평가기간 종료일
    	String searchVuDiCode = (String) map.get("searchVuDiCode"); // 평가종류
    	String page = String.valueOf(map.get("page"));
    	
    	AvailableVO availableVO = new AvailableVO();
    	
    	if(page!= null && !page.equals("")) {
			int page1 = Integer.parseInt(page);
			availableVO.setPageIndex(page1);
		}
    	
    	//availableVO.setPageUnit(propertyService.getInt("pageUnit"));
		//availableVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(availableVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(availableVO.getPageUnit());
		paginationInfo.setPageSize(availableVO.getPageSize());

		availableVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		availableVO.setLastIndex(paginationInfo.getLastRecordIndex());
		availableVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    		
    	//기준년도
    	if(searchYear!= null && !searchYear.equals("")) {
    		availableVO.setSearchYear(searchYear);
    		
    	}
    	//사업명
    	if(searchName!= null && !searchName.equals("")) {
    		availableVO.setSearchName(searchName);    		
    	}
    	
    	//평가기간 시작일
    	if(searchVuDayStart!= null && !searchVuDayStart.equals("")) {
    		availableVO.setSearchVuDayStart(searchVuDayStart);
    	}
    	
    	//평가기간 종료일
    	if(searchVuDayEnd!= null && !searchVuDayEnd.equals("")) {
    		availableVO.setSearchVuDayEnd(searchVuDayEnd);
    	}
    	
    	//평가종류
    	if(searchVuDiCode!= null && !searchVuDiCode.equals("")) {
    		availableVO.setSearchVuDiCode(searchVuDiCode);
    	}
    	
    	List<AvailableVO> list = null;
    	int totalCnt = 0;
    	try {
			list = eMAU00C01Service.searchAddList(availableVO);
			totalCnt = eMAU00C01Service.selectSearch2Count(availableVO);
			paginationInfo.setTotalRecordCount(totalCnt);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    	mav.addObject("list", list);
    	mav.addObject("totalCnt", totalCnt);
    	mav.addObject("paginationInfo", paginationInfo);
    	
    	return mav;
    }
    
    @RequestMapping(value = "/empo/resources/searchBusinessAllList.do", method = RequestMethod.POST)
    public @ResponseBody ModelAndView searchBusinessAllList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{
    	
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	
    	EgovMap map = CommUtil.makeEgovMap(param); 
    	
    	String searchYear = (String) map.get("searchYear");  //기준년도	
    	String searchName = (String) map.get("searchName"); //사업명
    	
    	
    	AvailableVO vo = new AvailableVO();
    	
    	//기준년도
    	if(searchYear!= null && !searchYear.equals("")) {
    		vo.setSearchYear(searchYear);
    		
    	}
    	//사업명
    	if(searchName!= null && !searchName.equals("")) {
    		vo.setSearchName(searchName);    		
    	}
    	
    	List<AvailableVO> list = null;
    	
    	int totalCnt = 0;
    	
    	try {
			list = eMAU00C01Service.searchBusinessAllList(vo);
			totalCnt = list.size();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    	mav.addObject("list", list);
    	mav.addObject("totalCnt", totalCnt);
    	
    	return mav;
    }
    
	/**
	 * 분과구성 현황 > 공통정보 저장
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo BusinessPjInfVO
	 * @param param Map
	 * @exception Exception Exception
	 */
    @RequestMapping(value = "/empo/resources/commonResourceSave.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView commonResourceSave(@RequestParam Map<String, Object> param) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String pjYear = (String) map.get("pjYear");
		String pjCode = (String) map.get("pjCode");
		String vuReCode = (String) map.get("vuReCode");
		String vuDiCode = (String) map.get("vuDiCode");
		String vuDayStart = (String) map.get("vuDayStart");
		String vuDayEnd = (String) map.get("vuDayEnd");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjYear!=null && !pjYear.equals("")) {
			paramMap.put("pjYear", pjYear);
		}
		if(pjCode!=null && !pjCode.equals("")) {
			paramMap.put("pjCode", pjCode);
		}
		if(vuReCode!=null && !vuReCode.equals("")) {
			paramMap.put("vuReCode", vuReCode);
		}
		if(vuDiCode!=null && !vuDiCode.equals("")) {
			paramMap.put("vuDiCode", vuDiCode);
		}
		if(vuDayStart!=null && !vuDayStart.equals("")) {
			paramMap.put("vuDayStart", vuDayStart);
		}
		if(vuDayEnd!=null && !vuDayEnd.equals("")) {
			paramMap.put("vuDayEnd", vuDayEnd);
		}
		
		System.out.println(paramMap);
		
		HashMap<String, Object> isDataPk = null;
		HashMap<String, Object> resultMap = null;
		int result = 0;
		try {
			isDataPk = eMAU00C01Service.isCommonResource(paramMap);
			System.out.println(isDataPk);
			if (isDataPk == null) {
				result = eMAU00C01Service.insertDivision(paramMap);
				paramMap.put("paPk", result);
			} else {
				paramMap.put("paPk", isDataPk.get("paPk"));
				result = eMAU00C01Service.updateDivision(paramMap);
			}
			resultMap = eMAU00C01Service.paDataDetail(paramMap);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		mav.addObject("list", resultMap);
		return mav;
	}
    
    
    
    @RequestMapping(value = "/empo/resource/clickArea.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView clickArea(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EMAU00C01VO> list = null;
		try {
			list = eMAU00C01Service.clickArea(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
    
    /**
	 * 가용자원 - 셀렉트박스 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/resources/searchOption.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F01SearchFirstOption() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		AvailableVO vo = new AvailableVO();
		List<AvailableVO> list = null;
		
		try {
			list = eMAU00C01Service.searchOption(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	@RequestMapping(value = "/empo/resources/searchGrmName.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView searchGrmName(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");

		List<EMAU00C01VO> list = null;
		try {
			list = (List<EMAU00C01VO>) eMAU00C01Service.searchGrmName(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		mav.addObject("list", list);
		
		return mav;
	}
	

	 /**
		 * 가용자원 - 셀렉트박스 
		 * 
		 * @return  정보 Map [key : 항목명]
		 *
		 * @param vo AvailableVO
		 * @exception Exception Exception
		 */
	@RequestMapping(value = "/empo/resources/divisionList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView divisionList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		
		List<AvailableVO> list = null;
		try {
			list = eMAU00C01Service.divisionList(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	@RequestMapping(value = "/empo/resource/possibleStatus.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView possibleStatus(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");

		List<EMAU00C01VO> list = null;
		try {
			list = (List<EMAU00C01VO>) eMAU00C01Service.possibleStatus(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/resources/workRequest.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView workRequest(@RequestBody List<Map<String, Object>> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<Map<String, Object>> receive = param;
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		int result = 0;
		try {
			for (int i = 0; i < receive.size(); i++ ) {
				System.out.println(i);
				String pjYear = String.valueOf(receive.get(i).get("pjYear"));
				String pjCode = (String) receive.get(i).get("pjCode");
				String gsReqMbCode = (String) receive.get(i).get("loginMbCode");
				String reqMbName = (String) receive.get(i).get("loginMbName");
				String gsTxt = (String) receive.get(i).get("gsTxt");
				String pjInDate = (String) receive.get(i).get("pjInDate");
				String pjInMbCode = (String) receive.get(i).get("pjInMbCode");
				String grmCode = (String) receive.get(i).get("grmCode");
				String grpCode = (String) receive.get(i).get("grpCode"); 
				
				if(pjYear!=null && ! pjYear.equals("")) {
					paramMap.put("pjYear", pjYear);
				}
				
				if(pjCode!=null && ! pjCode.equals("")) {
					paramMap.put("pjCode", pjCode);
				}
				
				if(gsReqMbCode!=null && ! gsReqMbCode.equals("")) {
					paramMap.put("gsReqMbCode", gsReqMbCode);
				}
				
				if(reqMbName!=null && ! reqMbName.equals("")) {
					paramMap.put("reqMbName", reqMbName);
				}
				
				if(gsTxt!=null && ! gsTxt.equals("")) {
					paramMap.put("gsTxt", gsTxt);
				}
				
				if(pjInDate!=null && ! pjInDate.equals("")) {
					paramMap.put("pjInDate", pjInDate);
				}
				
				if(pjInMbCode!=null && ! pjInMbCode.equals("")) {
					paramMap.put("pjInMbCode", pjInMbCode);
				}
				
				if(grmCode!=null && ! grmCode.equals("")) {
					paramMap.put("grmCode", grmCode);
				}
				
				if(grpCode!=null && ! grpCode.equals("")) {
					paramMap.put("grpCode", grpCode);
				}
				
				System.out.println(paramMap);
				result = eMAU00C01Service.workRequest(paramMap);
				System.out.println(result);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}

		return mav;
	}
	
	/**
	 * 가용자원 > 분과구성 현황 평가장 검색 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	 @RequestMapping(value = "/empo/resources/searchAreaList.do", method = RequestMethod.POST)
	    public @ResponseBody ModelAndView searchAreaList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{
	    	
	    	// 0.사용자권한 처리
	    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
	    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
	    	}
	    	
	    	ModelAndView mav = new ModelAndView("jsonView");
	    	
	    	EgovMap map = CommUtil.makeEgovMap(param); 
	    	
	    	String searchAreaName = (String) map.get("searchAreaName"); //사업명
	    	
	    	AvailableVO vo = new AvailableVO();
	    	
	    	//사업명
	    	if(searchAreaName!= null && !searchAreaName.equals("")) {
	    		vo.setSearchAreaName(searchAreaName);    		
	    	}
	    	
	    	
	    	List<AvailableVO> list = null;
	    	int totalCnt = 0;
	    	try {
				list = eMAU00C01Service.searchAreaList(vo);
				totalCnt = list.size();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	    	
	    	mav.addObject("list", list);
	    	mav.addObject("totalCnt", totalCnt);
	    	
	    	return mav;
	    }
	 
	 /**
		 * 가용자원 > 분과구성 현황 담당간사 검색 
		 * 
		 * @return  정보 Map [key : 항목명]
		 *
		 * @param vo AvailableVO
		 * @exception Exception Exception
		 */
	 @RequestMapping(value = "/empo/resources/searchMemberList.do", method = RequestMethod.POST)
	    public @ResponseBody ModelAndView searchMemberList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{
	    	
	    	// 0.사용자권한 처리
	    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
	    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
	    	}
	    	
	    	ModelAndView mav = new ModelAndView("jsonView");
	    	
	    	EgovMap map = CommUtil.makeEgovMap(param); 
	    	
	    	String groupPart1 = (String) map.get("groupPart1"); //사업명
	    	String groupPart2 = (String) map.get("groupPart2"); //사업명
	    	String searchMemberName = (String) map.get("searchMemberName"); //사업명
	    	
	    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
			
			if(groupPart1!=null && !groupPart1.equals("")) {
				paramMap.put("groupPart1", groupPart1);
			}
			
			if(groupPart2!=null && !groupPart2.equals("")) {
				paramMap.put("groupPart2", groupPart2);
			}
			
			if(searchMemberName!=null && !searchMemberName.equals("")) {
				paramMap.put("searchName", searchMemberName);
			}
	    			
	    	List<AvailableVO> list = null;
	    	try {
				list = eMAU00C01Service.searchMemberList(paramMap);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	    	
	    	mav.addObject("list", list);
	    	
	    	return mav;
	    }
	 
	 @RequestMapping(value = "/empo/resources/businessInfo.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView businessInfo(@RequestParam Map<String, Object> param) {
			ModelAndView mav = new ModelAndView("jsonView");

			List<EMAU00C01VO> list = null;
			try {
				list = (List<EMAU00C01VO>) eMAU00C01Service.businessInfo(param);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(list);
			mav.addObject("list", list);
			
			return mav;
		}
	 
	 @RequestMapping(value = "/empo/resources/confirmUpdate.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView confirmUpdate(@RequestParam("gsPk[]") List<Integer> param) {
			ModelAndView mav = new ModelAndView("jsonView");
			List<Integer> gsPk = param;
			
			System.out.println(gsPk);
			try {
				for (int id : gsPk) {
					int result = eMAU00C01Service.confirmUpdate(id);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			mav.addObject("status", "완료");
			mav.addObject("confirm", "확정");
			return mav;
		}
	 
	 @RequestMapping(value = "/empo/resources/grmInfo.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView grmInfo() {
			ModelAndView mav = new ModelAndView("jsonView");
			
			EMAU00C01VO vo = new EMAU00C01VO();
			
			List<EMAU00C01VO> list = null;
			
			try {
				list = eMAU00C01Service.grmInfo(vo);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			mav.addObject("list", list);
			return mav;
		}
	 
	 /**
		 * 가용자원 > 투입간사
		 * 
		 * @return  정보 Map [key : 항목명]
		 *
		 * @param vo AvailableVO
		 * @exception Exception Exception
		 */ 
	 @RequestMapping(value = "/empo/resources/memberInfo.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView memberInfo(@RequestParam Map<String, Object> param) {
			ModelAndView mav = new ModelAndView("jsonView");
			
			EgovMap map = CommUtil.makeEgovMap(param); 
			String searchDateSt = (String) map.get("searchDateSt");
			String searchDateEd = (String) map.get("searchDateEd");
			
			EMAU00C01VO vo = new EMAU00C01VO();
			
			if(searchDateSt !="") {
				vo.setSearchDateSt(searchDateSt);
			}
			
			if(searchDateEd !="") {
				vo.setSearchDateEd(searchDateEd);
			}
			
			// searchDateSt
			
			List<EMAU00C01VO> list = null;
			
			try {
				list = eMAU00C01Service.memberInfo(vo);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			mav.addObject("list", list);
			return mav;
		}
	 
	 
	 @RequestMapping(value = "/empo/resource/isDataArea.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView isDataArea(@RequestParam Map<String, Object> param) throws Exception {
			ModelAndView mav = new ModelAndView("jsonView");
			
			EgovMap map = CommUtil.makeEgovMap(param); 
			String addrCode = (String) map.get("addrCode");
			String vuTitle = (String) map.get("vuTitle");
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			
			if(addrCode!=null && !addrCode.equals("")) {
				paramMap.put("addrCode", addrCode);
			}
			
			if(vuTitle!=null && !vuTitle.equals("")) {
				paramMap.put("vuTitle", vuTitle);
			}
			
			int result = 0;
			int lastInsertId = 0;
			List<EMAU00C01VO> list = null;
			
			try {
				result = eMAU00C01Service.isDataArea(paramMap);
				if (result == 0) {
					lastInsertId = eMAU00C01Service.insertArea(paramMap);
					paramMap.put("emVuPk", lastInsertId);
					list = eMAU00C01Service.clickArea(paramMap);
					
					mav.addObject("list", list);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			
			
			mav.addObject("isDataCount", result);
			
			return mav;
		}
	 
		@RequestMapping(value = "/empo/resource/updateArea.do", method = RequestMethod.POST)
		public ModelAndView updateArea(@RequestParam Map<String, Object> param) throws Exception {
			ModelAndView mav = new ModelAndView("jsonView");
			
			System.out.println(param);
			EgovMap map = CommUtil.makeEgovMap(param); 
			
			String emVuPk = (String) map.get("emVuPk");
			String addrCode = (String) map.get("addrCode");
			String vuTitle = (String) map.get("vuTitle");
			String vuUse = (String) map.get("vuUse");
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			
			if(emVuPk!=null && !emVuPk.equals("")) {
				paramMap.put("emVuPk", emVuPk);
			}
			
			if(addrCode!=null && !addrCode.equals("")) {
				paramMap.put("addrCode", addrCode);
			}
			
			if(vuTitle!=null && !vuTitle.equals("")) {
				paramMap.put("vuTitle", vuTitle);
			}
			
			if(vuUse!=null && !vuUse.equals("")) {
				paramMap.put("vuUse", vuUse);
			}
			
			System.out.println(paramMap);
			
			int result = 0;
			int result1 = 0;
			List<EMAU00C01VO> list = null;
			try {
				result = eMAU00C01Service.isDataArea(paramMap);
				if (result == 0) {
					result1 = eMAU00C01Service.updateArea(paramMap);
					list = eMAU00C01Service.clickArea(paramMap);
					
					mav.addObject("list", list);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			mav.addObject("isDataCount", result);
			return mav;

		}
		
		@RequestMapping(value = "/empo/resource/deleteArea.do", method = RequestMethod.POST)
		public ModelAndView deleteArea(@RequestParam("emVuPk[]") List<Integer> param) throws Exception {
			ModelAndView mav = new ModelAndView("jsonView");
			List<Integer> emVuPk = param;
			System.out.println(emVuPk);
			
			try {
				for (int id : emVuPk) {
					int result = eMAU00C01Service.deleteArea(id);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return mav;
		}
		
		@RequestMapping(value = "/empo/resources/areaList.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView areaList() {
			ModelAndView mav = new ModelAndView("jsonView");
			
			EMAU00C01VO vo = new EMAU00C01VO();
			
			List<EMAU00C01VO> list = null;
			
			try {
				list = eMAU00C01Service.areaList(vo);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			mav.addObject("list", list);
			return mav;
		}
		
		@RequestMapping(value = "/empo/resource/paDataDetail.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView paDataDetail(@RequestParam Map<String, Object> param) throws Exception {
			ModelAndView mav = new ModelAndView("jsonView");
			
			System.out.println(param);
			EgovMap map = CommUtil.makeEgovMap(param); 
			
			String pjYear = (String) map.get("pjYear");
			String pjCode = (String) map.get("pjCode");
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			if(pjYear!=null && !pjYear.equals("")) {
				paramMap.put("pjYear", pjYear);
			}
			
			if(pjCode!=null && !pjCode.equals("")) {
				paramMap.put("pjCode", pjCode);
			}
			
			HashMap<String, Object> resultMap = null;
			try {
				resultMap = eMAU00C01Service.paDataDetail(paramMap);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			mav.addObject("list", resultMap);
			return mav;
		}
		
		@RequestMapping(value = "/empo/resource/placeAutocomplete.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView placeAutocomplete(@RequestParam Map<String, Object> param) throws Exception {
			ModelAndView mav = new ModelAndView("jsonView");
			
			System.out.println(param);
			EgovMap map = CommUtil.makeEgovMap(param); 
			
			String emVuTitle = (String) map.get("emVuTitle");
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			if(emVuTitle!=null && !emVuTitle.equals("")) {
				paramMap.put("emVuTitle", emVuTitle);
			}
			
			
			List<AvailableVO> list = null;
			try {
				list = eMAU00C01Service.placeAutocomplete(paramMap);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			mav.addObject("list", list);
			
			return mav;
		}
		
		@RequestMapping(value = "/empo/resource/searchPlaceList.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView searchPlaceList(@RequestParam Map<String, Object> param) throws Exception {
			ModelAndView mav = new ModelAndView("jsonView");
			
			System.out.println(param);
			EgovMap map = CommUtil.makeEgovMap(param); 
			
			String emVuTitle = (String) map.get("emVuTitle");
			String pjCode = (String) map.get("pjCode");
			String pjYear = (String) map.get("pjYear");
			
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			if(emVuTitle!=null && !emVuTitle.equals("")) {
				paramMap.put("emVuTitle", emVuTitle);
			}
			
			if(pjCode!=null && !pjCode.equals("")) {
				paramMap.put("pjCode", pjCode);
			}
			
			if(pjYear!=null && !pjYear.equals("")) {
				paramMap.put("pjYear", pjYear);
			}

			
			
			List<AvailableVO> list = null;
			HashMap<String, Object> data = null;
			
			try {
				list = eMAU00C01Service.searchPlaceList(paramMap);
				System.out.println(list);
				
				data = eMAU00C01Service.paDataDetail(paramMap);
				System.out.println(data);
				paramMap.put("vuDayStart", data.get("vuDayStart"));
				paramMap.put("vuDayEnd", data.get("vuDayEnd"));
				HashMap<String, Object> hasData = null;
				for (AvailableVO index : list) {
					
					paramMap.put("emVuTitle", index.getEmVuTitle());
					hasData = eMAU00C01Service.placeIsUse(paramMap);
					if (hasData != null) {
						index.setPjState("0");
					} else {
						index.setPjState("1");
					}
				}
				
//				data = eMAU00C01Service.paDataDetail(paramMap);
//				System.out.println(data);
//				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			mav.addObject("list", list);
			
			return mav;
		}
		
		
		@RequestMapping(value = "/empo/resource/placeSave.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView placeSave(@RequestBody List<Map<String, Object>> param) {
			ModelAndView mav = new ModelAndView("jsonView");
			
			List<Map<String, Object>> receive = param;
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			int result = 0;
			try {
				String firstPaPk = String.valueOf(receive.get(0).get("paPk"));
				String firstPjYear = String.valueOf(receive.get(0).get("pjYear"));
				String firstPjCode = (String) receive.get(0).get("pjCode");
				
				if(firstPaPk!=null && ! firstPaPk.equals("")) {
					paramMap.put("paPk", firstPaPk);
				}
				
				if(firstPjYear!=null && ! firstPjYear.equals("")) {
					paramMap.put("pjYear", firstPjYear);
				}
				
				if(firstPjCode!=null && ! firstPjCode.equals("")) {
					paramMap.put("pjCode", firstPjCode);
				}
				result = eMAU00C01Service.placeDelete(paramMap);
				
				for (int i = 0; i < receive.size(); i++ ) {
					//String paPk = String.valueOf(receive.get(i).get("paPk"));
					String paPk = String.valueOf(receive.get(i).get("paPk"));
					String pjYear = String.valueOf(receive.get(i).get("pjYear"));
					String pjCode = (String) receive.get(i).get("pjCode");
					String emVuPk = (String) receive.get(i).get("emVuPk");
					String emVuTitle = (String) receive.get(i).get("emVuTitle");
					String paUseDay = (String) receive.get(i).get("paUseDay");
					
					if(paPk!=null && ! paPk.equals("")) {
						paramMap.put("paPk", paPk);
					}
					
					if(pjYear!=null && ! pjYear.equals("")) {
						paramMap.put("pjYear", pjYear);
					}
					
					if(pjCode!=null && ! pjCode.equals("")) {
						paramMap.put("pjCode", pjCode);
					}
					
					if(emVuPk!=null && ! emVuPk.equals("")) {
						paramMap.put("emVuPk", emVuPk);
					}
					
					if(emVuTitle!=null && ! emVuTitle.equals("")) {
						paramMap.put("emVuTitle", emVuTitle);
					}
					
					if(paUseDay!=null && ! paUseDay.equals("")) {
						paramMap.put("paUseDay", paUseDay);
					}
					
					System.out.println(paramMap);
					
					result = eMAU00C01Service.placeSave(paramMap);
					System.out.println(result);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}

			return mav;
		}
		
		@RequestMapping(value = "/empo/resource/memberSave.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView memberSave(@RequestParam Map<String, Object> param) {
			ModelAndView mav = new ModelAndView("jsonView");
			
			EgovMap map = CommUtil.makeEgovMap(param); 
			
			String paPk = String.valueOf(map.get("paPk"));
			String mbCode = (String) map.get("mbCode");
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			if(paPk!=null && !paPk.equals("")) {
				paramMap.put("paPk", paPk);
			}
			
			if(mbCode!=null && !mbCode.equals("")) {
				paramMap.put("mbCode", mbCode);
			}
			
			System.out.println(paramMap);
			int result = 0;
			try {
				result = eMAU00C01Service.memberSave(paramMap);
			} catch (Exception e) {
				// TODO: handle exception
				e.getMessage();
			}

			return mav;
		}
		
		@RequestMapping(value = "/empo/resource/coCateSave.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView coCateSave(@RequestBody List<Map<String, Object>> param) {
			ModelAndView mav = new ModelAndView("jsonView");
			
			List<Map<String, Object>> receive = param;
			
			System.out.println(receive);
			int result1 = 0;
			int result2 = 0;
			List<AvailableVO> list = null;
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			try {
				String datapaPk = String.valueOf(receive.get(0).get("paPk"));
				if(datapaPk!=null && ! datapaPk.equals("")) {
					paramMap.put("paPk", datapaPk);
				}
				
				result1 = eMAU00C01Service.coCateDelete(paramMap);
				
				for (int i = 0; i < receive.size(); i++ ) {
					System.out.println(i);
					String paPk = String.valueOf(receive.get(i).get("paPk"));
					String coCateCode = String.valueOf(receive.get(i).get("coCateCode"));
					if(paPk!=null && ! paPk.equals("")) {
						paramMap.put("paPk", paPk);
					}
					
					if(coCateCode!=null && ! coCateCode.equals("")) {
						paramMap.put("coCateCode", coCateCode);
					}
					
					System.out.println(paramMap);
					
					result2 = eMAU00C01Service.coCateInsert(paramMap);
				}
				
				list = eMAU00C01Service.coCateDetail(paramMap);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			mav.addObject("list", list);
			return mav;
		}
		
		@RequestMapping(value = "/empo/resource/coCateDetail.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView coCateDetail(@RequestParam Map<String, Object> param) {
			ModelAndView mav = new ModelAndView("jsonView");
			
			EgovMap map = CommUtil.makeEgovMap(param); 
			
			String paPk = String.valueOf(map.get("paPk"));
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			if(paPk!=null && !paPk.equals("")) {
				paramMap.put("paPk", paPk);
			}
			
			List<AvailableVO> list = null;
			try {
				list = eMAU00C01Service.coCateDetail(paramMap);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			mav.addObject("list", list);
			return mav;
		}
		
		@RequestMapping(value = "/empo/resource/isUsePlace.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView isUsePlace(@RequestBody List<Map<String, Object>> param) {
			ModelAndView mav = new ModelAndView("jsonView");
			
			List<Map<String, Object>> receive = param;
			
			System.out.println(receive);
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			List<EMAU00C01VO> list = null;
			List<List<EMAU00C01VO>> result = new ArrayList<>();
			
			try {
				for (int i = 0; i < receive.size(); i++ ) {
					System.out.println(i);
					String dateStart = (String) receive.get(i).get("dateStart");
					String dateEnd = (String) receive.get(i).get("dateEnd");
					String day = (String) receive.get(i).get("day");
					
					if(dateStart!=null && ! dateStart.equals("")) {
						paramMap.put("dateStart", dateStart);
					}
					
					if(dateEnd!=null && ! dateEnd.equals("")) {
						paramMap.put("dateEnd", dateEnd);
					}
					
					if(day!=null && ! day.equals("")) {
						paramMap.put("day", day);
					}
					
					System.out.println(paramMap);
					
					list = eMAU00C01Service.isUsePlace(paramMap);
					System.out.println(list);
					for (EMAU00C01VO index : list) {
						index.setDateDay((String) paramMap.get("day"));
						
					}
					//List<EMAU00C01VO> result =  list;
					result.add(list);
					System.out.println(result);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.getMessage();
			}
				
			mav.addObject("list", result);
			
//			String dateStart = String.valueOf(map.get("dateStart"));
//			String dateEnd = String.valueOf(map.get("dateEnd"));
//			
//			HashMap<String, Object> paramMap = new HashMap<String, Object>();
//			if(dayStart!=null && !dayStart.equals("")) {
//				paramMap.put("dayStart", dayStart);
//			}
//			if(dayEnd!=null && !dayEnd.equals("")) {
//				paramMap.put("dayEnd", dayEnd);
//			}
//			
//			System.out.println(paramMap);
//			List<EMAU00C01VO> list = null;
//			try {
//				list = eMAU00C01Service.isUsePlace(paramMap);
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//			
//			mav.addObject("list", list);
			return mav;
		}
		
		@RequestMapping(value = "/empo/resource/excelDownloadList.do", method = RequestMethod.POST)
		public @ResponseBody ModelAndView excelDownloadList(@RequestBody List<Map<String, Object>> param) {
			ModelAndView mav = new ModelAndView("jsonView");
			
			List<Map<String, Object>> receive = param;
			
			System.out.println(receive);
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			List<AvailableVO> list = null;
			List<List<AvailableVO>> result = new ArrayList<>();
			
			try {
				for (int i = 0; i < receive.size(); i++ ) {
					System.out.println(i);

					String coCateCode = String.valueOf(receive.get(i).get("coCateCode"));
					String paPk = String.valueOf(receive.get(i).get("paPk"));
					
					if(coCateCode!="null" && ! coCateCode.equals("") && coCateCode!=null) {
						paramMap.put("coCateCode", coCateCode);
					}
					
					if(paPk!="null" && ! paPk.equals("") && coCateCode!=null) {
						paramMap.put("paPk", paPk);
					}
					
					System.out.println(paramMap);
					
					list = eMAU00C01Service.excelDownloadList(paramMap);
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