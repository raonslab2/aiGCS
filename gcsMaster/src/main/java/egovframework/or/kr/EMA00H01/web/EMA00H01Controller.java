package egovframework.or.kr.EMA00H01.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMA00H01.service.EMA00H01Service;
import egovframework.or.kr.EMA00H01.service.EMA00H01VO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRService;
import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRVO;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * GCS 관제 시스템
 * 
 * @author 실행환경 개발팀 SSD SCJ
 * @since 2021.11.01
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2021.11.01  SCJ            최초 생성
 *
 *      </pre>
 */

@Controller
@SessionAttributes(types = ComDefaultVO.class)
public class EMA00H01Controller {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EMA00H01Controller.class);
	
	/**
	 * GA03MAINService
	 */
	@Resource(name = "EMA00H01Service")
    private EMA00H01Service eMA00H01Service;
	  
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	/**
	 * INNO > 주소록관리 > 최근기록
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EMA00H01/h01001.do")
	public String h01001(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EMA00H01/h01001"; 
	}
	
	@RequestMapping(value = "/inno/EMA00H01/h01001List.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView h01001List(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {

		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String page = String.valueOf(map.get("page")); 
		
		//파라미터 수신데이터
		EMA00H01VO vo = new EMA00H01VO();
		
		//page 구현부
		if(page !=null && page !="") {
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
	 
		
		List<EMA00H01VO> list = null;
		int totalCnt = 0;
		int resultCnt = 0; 
		try {
			 
			list =    eMA00H01Service.selectEMA00H01(vo);
			resultCnt = eMA00H01Service.selectEMA00H01Cnt(vo);
			
			paginationInfo.setTotalRecordCount(resultCnt);
			
			totalCnt = list.size();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		
 
 
		
		LOGGER.debug("selectTaskProcess: {}",list);
		mav.addObject("list", list);
		
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("paginationInfo", paginationInfo); 
		
		return mav;
	}
	/*
	 * 
	@RequestMapping(value = "/gcs/dashboard/gA03Main2List.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView gA03Main2List(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String page = String.valueOf(map.get("page")); 
		
		//파라미터 수신데이터
		GA03MAINVO vo = new GA03MAINVO();
		
		if(page !=null && page !="") {
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
	 
		
		List<GA03MAINVO> list = null;
		int totalCnt = 0;
		int resultCnt = 0; 
		try {
			
			list = gA03MAINService.selectWaypointList(vo);
			resultCnt = gA03MAINService.selectWaypointListCnt(vo);
			
			paginationInfo.setTotalRecordCount(resultCnt);
			
			totalCnt = list.size();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		
 
		
		LOGGER.debug("selectTaskProcess: {}",list);
		mav.addObject("list", list);
		
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("paginationInfo", paginationInfo); 
		
		return mav;
	}
	
	
	 */
	
	
	/**
	 * INNO > 주소록관리 > 미해결기록
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EMA00H01/h01002.do")
	public String h01002(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EMA00H01/h01002"; 
	}
	
	/**
	 * INNO > 주소록관리 > 전체기록
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EMA00H01/h01003.do")
	public String h01003(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EMA00H01/h01003"; 
	}
	
	/**
	 * INNO > 주소록관리 > 주소록관리
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EMA00H01/h01004.do")
	public String h01004(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EMA00H01/h01004"; 
	}
	
	/**
	 * INNO > 주소록관리 > 개인관리
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EMA00H01/h01005.do")
	public String h01005(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EMA00H01/h01005"; 
	}
	
	/**
	 * INNO > 주소록관리 > 거래처관리
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EMA00H01/h01006.do")
	public String h01006(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EMA00H01/h01006"; 
	}
	
	/**
	 * INNO > 주소록관리 > 비서업무관리
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EMA00H01/h01007.do")
	public String h01007(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EMA00H01/h01007"; 
	}
	
}
