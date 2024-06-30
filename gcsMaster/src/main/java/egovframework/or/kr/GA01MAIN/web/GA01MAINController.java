package egovframework.or.kr.GA01MAIN.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00C.service.EmPaDiVO;
import egovframework.or.kr.GA01MAIN.service.GA01MAINService;
import egovframework.or.kr.GA01MAIN.service.GA01MAINVO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINService;
import egovframework.or.kr.GA03MAIN.service.GA03MAINVO;
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
public class GA01MAINController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(GA01MAINController.class);
	
	/**
	 * GA01MAINService
	 */
	@Resource(name = "GA01MAINService")
    private GA01MAINService gA01MAINService;
	
	/**
	 * GA03MAINService
	 */
	@Resource(name = "GA03MAINService")
    private GA03MAINService gA03MAINService;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/gcs/login/login.do")
	public String eMAU00A01Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
  
    	return "forward:/gcs/dashboard/projectMain1001.do";  
	}  
	
	@RequestMapping(value = "/gcs/login/loginMobile.do")
	public String loginMobile(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empiloginMobile"; 
    	}
  
    	return "forward:/gcs/TD0001/TodayWork905.do";  
	}  
	
	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/gcs/login/login2.do")
	public String login2(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin2";
    	}
  
    	return "forward:/gcs/dashboard/gA030Main2.do"; 
    	
	} 
	
	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/gcs/login/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

		return "forward:/gcs/login/login.do";
	}
	
	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/gcs/login/actionLogoutMobile.do")
	public String actionLogoutMobile(HttpServletRequest request, ModelMap model) throws Exception {

		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

		return "forward:/gcs/login/loginMobile.do";
	}
	
	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/gcs/login/actionLogout2.do")
	public String actionLogout2(HttpServletRequest request, ModelMap model) throws Exception {
		
		//mobile logout
		LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
	 
		LoginVO vo = new LoginVO(); 
		vo.setId(user.getId());
		try {
			gA01MAINService.deleteLogin(vo); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

		return "forward:/gcs/login/login2.do";
	}
	
	
	/**
	 * GCS > MAIN
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gcs/dashboard/gA01Main.do")
	public String gA01Main(@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
	  throws Exception{
		 
		//로그인 객체 선언
    	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	

		
		return "main/GCSMAIN/gA01Main";
	} 
	
	/**
	 * GCS > MAIN
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gcs/dashboard/gcsMain2.do")
	public String gcsMain2(@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
	  throws Exception{
		 
		//로그인 객체 선언
    	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	

		
		return "main/GCSMAIN/gcsMain2";
	} 
	
	
	/**
	 * GCS > MAIN > 개별 입력 목록 리스트
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
 
	@RequestMapping("/gcs/dashboard/gA01MainPath.do")
	public ModelAndView gA01MainPath(@ModelAttribute("GA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
		  throws Exception{  
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
	    String user_id = user.getMbCode();
		ModelAndView mav = new ModelAndView("jsonView");		
  
		
		String dlPk = gA03MAINVO.getDlPk();		 
		LOGGER.debug("gA03Main2 : {}", dlPk);
		
		GA03MAINVO waypoints = null;
		String strWayPoint = "";
		String dlWaypointDetail = "";
		if(dlPk !=null && !dlPk.equals("")) {
			try {
				//파라미터 수신데이터
				GA03MAINVO vo = new GA03MAINVO(); 
				vo.setDlPk(dlPk);
				vo.setDlUserId(user_id);
				waypoints = gA03MAINService.selectWaypoint(vo);   
				strWayPoint = waypoints.getDlWaypoint();  
				dlWaypointDetail = waypoints.getDlWaypointDetail();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
 
		
		
		//LOGGER.debug("selectTaskProcess: {}",list);
		mav.addObject("result", "success");
		mav.addObject("strWayPoint", strWayPoint);
		mav.addObject("waypoints", waypoints);
		mav.addObject("dlWaypointDetail", dlWaypointDetail);
		
		return mav;
	}
	
	/**
	 * GCS > MAIN > 개별 입력 목록 리스트 : MC
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
 
	@RequestMapping("/gcs/dashboard/gA01MainPath2.do")
	public ModelAndView gA01MainPath2(@ModelAttribute("GA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
		  throws Exception{  
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
 
		
		String dlPk = gA03MAINVO.getDlPk();		 
		LOGGER.debug("gA03Main2 : {}", dlPk);
		
		GA03MAINVO waypoints = null;
		String strWayPoint = "";
		String dlWaypointDetail = "";
		if(dlPk !=null && !dlPk.equals("")) {
			try {
				
				//파라미터 수신데이터
				GA03MAINVO vo = new GA03MAINVO(); 
				vo.setDlPk(dlPk);
				waypoints = gA03MAINService.selectWaypoint2(vo); 
				strWayPoint = waypoints.getDlWaypoint(); 
				dlWaypointDetail = waypoints.getDlWaypointDetail();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		}
 
		
		
		//LOGGER.debug("selectTaskProcess: {}",list);
		mav.addObject("result", "success");
		mav.addObject("waypoints", waypoints);
		mav.addObject("strWayPoint", strWayPoint);
		mav.addObject("dlWaypointDetail", dlWaypointDetail);
		
		return mav;
	}
	
	
	/**
	 * GCS > MAIN > 개별 입력 목록 리스트
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping(value = "/gcs/dashboard/gA01Mainlist.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView gA01Mainlist(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
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
	
	
	/**
	 * GCS > MAIN > 개별 입력 목록 리스트
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping(value = "/gcs/dashboard/gA01MainFclist.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView gA01MainFclist(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
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
			
			list = gA03MAINService.selectWaypointList2(vo); 
			resultCnt = gA03MAINService.selectWaypointListCnt2(vo);
			
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
	
	 
	/**
	 * GCS > MAIN dashboard
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gcs/dashboard/gA01Main2.do")
	public String gA01Main2(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언
    	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}

		return "main/GCSMAIN/gA01Main2";
	}
	
	
	/**
	 * GCS > MAIN dashboard
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gcs/dashboard/gA01Main6.do")
	public String gA01Main6(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언
    	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}

		return "main/GCSMAIN/gA01Main6";
	}
	
	@RequestMapping(value = "/gcs/dashboard/gA01Main2List.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView gA01Main2List(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
 
		
		//파라미터 수신데이터
		GA01MAINVO vo = new GA01MAINVO();
		  
		List<GA01MAINVO> list = null;
		List<GA01MAINVO> pathlist = null;
		int totalCnt = 0; 
		try {
			 
			list = gA01MAINService.selectDroneList(vo);
			pathlist = gA01MAINService.selectDronePathList(vo);
  
			totalCnt = list.size();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		

		
		LOGGER.debug("gA01Main2List: {}",list);
		mav.addObject("list", list);
		mav.addObject("pathlist", pathlist);
		
		mav.addObject("totalCnt", totalCnt); 
		
		return mav;
	}
	
	
	/**
	 * GCS > MAIN dashboard
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gcs/dashboard/gA01Main3_1.do")
	public String gA01Main3_1(@RequestParam Map<String, Object> param, HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언
    	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		String nameChk = (String) map.get("nameChk");
    	
		mav.addObject("nameChk", nameChk);

		return "main/GCSMAIN/gA01Main3_1";
	} 
	
	@RequestMapping(value = "/gcs/dashboard/gA01Main3_2.do")
	public String gA01Main3_2(@RequestParam Map<String, Object> param, HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언
    	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		String nameChk = (String) map.get("nameChk");
    	
		mav.addObject("nameChk", nameChk);

		return "main/GCSMAIN/gA01Main3_2";
	} 
	
	@RequestMapping(value = "/gcs/dashboard/gA01Main3_3.do")
	public String gA01Main3_3(@RequestParam Map<String, Object> param, HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언
    	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		String nameChk = (String) map.get("nameChk");
    	
		mav.addObject("nameChk", nameChk);

		return "main/GCSMAIN/gA01Main3_3";
	} 
	
	@RequestMapping(value = "/gcs/dashboard/gA01Main3_4.do")
	public String gA01Main3_4(@RequestParam Map<String, Object> param, HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언
    	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		String nameChk = (String) map.get("nameChk");
    	
		mav.addObject("nameChk", nameChk);

		return "main/GCSMAIN/gA01Main3_4";
	} 
	
	
	@RequestMapping(value = "/gcs/dashboard/gA01Main3_5.do")
	public String gA01Main3_5(@RequestParam Map<String, Object> param, HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언
   

		return "main/GCSMAIN/gA01Main3_5";
	} 
	
	
	
	@RequestMapping(value = "/gcs/dashboard/gA01Main4.do")		
     public String gA01Main4(@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		//로그인 객체 선언
    	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	
 
	    String user_id = user.getMbCode();
    	
		String dlPk = gA03MAINVO.getDlPk();   
		LOGGER.debug("gA03Main2 : {}", dlPk);
		
		String strWayPoint = "";
		if(dlPk !=null && !dlPk.equals("")) {
			GA03MAINVO waypoints = null;
			
			//파라미터 수신데이터
			GA03MAINVO vo = new GA03MAINVO();
			vo.setDlPk(dlPk);
			vo.setDlUserId(user_id);
			waypoints = gA03MAINService.selectWaypoint(vo);
			strWayPoint = waypoints.getDlWaypoint(); 
		}
		model.addAttribute("waypoints", strWayPoint);

		return "main/GCSMAIN/gA01Main4";
	} 
	
	@RequestMapping(value = "/gcs/dashboard/gA01Main5.do")		
    public String gA01Main5(@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
	  throws Exception{
		
		//로그인 객체 선언
   	LoginVO user = (LoginVO)request.getSession().getAttribute("LoginVO");
   	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
   	if(!isAuthenticated) {
   		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
   		return "main/login/empilogin";
   	}
   	
		//String dlPk = gA03MAINVO.getDlPk(); 
     	String dlPk = "18";  
		LOGGER.debug("gA03Main2 : {}", dlPk);
		
		String strWayPoint = "";
		if(dlPk !=null && !dlPk.equals("")) {
			GA03MAINVO waypoints = null;
			
			//파라미터 수신데이터
			GA03MAINVO vo = new GA03MAINVO();
			vo.setDlPk(dlPk);
			waypoints = gA03MAINService.selectWaypoint(vo);
			strWayPoint = waypoints.getDlWaypoint(); 
		}
		model.addAttribute("waypoints", strWayPoint);

		return "main/GCSMAIN/gA01Main5";
	} 
	
	
	
	/*테스트
	 * */
	@RequestMapping(value = "/gcs/dashboard/gA01Main01.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView gA01Main01(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		 
		Map<String, Object> mapData = new HashMap<>();
		String noPk = (String) map.get("noPk");
		 
		
		if(noPk !=null && noPk != "") {
			mapData.put("noPk", noPk);
		}
		  
 
		List<GA01MAINVO> list = null;
		
		try {
			list = gA01MAINService.selectTest(mapData);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LOGGER.debug("selectTaskProcess: {}",list);
		mav.addObject("list", list);
		 
		return mav;
	}
	
	
	
}
