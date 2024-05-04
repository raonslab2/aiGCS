package egovframework.or.kr.TD0001.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.TD0001.service.RectanglePoints;
import egovframework.or.kr.TD0001.service.TodayWork100Service;
import egovframework.or.kr.TD0001.service.TodayWork100VO;
import egovframework.or.kr.TD0001.service.UserService;
import egovframework.or.kr.TD0001.service.UserVO;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.or.kr.com.utill.FileUploadUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * GCS 관제 시스템
 * 
 * @author 실행환경 개발팀 SSD SCJ
 * @since 2024.02.10
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.02.10  min            First Create
 *
 *      </pre>
 */

@Controller
@SessionAttributes(types = ComDefaultVO.class)
public class TodayWork100Controller {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(TodayWork100Controller.class);
	
	/**
	 * GA03MAINService
	 */
	@Resource(name = "TodayWork100Service")
    private TodayWork100Service todayWork100Service;
	
	/**
	 * UserService
	 */
	@Resource(name = "UserService")
    private UserService userService;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
    @MessageMapping("/webChat")
    @SendTo("/sub") // 클라이언트에게 메시지 전달
    public String handleIncomingMessage(String message) {
        System.out.println("Received message from client: " + message);
        return "Echo from server: " + message;
    }
    
    @MessageMapping("/pub/webChat")
    @SendTo("/sub") // 클라이언트에게 메시지 전달
    public String handleIncomingMessage2(String message) {
        System.out.println("Received message from client: " + message);
        return "Echo from server: " + message;
    }
    
    @RequestMapping(value = "/ws/info", method = RequestMethod.GET)
    public String handleWebSocketInfoRequest() {
        // 처리할 로직을 구현
        return "Response from server for WebSocket info request";
    } 
	 
	/**
	 * GCS > DashBoard > Today Work : html, css, js
	 * @return MainPage Info Map [key : Value]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork100.do") 
	public String TodayWork100(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork100";
	}
	
	/**
	 * GCS > DashBoard > Today Work : html, css, js
	 * @return MainPage Info Map [key : Value]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/TD0001/AiWork200.do") 
	public String AiWork200(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/AiWork200";
	} 
	
	
	
	@RequestMapping("/gcs/TD0001/Project.do") 
	public String Project(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/Project";
	} 
	
	/**
	 * GCS > DashBoard > Today Work : html, css, js
	 * @return MainPage Info Map [key : Value]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork103.do") 
	public String TodayWork103(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork103";
	} 
	
	/**
	 * GCS > DashBoard > Today Work : html, css, js
	 * @return MainPage Info Map [key : Value]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork104.do") 
	public String TodayWork104(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork104";
	} 
	
	/**
	 * GCS > DashBoard > Today Work : html, css, js
	 * @return MainPage Info Map [key : Value]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork101.do") 
	public String TodayWork101(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork101";
	} 

	/**
	 * Home > Admin > Today Work : Dash Board
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork900.do") 
	public String TodayWork900(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin"; 
    	}
    	
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		model.addAttribute("userId", user.getId()); 
    
		return "main/TD0001/TodayWork900";
	}
	
	
	/**
	 * Home > Admin > Today Work : Task List
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork901.do") 
	public String TodayWork901(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork901";
	}
	
	/**
	 * Home > Admin > Today Work : Task Write
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork901Write.do") 
	public String TodayWork901Write(
			  @ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, @RequestParam Map<String, Object> param 
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String twPk      = String.valueOf(map.get("twPk")); 
		if(twPk!=null && twPk!="null" && twPk !="") { 
			model.addAttribute("twPk", twPk); 
		}else { 
			model.addAttribute("twPk", ""); 
		} 
		return "main/TD0001/TodayWork901Write";
	}
 
	
	/**
	 * GCS > Taday Work > Task List
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
 
	@RequestMapping(value = "/gcs/TD0001/selectTodayWork901Write.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectTodayWork901Write(
			  @RequestParam Map<String, Object> param  
			, HttpServletRequest request
			, HttpSession session
			) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		/*
		 * respond data
		 */
		String twPk      = String.valueOf(map.get("twPk")); 
		
 
		//파라미터 수신데이터
		TodayWork100VO vo = new TodayWork100VO(); 
		if(twPk !=null&&twPk !="null"&&twPk !="") {
			vo.setTwPk(Integer.parseInt(twPk));
		}
		vo.setFlTable("TW_TASK_LIST");
		vo.setFlFilePk(Integer.parseInt(twPk));
		   
		TodayWork100VO result = null;
		List<TodayWork100VO> attachList = null; 
		int attachListCnt = 0;
		try {
			//기존 데이터 불러오기
		    result = todayWork100Service.selectTodayWork901Write(vo); 
		    
		    //첨부화일 불러오기
		    attachList = todayWork100Service.selectTodayWork901WriteAtach(vo); 
		    attachListCnt = todayWork100Service.selectTodayWork901WriteAtachCnt(vo); 
		    
		} catch (Exception e) {
		    // TODO: handle exception
		    e.printStackTrace();
		}
		
	 

		LOGGER.debug("insertTodayWork901Write: {}",result);
		
		mav.addObject("result", result); 
		mav.addObject("attachList", attachList); 
		mav.addObject("atachListCnt", attachListCnt); 
		return mav;
	}
	
	@RequestMapping(value = "/gcs/TD0001/selectCallChatList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectCallChatList(
			  @RequestParam Map<String, Object> param  
			, HttpServletRequest request
			, HttpSession session
			) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		/*
		 * respond data
		 */
		String twPk      = String.valueOf(map.get("twPk")); 
		
 
		//파라미터 수신데이터
		TodayWork100VO vo = new TodayWork100VO(); 
		vo.setChPaPk(twPk);
		vo.setChUserId(user.getId());
		vo.setTcUserId(user.getId());
        
		List<TodayWork100VO> list = null; 
		int total = 0;
		try {
			//글 읽음을 영으로 바꾼다.
			todayWork100Service.deleteTwChatUnRead(vo);
			//기존 데이터 불러오기
			list = todayWork100Service.selectCallChatList(vo);   
			total = todayWork100Service.selectCallChatListCnt(vo); 
		     
		} catch (Exception e) {
		    // TODO: handle exception
		    e.printStackTrace();
		}
		
	 

		LOGGER.debug("selectCallChatList: {}",list);
		
		mav.addObject("list", list); 
		mav.addObject("total", total);  
		return mav;
	}
	
	@RequestMapping(value = "/gcs/TD0001/insertChatMsg.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertChatMsg(
			  @RequestParam Map<String, Object> param  
			, HttpServletRequest request
			, HttpSession session
			) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		/*
		 * respond data
		 */
		String twPk      = String.valueOf(map.get("twPk")); 
		String msg       = String.valueOf(map.get("msg")); 
		
 
		//파라미터 수신데이터
		TodayWork100VO vo = new TodayWork100VO(); 
		vo.setChPaPk(twPk);
		vo.setChUserId(user.getId());
		vo.setMessageType(msg);
         
		try { 
			 todayWork100Service.insertChatMsg(vo); 
		} catch (Exception e) {
		    // TODO: handle exception
		    e.printStackTrace();
		}
		
   
		return mav;
	}
	
	/**
	 * GCS > Taday Work > Task List
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@SuppressWarnings("null")
	@RequestMapping(value = "/gcs/TD0001/insertTodayWork901Write.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertTodayWork901Write(
			  @RequestParam Map<String, Object> param 
			,  @RequestParam("upfile") MultipartFile[] files
			, HttpServletRequest request
			, HttpSession session
			) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		/*
		 * respond input
		 */
		String twStatus        = String.valueOf(map.get("twStatus")); 
		String twCategory1     = String.valueOf(map.get("twCategory1"));
		String twCategory2     = String.valueOf(map.get("twCategory2"));
		String twRequestDate   = String.valueOf(map.get("twRequestDate"));
		String twRequester     = String.valueOf(map.get("twRequester"));
		String twWorker        = String.valueOf(map.get("twWorker"));
		String twWorker2        = String.valueOf(map.get("twWorker2"));
		String twSubject       = String.valueOf(map.get("twSubject"));
		String twContent2      = String.valueOf(map.get("twContent2")); 
		String twPk            = String.valueOf(map.get("twPk")); 
		String twStartDateExp  = String.valueOf(map.get("twStartDateExp")); 
		String twEndDateExp    = String.valueOf(map.get("twEndDateExp")); 
		 
		//파라미터 수신데이터
 		TodayWork100VO vo = new TodayWork100VO();
		
		//insertTodayWork901Write
		if(twStatus !=null&&twStatus !="null"&&twStatus !="") {
			vo.setTwStatus(twStatus);
		}
		if(twCategory1 !=null&&twCategory1 !="null"&&twCategory1 !="") {
			vo.setTwCategory1(twCategory1);
		}
		if(twCategory2 !=null&&twCategory2 !="null"&&twCategory2 !="") {
			vo.setTwCategory2(twCategory2);
		}
		if(twRequestDate !=null&&twRequestDate !="null"&&twRequestDate !="") {
			vo.setTwRequestDate(twRequestDate);
		}
		if(twRequester !=null&&twRequester !="null"&&twRequester !="") {
			vo.setTwRequester(twRequester);
		}
		if(twWorker !=null&&twWorker !="null"&&twWorker !="") {
			vo.setTwWorker(twWorker);
		}
		if(twWorker2 !=null&&twWorker2 !="null"&&twWorker2 !="") {
			vo.setTwWorker2(twWorker2);
		}
		if(twSubject !=null&&twSubject !="null"&&twSubject !="") {
			vo.setTwSubject(twSubject);
		}
		if(twContent2 !=null&&twContent2 !="null"&&twContent2 !="") {
			vo.setTwContent(twContent2);
		}
		if(twStartDateExp !=null&&twStartDateExp !="null"&&twStartDateExp !="") {
			vo.setTwStartDateExp(twStartDateExp);
		}
		if(twEndDateExp !=null&&twEndDateExp !="null"&&twEndDateExp !="") {
			vo.setTwEndDateExp(twEndDateExp);
		}
		  
		int result = 0; 
		TodayWork100VO todayWork100VO = null; 
		try { 
			
			if(twPk!=null && twPk!="null" && twPk!="" && twPk.trim().length()>0) {
				vo.setTwPk(Integer.parseInt(twPk));
			    result = todayWork100Service.updateTodayWork901Write(vo); 
			}else {
			    result = todayWork100Service.insertTodayWork901Write(vo);  
			}

		    todayWork100VO = todayWork100Service.selectTodayWork901Pk(vo);
		    
			/*
			 * file upload
			 */  
			String uploadPath = "/home/ubuntu/upload";
			String[][] uploadedFilesInfo = FileUploadUtil.uploadFiles(files, uploadPath);
			
			for (String[] fileInfo : uploadedFilesInfo) {
			    String originalFilename = fileInfo[0];
			    String savedFilePath = fileInfo[1];
			    if(originalFilename !=null &&originalFilename!="null"&&originalFilename!="") {
			    	
				    todayWork100VO.setOriginalFilename(originalFilename);
				    todayWork100VO.setSavedFilePath(savedFilePath);
				    todayWork100VO.setFlTable("TW_TASK_LIST");
				    todayWork100VO.setFlFilePk(todayWork100VO.getTwPk()); 
				     
				    todayWork100Service.insertTwFile(todayWork100VO);  
			    }

			}

		} catch (Exception e) {
		    // TODO: handle exception
		    e.printStackTrace();
		}
		
	 

		LOGGER.debug("insertTodayWork901Write: {}",result);
		
		mav.addObject("result", result);
		 
		
		return mav;
	}
	
	
	/**
	 * Home > Admin > Today Work : Weekly Work
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork902.do") 
	public String TodayWork902(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork902";
	} 
	
	/**
	 * GCS > Taday Work > Task List
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping(value = "/gcs/TD0001/selectTodayWork901List.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView TodayWork901List(
			@RequestParam Map<String
			, Object> param
			, HttpServletRequest request
			) throws Exception {
		
		// 사용자 정보 가져오기
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");

		// JSON 응답을 반환할 ModelAndView 생성
		ModelAndView mav = new ModelAndView("jsonView");

		// 파라미터를 EgovMap 형태로 변환
		EgovMap map = CommUtil.makeEgovMap(param);

		// 각 파라미터 값들을 문자열로 저장
		String page = String.valueOf(map.get("page"));
		String searchTwRequestDateSt = String.valueOf(map.get("searchTwRequestDateSt"));
		String searchTwRequestDateEd = String.valueOf(map.get("searchTwRequestDateEd"));
		String searchTwWorker = String.valueOf(map.get("searchTwWorker"));
		String searchTwStatus = String.valueOf(map.get("searchTwStatus"));
		
		// TodayWork100VO 객체 생성
		TodayWork100VO vo = new TodayWork100VO();

		if (searchTwStatus != null && !searchTwStatus.equals("null") && !searchTwStatus.equals("")) {
		    vo.setSearchTwStatus(searchTwStatus);
		}
		
		// 검색 시작일자 설정
		if (searchTwRequestDateSt != null && !searchTwRequestDateSt.equals("null") && !searchTwRequestDateSt.equals("")) {
		    vo.setSearchTwRequestDateSt(searchTwRequestDateSt);
		}

		// 검색 종료일자 설정
		if (searchTwRequestDateEd != null && !searchTwRequestDateEd.equals("null") && !searchTwRequestDateEd.equals("")) {
		    vo.setSearchTwRequestDateEd(searchTwRequestDateEd);
		}

		// 검색할 사용자 설정
		if (searchTwWorker != null && !searchTwWorker.equals("null") && !searchTwWorker.equals("")) {
		    if (searchTwWorker.equals("ALL")) {
		        vo.setSearchTwWorker(null);
		    } else {
		        vo.setSearchTwWorker(searchTwWorker);
		    }
		} else {
		    vo.setSearchTwWorker(user.getId());
		}
		
		/*
		 * 페이징 관련 시작
		 */

		// 페이지 번호 설정
		if (page != null && !page.equals("null") && !page.equals("")) {
		    int page1 = Integer.parseInt(page);
		    vo.setPageIndex(page1);
		}

		// 페이징 처리를 위한 PaginationInfo 객체 생성
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		// 검색 조건에 따른 인덱스 설정
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		/*
		 * 페이징 관련 끝
		 */
		
		
		// 오늘 할일에 대한 목록
		List<TodayWork100VO> list = null;
		int totalCnt = 0;

		try {
		    // 검색 및 조회
		    list = todayWork100Service.selectTodayWork901List(vo);  
		    totalCnt = todayWork100Service.selectTodayWork901ListCnt(vo);

		    // PaginationInfo에 전체 레코드 수 설정
		    paginationInfo.setTotalRecordCount(totalCnt);
		} catch (Exception e) {
		    // 예외 처리
		    e.printStackTrace();
		}

		// 로그 기록
		LOGGER.debug("selectTaskProcess: {}", list);

		// 조회 결과와 페이징 정보를 ModelAndView에 추가하여 반환
		mav.addObject("list", list);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("paginationInfo", paginationInfo);

		return mav;

	}
	
	
	/**
	 * GCS > Taday Work > new list
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping(value = "/gcs/TD0001/selectTodayWork900.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectTodayWork900(
			@RequestParam Map<String
			, Object> param
			, HttpServletRequest request
			) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String page                   = String.valueOf(map.get("page")); 
		String pageUnit               = String.valueOf(map.get("pageUnit")); 
		String searchTwRequestDateSt  = String.valueOf(map.get("searchTwRequestDateSt")); 
		String searchTwRequestDateEd  = String.valueOf(map.get("searchTwRequestDateEd")); 
	 
		
		//파라미터 수신데이터
		TodayWork100VO vo = new TodayWork100VO();
		 
		vo.setSearchTwWorker(user.getId());

		if(searchTwRequestDateSt !=null && searchTwRequestDateSt !="null" && searchTwRequestDateSt !="") {
            vo.setSearchTwRequestDateSt(searchTwRequestDateSt);
		}
		
		if(searchTwRequestDateEd !=null && searchTwRequestDateEd !="null" && searchTwRequestDateEd !="") {
            vo.setSearchTwRequestDateEd(searchTwRequestDateEd);
		}
 
		
		if(page !=null && page !="null" && page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		if(pageUnit !=null && pageUnit !="null" && pageUnit !="") {
			int pageUnit2 = Integer.parseInt(pageUnit);
			vo.setPageUnit(pageUnit2);
		}
		
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	 
		
		List<TodayWork100VO> list = null;
		int totalCnt = 0;   
		try { 
			list     = todayWork100Service.selectTodayWork900(vo);     
			totalCnt = todayWork100Service.selectTodayWork900Cnt(vo);
			 
			paginationInfo.setTotalRecordCount(totalCnt);
	 
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
	 * GCS > Taday Work > new list
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping(value = "/gcs/TD0001/selectTodayWork905.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectTodayWork905(
			@RequestParam Map<String
			, Object> param
			, HttpServletRequest request
			) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String page                   = String.valueOf(map.get("page")); 
		String pageUnit               = String.valueOf(map.get("pageUnit")); 
		String searchTwRequestDateSt  = String.valueOf(map.get("searchTwRequestDateSt")); 
		String searchTwRequestDateEd  = String.valueOf(map.get("searchTwRequestDateEd")); 
		String searchDiv  = String.valueOf(map.get("searchDiv")); 
	 
		
		//파라미터 수신데이터
		TodayWork100VO vo = new TodayWork100VO();
		if(searchDiv.equals("2")) { //나의 업무
			vo.setSearchTwWorker(user.getId());
		}else if(searchDiv.equals("3")) {//요청한 업무
			vo.setTwRequester(user.getId());
		}else if(searchDiv.equals("4")) {//참조 업무
			vo.setTwWorker2(user.getId());
		}

		if(searchTwRequestDateSt !=null && searchTwRequestDateSt !="null" && searchTwRequestDateSt !="") {
            vo.setSearchTwRequestDateSt(searchTwRequestDateSt);
		}
		
		if(searchTwRequestDateEd !=null && searchTwRequestDateEd !="null" && searchTwRequestDateEd !="") {
            vo.setSearchTwRequestDateEd(searchTwRequestDateEd);
		}
		
		if(searchDiv !=null && searchDiv !="null" && searchDiv !="") {
            vo.setSearchDiv(searchDiv);
		}
 
		
		if(page !=null && page !="null" && page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		if(pageUnit !=null && pageUnit !="null" && pageUnit !="") {
			int pageUnit2 = Integer.parseInt(pageUnit);
			vo.setPageUnit(pageUnit2);
		}
		
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	 
		
		List<TodayWork100VO> list = null;
		int totalCnt = 0;   
		try { 
			list     = todayWork100Service.selectTodayWork905(vo);          
			totalCnt = todayWork100Service.selectTodayWork905Cnt(vo);
			 
			paginationInfo.setTotalRecordCount(totalCnt);
	 
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
	 * GCS > Taday Work > View
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping(value = "/gcs/TD0001/selectTodayWork900View.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectTodayWork900View(
			@RequestParam Map<String
			, Object> param
			, HttpServletRequest request
			) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String twPk   = String.valueOf(map.get("twPk")); 
  
		//파라미터 수신데이터
		TodayWork100VO vo = new TodayWork100VO();
		vo.setTwPk(Integer.parseInt(twPk));
		vo.setFlTable("TW_TASK_LIST");
		vo.setFlFilePk(Integer.parseInt(twPk));
    
		TodayWork100VO result = null;
		List<TodayWork100VO> attachList = null; 
		int attachListCnt = 0;
		int totalCnt = 0;   
		try { 
			result     = todayWork100Service.selectTodayWork900View(vo);   
			
		    //첨부화일 불러오기
		    attachList = todayWork100Service.selectTodayWork901WriteAtach(vo); 
		    attachListCnt = todayWork100Service.selectTodayWork901WriteAtachCnt(vo); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		  
		LOGGER.debug("selectTaskProcess: {}",result);
		mav.addObject("result", result);
		mav.addObject("attachList", attachList); 
		mav.addObject("atachListCnt", attachListCnt); 
		mav.addObject("totalCnt", totalCnt); 
		
		return mav;
	}
	
	
	/**
	 * GCS > Common > code
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping(value = "/gcs/TD0001/selectTwCode.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectTwCode(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String coDiv  = String.valueOf(map.get("coDiv")); 
	 
		//파라미터 수신데이터
		UserVO vo = new UserVO();
	 	vo.setCoDiv(coDiv);
         
		List<UserVO> list = null; 
		try { 
			list = userService.selectTwCode(vo); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		 
		LOGGER.debug("selectTaskProcess: {}",list);
		mav.addObject("list", list); 
		return mav;
	}
	
	@RequestMapping(value = "/gcs/TD0001/setBookMark.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView setBookMark(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String tmDiv  = String.valueOf(map.get("tmDiv")); 
	 
		//파라미터 수신데이터
		UserVO vo = new UserVO();
	 
         
		int result = 0; 
		try { 
			//result = userService.setBookMark(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		 
		LOGGER.debug("setBookMark: {}",result);
		mav.addObject("result", result); 
		return mav;
	}
	
	/**
	 * GCS > Common > code
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping(value = "/gcs/TD0001/updateTwStatus.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView updateTwStatus(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//user Info
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String twStatus  = String.valueOf(map.get("selectedTwStatus")); 
		String twPk              = String.valueOf(map.get("twPk")); 
	 
		//파라미터 수신데이터
		UserVO vo = new UserVO();
	 	vo.setTwStatus(twStatus);
	 	vo.setTwPk(Integer.parseInt(twPk));
         
		int result = 0;
		try { 
			result = userService.updateTwStatus(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		 
		LOGGER.debug("updateTwStatus: {}",result);
		mav.addObject("result", result); 
		return mav;
	}
	
	
	/**
	 * GCS > Common > UserList
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception todayWork100Service
	 */ 
	@RequestMapping(value = "/gcs/TD0001/userList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView userList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		// 사용자 정보 가져오기
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");

		// JSON 응답을 반환할 ModelAndView 생성
		ModelAndView mav = new ModelAndView("jsonView");

		// 파라미터를 EgovMap 형태로 변환
		EgovMap map = CommUtil.makeEgovMap(param); 

		// 검색할 사용자 아이디 설정
		UserVO vo = new UserVO();
		vo.setSearchUserId(user.getId());

		// 사용자 목록을 저장할 리스트 초기화
		List<UserVO> list = null; 

		try { 
		    // 사용자 목록 조회
		    list = userService.selectUserList(vo);
		} catch (Exception e) {
		    // 예외 처리
		    e.printStackTrace();
		} 

		// 로그 기록
		LOGGER.debug("selectTaskProcess: {}",list);

		// ModelAndView에 사용자 목록과 사용자 아이디를 추가하여 반환
		mav.addObject("list", list);
		mav.addObject("userId", user.getId());
		return mav;

	}
 
	
	@RequestMapping("/gcs/TD0001/TodayWork903.do") 
	public String TodayWork903(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork903";
	} 
	
	@RequestMapping("/gcs/TD0001/TodayWork904.do") 
	public String TodayWork904(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork904";
	} 
	
	@RequestMapping("/gcs/TD0001/TodayWork905.do") 
	public String TodayWork905(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		model.addAttribute("userId", user.getId()); 
		
		return "main/TD0001/TodayWork905";
	} 
	
	@RequestMapping("/gcs/TD0001/TodayWork906.do") 
	public String TodayWork906(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		model.addAttribute("userId", user.getId());
    
		return "main/TD0001/TodayWork906";
	} 
	
	
	
	@RequestMapping(value = "/gcs/TD0001/updateTodayWork101.do", method = RequestMethod.POST) 
	public @ResponseBody ModelAndView updateTodayWork101(@RequestBody TodayWork100VO param
			, HttpServletRequest request) throws Exception {
		 
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
	 
		//String labelText = String.valueOf(map.get("labelText")); 
		String labelText    = String.valueOf(param.getLabel()); 
		RectanglePoints rectanglePoints = param.getRectanglePoints(); 
		
		//파라미터 수신데이터
		TodayWork100VO vo = new TodayWork100VO();
		
		  
		int result = 0; 
		try {
			
			//list = gA03MAINAIRService.selectAirList(vo);
			result = todayWork100Service.updateTodayWork101(vo);  
	 
			
		 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		

		
		LOGGER.debug("selectTaskProcess: {}",result);
		mav.addObject("result", result);
		 
		
		return mav;
	}
	
	/**
	 * GCS > DashBoard > Today Work : html, css, js
	 * @return MainPage Info Map [key : Value]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork102.do") 
	public String TodayWork102(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork102";
	} 
	
	
	/**
	 * GCS > DashBoard > Today Work : ajax call : data
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping(value = "/gcs/TD0001/TodayWork100List.do", method = RequestMethod.POST)
    @CrossOrigin(origins = "*")
	public @ResponseBody ModelAndView TodayWork100List(@RequestParam Map<String, Object> param
			, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String page = String.valueOf(map.get("page")); 
		
		//파라미터 수신데이터
		TodayWork100VO vo = new TodayWork100VO();
		
		
		/*
		 * paging start
		 */
		if(page !=null && page !="null" && page !="") {
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
		/*
		 * paging end
		 */
		
		List<TodayWork100VO> list = null;
		int totalCnt = 0; 
		try {
			
			//list = gA03MAINAIRService.selectAirList(vo);
			list = todayWork100Service.TodayWork100List(vo);  
			totalCnt = todayWork100Service.TodayWork100ListCnt(vo);
			
			paginationInfo.setTotalRecordCount(totalCnt);
			
		 
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
	 * GCS > DashBoard > Today Work : [ Write ]
	 * @return MainPage Info Map [key : Value]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/TD0001/TodayWork100Write.do") 
	public String TodayWork100Write(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork100Write";
	}
	
	@RequestMapping("/gcs/TD0001/TodayWork103Write.do") 
	public String TodayWork103Write(@ModelAttribute("todayWork100VO") TodayWork100VO todayWork100VO
			, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/TD0001/TodayWork103Write";
	}
	
	@RequestMapping(value = "/gcs/TD0001/insertTodayWork100Write.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertTodayWork100Write(@RequestParam Map<String, Object> param
			, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		//receive data
		String tdSubject = String.valueOf(map.get("tdSubject")); 
	 
		 
		/*
		 * DataBase Insert start
		 */
		TodayWork100VO vo = new TodayWork100VO();
		
		if(tdSubject!=null && tdSubject!="null" && tdSubject!="") {
			vo.setTdSubject(tdSubject);
		}
		
		int result = 0;
		
		try {
			result = todayWork100Service.insertTodayWork100(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
				
				
		/*
		 * DataBase Insert end
		 */
		
		LOGGER.debug("selectTaskProcess: {}","");
	 
		mav.addObject("result", result); 
		
		return mav;
	}
	
}
