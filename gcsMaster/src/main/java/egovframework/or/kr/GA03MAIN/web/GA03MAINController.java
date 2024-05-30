package egovframework.or.kr.GA03MAIN.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.PumpStreamHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.GA03MAIN.service.DeviceVO;
import egovframework.or.kr.GA03MAIN.service.GA034MainService;
import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRService;
import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRVO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINService;
import egovframework.or.kr.GA03MAIN.service.GA03MAINUSERService;
import egovframework.or.kr.GA03MAIN.service.GA03MAINUSERVO;
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
public class GA03MAINController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(GA03MAINController.class);
	
	/**
	 * GA03MAINService
	 */
	@Resource(name = "GA03MAINService")
    private GA03MAINService gA03MAINService;
	
	@Resource(name = "GA03MAINAIRService")
    private GA03MAINAIRService gA03MAINAIRService;
	
	@Resource(name = "GA03MAINUSERService")
    private GA03MAINUSERService gA03MAINUSERService;
 
	@Resource(name = "GA034MainService")
    private GA034MainService gA034MainService;
	
	
	
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@RequestMapping(value = "/gcs/dashboard/gA03Main.do")
	public String gA03Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
  
		return "main/GCSMAIN3/gA03Main";
	} 
	
	
	/**
	 * GCS > MAIN > 직접 waypoint 입력
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gcs/dashboard/gA030Main.do")
	public String gA030Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
  
		return "main/GCSMAIN3/gA030Main";
	} 
	
	@RequestMapping(value = "/gcs/dashboard/gA030Main2.do")
	public String gA030Main2(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin2";
    	}
  
		return "main/GCSMAIN3/gA030Main2";
	} 
	
	@RequestMapping(value = "/gcs/dashboard/gA030OfflineMain.do")
	public String gA030OfflineMain(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
  
		return "main/GCSMAIN3/gA030OfflineMain";
	} 
	
	/**
	 * GCS > MAIN > 군집드론 waypoint 입력
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gcs/dashboard/gA031Main.do")
	public String gA031Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
  
		return "main/GCSMAIN3/gA031Main";
	} 
	
	/**
	 * GCS > MAIN > 군집드론 waypoint 입력
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gcs/dashboard/gA032Main.do")
	public String gA032Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
  
		return "main/GCSMAIN3/gA032Main";
	} 
	
	
	@RequestMapping(value = "/gcs/dashboard/gA033Main.do")
	public String gA033Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
  
		return "main/GCSMAIN3/gA033Main";
	} 
	
	/**
	 * GCS > MAIN > PLAN
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	//@RequestMapping(value = "/gcs/dashboard/gA03Main2.do")
	@RequestMapping("/gcs/dashboard/gA03Main2.do")
	public String gA03Main2(@RequestParam Map<String, Object> param,@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
	  throws Exception{  
		
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
		
		ModelAndView mav = new ModelAndView("jsonView");	 		
		EgovMap map = CommUtil.makeEgovMap(param); 

		String tmLat = String.valueOf(map.get("tmLat"));
		String tmLng = String.valueOf(map.get("tmLng"));
		 
		
		String dlPk = gA03MAINVO.getDlPk();
		LOGGER.debug("gA03Main2 : {}", dlPk);
		
		GA03MAINVO waypoints     = null;
		String strWayPoint       = "";
		String strWayPointDetail = ""; 
		//오늘 날짜
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmm");
		Date time = new Date();
		String time1 = format1.format(time);
		
		String strDlName         = "Route_"+time1;
		if(dlPk !=null && !dlPk.equals("")) {
			//파라미터 수신데이터
			GA03MAINVO vo = new GA03MAINVO();
			vo.setDlPk(dlPk);
			waypoints         = gA03MAINService.selectWaypoint(vo);
			strDlName         = waypoints.getDlName();
			strWayPoint       = waypoints.getDlWaypoint();  
			strWayPointDetail = waypoints.getDlWaypointDetail(); 
			
		}
 
		
		model.addAttribute("dlName", strDlName);
		model.addAttribute("waypoints", strWayPoint);
		model.addAttribute("waypointsDetail", strWayPointDetail);
		model.addAttribute("dlPk", dlPk);
		model.addAttribute("tmLat", tmLat);
		model.addAttribute("tmLng", tmLng);
		
		return "main/GCSMAIN3/gA03Main2";
	} 
	
	/**
	 * GCS > MAIN > PLAN : 2D 폴리곤
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/dashboard/gA03Main9.do")
	public String gA03Main9(@RequestParam Map<String, Object> param,@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
	  throws Exception{  
		
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
		
		ModelAndView mav = new ModelAndView("jsonView");	 		
		EgovMap map = CommUtil.makeEgovMap(param); 

		String tmLat = String.valueOf(map.get("tmLat"));
		String tmLng = String.valueOf(map.get("tmLng"));
		 
		
		String dlPk = gA03MAINVO.getDlPk();
		LOGGER.debug("gA03Main2 : {}", dlPk);
		
		GA03MAINVO waypoints     = null;
		String strWayPoint       = "";
		String strWayPointDetail = ""; 
		//오늘 날짜
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmm");
		Date time = new Date();
		String time1 = format1.format(time);
		
		String strDlName         = "Route_"+time1;
		if(dlPk !=null && !dlPk.equals("")) {
			//파라미터 수신데이터
			GA03MAINVO vo = new GA03MAINVO();
			vo.setDlPk(dlPk);
			waypoints         = gA03MAINService.selectWaypoint(vo);
			strDlName         = waypoints.getDlName();
			strWayPoint       = waypoints.getDlWaypoint();  
			strWayPointDetail = waypoints.getDlWaypointDetail(); 
			
		}
 
		
		model.addAttribute("dlName", strDlName);
		model.addAttribute("waypoints", strWayPoint);
		model.addAttribute("waypointsDetail", strWayPointDetail);
		model.addAttribute("dlPk", dlPk);
		model.addAttribute("tmLat", tmLat);
		model.addAttribute("tmLng", tmLng);
		
		return "main/GCSMAIN3/gA03Main9";
	} 
	
	/**
	 * GCS > MAIN > PLAN
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	//@RequestMapping(value = "/gcs/dashboard/gA03Main2.do")
	@RequestMapping("/gcs/dashboard/gA03Main33.do")
	public String gA03Main33(@RequestParam Map<String, Object> param,@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
	  throws Exception{  
		
		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
		
		ModelAndView mav = new ModelAndView("jsonView");	 		
		EgovMap map = CommUtil.makeEgovMap(param); 

		String tmLat = String.valueOf(map.get("tmLat"));
		String tmLng = String.valueOf(map.get("tmLng"));
		 
		
		String dlPk = gA03MAINVO.getDlPk();
		LOGGER.debug("gA03Main2 : {}", dlPk);
		
		GA03MAINVO waypoints     = null;
		String strWayPoint       = "";
		String strWayPointDetail = ""; 
		//오늘 날짜
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmm");
		Date time = new Date();
		String time1 = format1.format(time);
		
		String strDlName         = "Route_"+time1;
		if(dlPk !=null && !dlPk.equals("")) {
			//파라미터 수신데이터
			GA03MAINVO vo = new GA03MAINVO();
			vo.setDlPk(dlPk);
			waypoints         = gA03MAINService.selectWaypoint(vo);
			strDlName         = waypoints.getDlName();
			strWayPoint       = waypoints.getDlWaypoint();  
			strWayPointDetail = waypoints.getDlWaypointDetail(); 
			
		}
 
		
		model.addAttribute("dlName", strDlName);
		model.addAttribute("waypoints", strWayPoint);
		model.addAttribute("waypointsDetail", strWayPointDetail);
		model.addAttribute("dlPk", dlPk); 
		model.addAttribute("tmLat", tmLat);
		model.addAttribute("tmLng", tmLng);
		
		return "main/GCSMAIN3/gA03Main33";
	} 
	
	
	@RequestMapping("/gcs/dashboard/gA03Main3.do")
	public ModelAndView gA03Main3(@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
	  throws Exception{  
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
 
		
		String dlPk = gA03MAINVO.getDlPk();
		String dlName = gA03MAINVO.getDlName();
		LOGGER.debug("gA03Main2 : {}", dlPk);
	    HashMap<String, Object> paramMap = new HashMap<String, Object>();
	    paramMap.put("DL_PK", dlPk);
	    paramMap.put("DL_NAME", dlName);
	    
		GA03MAINVO waypoints = null;
		String strWayPoint = "";
		String dlWaypointDetail = ""; 
		
	    if(dlPk!=null && dlName !=null) {
	    	gA03MAINService.insertDrone(paramMap); 
	    	
	    	//
	    	GA03MAINVO vo = new GA03MAINVO();
	    	vo.setDlPk(dlPk);
			waypoints = gA03MAINService.selectWaypoint(vo); 
			strWayPoint = waypoints.getDlWaypoint(); 
			dlWaypointDetail = waypoints.getDlWaypointDetail();
	    }
	    
 
	    mav.addObject("waypoints", strWayPoint);
	    mav.addObject("dlWaypointDetail", dlWaypointDetail);
		mav.addObject("result", "success");
		 
		return mav;
	} 
	
	
	@RequestMapping("/gcs/dashboard/gA03Main32.do")
	public ModelAndView gA03Main32(@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
	  throws Exception{  
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
 
		
		String dlPk = gA03MAINVO.getDlPk();
		String dlName = gA03MAINVO.getDlName();
		LOGGER.debug("gA03Main2 : {}", dlPk);
	    HashMap<String, Object> paramMap = new HashMap<String, Object>();
	    paramMap.put("DL_PK", dlPk);
	    paramMap.put("DL_NAME", dlName);
	    
		GA03MAINVO waypoints = null;
		String strWayPoint = "";
		String dlWaypointDetail = ""; 
		
	    if(dlPk!=null && dlName !=null) {
	    	gA03MAINService.insertDrone(paramMap); 
	    	
	    	//
	    	GA03MAINVO vo = new GA03MAINVO();
	    	vo.setDlPk(dlPk);
			waypoints = gA03MAINService.selectWaypoint2(vo);  
			strWayPoint = waypoints.getDlWaypoint(); 
			dlWaypointDetail = waypoints.getDlWaypointDetail();
	    }
	    
 
	    mav.addObject("waypoints", strWayPoint);
	    mav.addObject("dlWaypointDetail", dlWaypointDetail);
		mav.addObject("result", "success");
		 
		return mav;
	} 
	
	/**
	 * GCS > DASHBOARD > 드론 상태정보
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	
	@RequestMapping("/gcs/dashboard/selectDroneList.do")
	public @ResponseBody ModelAndView selectDroneList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		 
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		 	 		
		ModelAndView mav = new ModelAndView("jsonView"); 		
		EgovMap map = CommUtil.makeEgovMap(param); 

		String aiUse = String.valueOf(map.get("aiUse"));
		
		
		DeviceVO vo = new DeviceVO();
		
		if(aiUse!=null && aiUse !="null" && aiUse != "") {
			vo.setAiUse(aiUse);
		}
		 
		List<DeviceVO> list = null;
		int total = 0;
		try {
			list    = gA03MAINService.selectDroneList(vo); 
			total   = gA03MAINService.selectDroneListCnt(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		


 
 
	    mav.addObject("list", list);
	    mav.addObject("total", total);
		 
		 
		return mav;
	} 
	
	/**
	 * GCS > DASHBOARD > 드론 상태정보
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	
	@RequestMapping("/gcs/dashboard/actionSimulator.do")
	public @ResponseBody ModelAndView actionSimulator(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		 
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		 	 		
		ModelAndView mav = new ModelAndView("jsonView"); 		
		EgovMap map = CommUtil.makeEgovMap(param); 

		String droneName = String.valueOf(map.get("droneName"));
		
    	System.out.println("Python Call");
        String[] command = new String[4]; 
        command[0] = "/home/ubuntu/ardupilot/Tools/autotest/sim_vehicle.py -L KW -v ArduCopter --out=udpout:127.0.0.1:14540 --out=udpout:127.0.0.1:14541 --out=udpout:10.8.0.2:14542";
        //command[2] = "10";
        //command[3] = "20";
        try {
            execPython(command);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		LOGGER.debug("actionSimulator Start : {}", droneName);
	    mav.addObject("total", 1);
		 
		 
		return mav;
	} 
	
    public static void execPython(String[] command) throws IOException, InterruptedException {
        CommandLine commandLine = CommandLine.parse(command[0]);
        for (int i = 1, n = command.length; i < n; i++) {
            commandLine.addArgument(command[i]);
        }

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        PumpStreamHandler pumpStreamHandler = new PumpStreamHandler(outputStream);
        DefaultExecutor executor = new DefaultExecutor();
        executor.setStreamHandler(pumpStreamHandler);
        int result = executor.execute(commandLine);
        System.out.println("result: " + result);
        System.out.println("output: " + outputStream.toString());

    }    
	
	/**
	 * GCS > DASHBOARD > Drone Aricraft
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * DRONE LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/dashboard/gA034Main.do") 
	public String gA034Main(@ModelAttribute("gA03MAINAIRVO") GA03MAINAIRVO gA03MAINAIRVO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/GCSMAIN3/gA034Main";
	}
	
	/**
	 * GCS > DASHBOARD > Drone Aricraft Write
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * DRONE write
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/gcs/dashboard/gA034MainWrite.do")
	public String gA034MainWrite(@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,HttpServletRequest request, ModelMap model)
			  throws Exception{  

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    	
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();
    	
    	String aiPk = gA03MAINVO.getDlPk();
		LOGGER.debug("dlPk : {}", aiPk);
	 
		model.addAttribute("aiPk", gA03MAINVO.getDlPk());
		 
		return "main/GCSMAIN3/gA034MainWrite";
	}
	
    @RequestMapping(value = "/gcs/dashboard/gA034MainWriteData.do", method = RequestMethod.POST)
    public @ResponseBody ModelAndView gA034MainWriteData(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
 
		String aiPk          = (String) map.get("aiPk"); 
		

  
		if(aiPk !=null && aiPk != "") {
			paramMap.put("aiPk", aiPk);
		}
	 
		DeviceVO deviceVO = new DeviceVO();
		deviceVO.setAiAgency("ddd");
		
		HashMap<String, Object> resultMap = null;
		if(aiPk !=null && aiPk != "") {
			paramMap.put("aiPk", aiPk);
			resultMap = gA034MainService.GA034MainDetail(paramMap);
		}
		
		mav.addObject("list", resultMap);
		
		LOGGER.debug("gA034MainWriteData: {}",resultMap); 

		return mav;
	}
	 
    	
    @RequestMapping(value = "/gcs/dashboard/gA034MainWriteInsert.do", method = RequestMethod.POST)
    public @ResponseBody ModelAndView gA034MainWriteInsert(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
 
		String aiPk           = (String) map.get("aiPk");
		String aiDeviceName   = (String) map.get("aiDeviceName");
		String aiDeviceAlias  = (String) map.get("aiDeviceAlias");
		String aiDeviceType   = (String) map.get("aiDeviceType");
		String aiAgency       = (String) map.get("aiAgency");
		String aiRegisterId   = (String) map.get("aiRegisterId");
		String aiMemo         = (String) map.get("aiMemo");
		String userId         = (String) user.getId();
		
		paramMap.put("userId", userId);
		
		if(aiPk !=null && aiPk != "") {
			paramMap.put("aiPk", aiPk);
		}
		
		if(aiDeviceName !=null && aiDeviceName != "") {
			paramMap.put("aiDeviceName", aiDeviceName);
		}
		
		if(aiDeviceAlias !=null && aiDeviceAlias != "") {
			paramMap.put("aiDeviceAlias", aiDeviceAlias);
		}
		
		if(aiDeviceType !=null && aiDeviceType != "") {
			paramMap.put("aiDeviceType", aiDeviceType);
		}
		
		if(aiAgency !=null && aiAgency != "") {
			paramMap.put("aiAgency", aiAgency);
		}
		
		if(aiRegisterId !=null && aiRegisterId != "") {
			paramMap.put("aiRegisterId", aiRegisterId);
		}
		
		if(aiMemo !=null && aiMemo != "") {
			paramMap.put("aiMemo", aiMemo);
		}
		
		DeviceVO deviceVO = new DeviceVO();
		deviceVO.setAiAgency("ddd");
		
		int result = 0;
		HashMap<String, Object> resultMap = null;
		try {
			if(aiPk !=null && aiPk != "") {
				// update
				result = gA034MainService.GA034MainUpdate(paramMap);
				resultMap = gA034MainService.GA034MainDetail(paramMap);
				resultMap.put("mode", "edit");
			 
			}else {
				// insert
				result = gA034MainService.GA034MainInsert(paramMap);
				paramMap.put("aiPk", result);
				resultMap = gA034MainService.GA034MainDetail(paramMap);
				resultMap.put("mode", "insert");
			}
	 
			 
		} catch (Exception e) {
			// TODO: handle exception
		} 
		
		mav.addObject("list", resultMap);
		
		LOGGER.debug("selectTaskProcess: {}",resultMap); 

		return mav;
	}
    
    @RequestMapping(value = "/gcs/dashboard/gA034MainDelete.do", method = RequestMethod.POST)
    public @ResponseBody ModelAndView gA034MainDelete(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
 
		String aiPk          = (String) map.get("aiPk");  
 
		
		if(aiPk !=null && aiPk != "") {
			paramMap.put("aiPk", aiPk);
		}
		 
	 
		int result = 0;
		HashMap<String, Object> resultMap = null;
		try {
			if(aiPk !=null && aiPk != "") {
				// update
				result = gA034MainService.GA034MainDelete(paramMap); 
				resultMap.put("mode", "delete");
			 
			} 
	 
			 
		} catch (Exception e) {
			// TODO: handle exception
		} 
		 
		LOGGER.debug("gA034MainDelete: {}","gA034MainDelete"); 

		return mav;
	}
    
    @RequestMapping(value = "/gcs/dashboard/gA03MainDelete.do", method = RequestMethod.POST)
    public @ResponseBody ModelAndView gA03MainDelete(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
	 
 
		String dlPk          = (String) map.get("dlPk");  
 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		if(dlPk !=null && dlPk != "") {
			paramMap.put("dlPk", dlPk);
		}
		 
	 
		int result = 0;
		HashMap<String, Object> resultMap = null;
		try {
			if(dlPk !=null && dlPk != "") {
				// update
				result = gA034MainService.GA03MainDelete(paramMap); 
				resultMap.put("mode", "delete");
			 
			} 
	 
			 
		} catch (Exception e) {
			// TODO: handle exception
		} 
		 
		LOGGER.debug("gA03MainDelete: {}","gA03MainDelete"); 

		return mav;
	}
	
	
	@RequestMapping("/gcs/dashboard/gA035Main.do")
	public String gA035Main(@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
		return "main/GCSMAIN3/gA035Main";
	}
	
	@RequestMapping("/gcs/dashboard/gA036Main.do")
	public String gA036Main(@ModelAttribute("gA03MAINUSERVO") GA03MAINUSERVO gA03MAINUSERVO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}

		return "main/GCSMAIN3/gA036Main";
	}
	
	 
	@RequestMapping("/gcs/dashboard/gA0341Main.do")
    public String gA0341Main(@ModelAttribute("gA03MAINVO") GA03MAINVO gA03MAINVO,MultipartHttpServletRequest mtfRequest, ModelMap model,HttpServletRequest request) {

        String dlPk = mtfRequest.getParameter("dlPk").trim(); 
        
        if(dlPk!=null && dlPk.length() != 0) {
        	//update
        	updategA0341Main(mtfRequest,request);
        	
        }else {
        	//insert
        	insertgA0341Main(mtfRequest,request);
        }
         

		return "redirect:/gcs/dashboard/gA031Main.do";
    }
	
	public void updategA0341Main(MultipartHttpServletRequest mtfRequest,HttpServletRequest request) {
        List<MultipartFile> fileList = mtfRequest.getFiles("file");
        String dlName = mtfRequest.getParameter("dlName");
        String dlNameEtc = mtfRequest.getParameter("dlNameEtc"); 
        String addr = mtfRequest.getParameter("addr"); 
        String dlPk = mtfRequest.getParameter("dlPk"); 
        
	    LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
	    String user_id = user.getMbCode();
        
        HashMap<String, Object> tmStr = new HashMap<String, Object>();
        tmStr.put("DL_PK", dlPk);
        tmStr.put("DL_NAME", dlName);
        tmStr.put("DL_NAME_ETC", dlNameEtc);
        tmStr.put("DL_USER_ID", user_id); 
    
        try {
        	gA03MAINService.updateDroneSwarmPk(tmStr);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
        
        
	}

    public void insertgA0341Main(MultipartHttpServletRequest mtfRequest,HttpServletRequest request) {
        List<MultipartFile> fileList = mtfRequest.getFiles("file");
        String dlName = mtfRequest.getParameter("dlName");
        String dlNameEtc = mtfRequest.getParameter("dlNameEtc"); 
        String addr = mtfRequest.getParameter("addr"); 
        
	    LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
	    String user_id = user.getMbCode();

        GA03MAINVO tmStr = new GA03MAINVO();
        GA03MAINVO brDroneSwarmPk = null;
        try {
        	brDroneSwarmPk = gA03MAINService.selectDroneSwarmPk(tmStr);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
        
        //부모값 저장
        HashMap<String, Object> tmStr2 = new HashMap<String, Object>();
        tmStr2.put("DL_NAME_PK", brDroneSwarmPk.getDlNamePk());
        tmStr2.put("DL_NAME_ETC", dlNameEtc);
        tmStr2.put("DL_NAME", dlName); 
        tmStr2.put("DL_USER_ID", user_id); 
         
        int insertDrone = 0;
        
        try {
			insertDrone = gA03MAINService.insertDroneSwarmPk(tmStr2);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
         
		String path = "\\home\\samsungdrone2\\";
		String coverted = "";
	    HashMap<String, Object> paramMap = new HashMap<String, Object>();
	    JSONObject jObject = null;
	    JSONObject home = null;
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            
            try {
				coverted = new String(mf.getBytes());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

            //System.out.println("originFileName : " + originFileName);
            //System.out.println("fileSize : " + fileSize);
            LOGGER.debug("gA03Main41 : {}", coverted);
            jObject = new JSONObject(coverted);
            LOGGER.debug("gA03Main2Waypoint : {}", jObject.get("1"));
            home = new JSONObject(jObject.get("1"));
   
            
            paramMap.put("DL_NAME_PK", brDroneSwarmPk.getDlNamePk());
            paramMap.put("DL_NAME", dlName);
            paramMap.put("DL_PATH_NAME", originFileName);
            paramMap.put("DL_ADDR", addr);
            paramMap.put("DL_USER_ID", user_id);
            paramMap.put("DL_HOME_X", home.getInt("x"));
            paramMap.put("DL_HOME_Y", home.getInt("y"));
            paramMap.put("DL_HOME_Z", home.getInt("z"));
            paramMap.put("DL_WAYPOINT", coverted);  
            
 
            
            try {
				gA03MAINService.insertSwarmWaypoint(paramMap);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

            String safeFile = path + System.currentTimeMillis() + originFileName;
            try {
                //mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
	
	
	
	@RequestMapping(value = "/gcs/dashboard/gA03Main2Waypoint.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView gA03Main2Waypoint(@RequestParam Map<String, Object> param,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
	  
		String tmData             = String.valueOf(map.get("data"));	
		String addr               = String.valueOf(map.get("addr"));
		String dlPk               = String.valueOf(map.get("dlPk"));
		String missionNmae        = String.valueOf(map.get("missionNmae"));
		String waypointsDetail    = String.valueOf(map.get("jsonObj2"));
		
		LOGGER.debug("waypointsDetail : {}", waypointsDetail);  
		
		LOGGER.debug("gA03Main2Waypoint : {}", tmData);
		
	    JSONObject jObject = new JSONObject(tmData);   
	    LOGGER.debug("gA03Main2Waypoint : {}", jObject.get("creationTime"));
 
	    
	    //home 
	    JSONObject home = new JSONObject(jObject.getStr("home"));
	    JSONArray coordinateArry = new JSONArray(home.getStr("coordinate"));
	    String home_x = coordinateArry.get(0).toString();
	    String home_y = coordinateArry.get(1).toString();
	    
	    LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
	    String user_id = user.getMbCode();
	 
	    String waypoints = tmData;
	    String create_time = jObject.getStr("creationTime");
 
	    
	    HashMap<String, Object> paramMap = new HashMap<String, Object>();
	    paramMap.put("DL_NAME", missionNmae);
	    paramMap.put("DL_USER_ID", user_id);
	    paramMap.put("DL_HOME_X", home_x);
	    paramMap.put("DL_HOME_Y", home_y);
	    paramMap.put("DL_WAYPOINT", waypoints);
	    paramMap.put("DL_WAYPOINT_DETAIL", waypointsDetail);
	    paramMap.put("DL_CREATE_TIME", create_time); 
	    paramMap.put("DL_ADDR", addr); 
	    if(dlPk !=null && dlPk != "") {
	       paramMap.put("DL_PK", dlPk); 
	    }
	    
	    try {
			if(dlPk !=null && dlPk != "") {
				gA03MAINService.updateWaypoint(paramMap); 
			}else {
				gA03MAINService.insertWaypoint(paramMap);
			}
	    	
		} catch (IllegalAccessException e) {
			// TODO: handle exception
			e.printStackTrace(); 
		}catch (InvocationTargetException e) {
			// TODO: handle exception
			e.getTargetException().printStackTrace();
		}
	     
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
	@RequestMapping(value = "/gcs/dashboard/gA03Main2List.do", method = RequestMethod.POST)
	@CrossOrigin(origins = "*")
	public @ResponseBody ModelAndView gA03Main2List(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String page = String.valueOf(map.get("page")); 
		
		//파라미터 수신데이터
		GA03MAINVO vo = new GA03MAINVO();
		
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
	@RequestMapping(value = "/gcs/dashboard/gA034MainList.do", method = RequestMethod.POST)
    @CrossOrigin(origins = "*")
	public @ResponseBody ModelAndView gA034MainList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String page = String.valueOf(map.get("page")); 
		
		//파라미터 수신데이터
		GA03MAINAIRVO vo = new GA03MAINAIRVO();
		
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
	 
		
		List<GA03MAINAIRVO> list = null;
		int totalCnt = 0; 
		try {
			
			list = gA03MAINAIRService.selectAirList(vo);
			totalCnt = gA03MAINAIRService.selectAirListCnt(vo);
			
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
	
	@RequestMapping(value = "/gcs/dashboard/getDroneList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getDroneList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
 
		
		//파라미터 수신데이터
		GA03MAINAIRVO vo = new GA03MAINAIRVO();
		
	  
		
		List<GA03MAINAIRVO> list = null; 
		try {			
			list = gA03MAINAIRService.getDroneList(vo);		  
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		 
		LOGGER.debug("getDroneList: {}",list);
		mav.addObject("list", list);
		 
		return mav;
	}
	
	@RequestMapping(value = "/gcs/dashboard/getDroneMission.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getDroneMission(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
 
		
		//파라미터 수신데이터
		GA03MAINAIRVO vo = new GA03MAINAIRVO();
		
	  
		
		List<GA03MAINAIRVO> list = null;  
		try {			
			list = gA03MAINAIRService.getDroneMission(vo);		  
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		 
		LOGGER.debug("getDroneList: {}",list);
		mav.addObject("list", list);
		 
		return mav;
	}
	
	@RequestMapping(value = "/gcs/dashboard/getDroneAction.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getDroneAction(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param);  

		String searchDroneCnt    = String.valueOf(map.get("droneCnt")); 
		String searchDroneAction = String.valueOf(map.get("droneAction"));
		
		//파라미터 수신데이터
		GA03MAINAIRVO vo = new GA03MAINAIRVO();
		
	    if(searchDroneCnt !=null && searchDroneCnt !="null" && searchDroneCnt !="") {
	    	vo.setSearchDroneCnt(Integer.parseInt(searchDroneCnt));
	    }
	    if(searchDroneAction !=null && searchDroneAction !="null" && searchDroneAction !="") {
	    	vo.setSearchDroneAction(searchDroneAction);
	    }
		
		List<GA03MAINAIRVO> list = null;  
		try {			
			list = gA03MAINAIRService.getDroneAction(vo);		  
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		 
		LOGGER.debug("getDroneList: {}",list);
		mav.addObject("list", list);
		 
		return mav;
	}
	
	
	@RequestMapping(value = "/gcs/dashboard/gA034MainList2.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView gA034MainList2(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		//파라미터 수신데이터
		GA03MAINAIRVO vo = new GA03MAINAIRVO();
		
		List<GA03MAINAIRVO> list = null;
		try {
			
			list = gA03MAINAIRService.selectAirList2(vo);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		
 
		
		LOGGER.debug("gA034MainList2: {}",list);
		mav.addObject("list", list);
		 
		
		return mav;
	}
	
	@RequestMapping(value = "/gcs/dashboard/gA034MainYNUpdate.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView gA034MainYNUpdate(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String aiPk = String.valueOf(map.get("aiPk")); 
		String aiUse = String.valueOf(map.get("aiUse")); 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
	 
	 
		if(aiPk !=null && aiPk !="") { 
			paramMap.put("aiPk", aiPk);
		}		

		if(aiUse !=null && aiUse !="") { 
			paramMap.put("aiUse", aiUse);
		}
		

		int resultCnt = 0; 
		try {
			
			resultCnt = gA034MainService.gA034MainYNUpdate(paramMap);
		 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		
 
		
		LOGGER.debug("gA034MainUpdate: {}",resultCnt); 
		
		mav.addObject("result", resultCnt); 
		
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
	@RequestMapping(value = "/gcs/dashboard/gA035MainList.do", method = RequestMethod.POST)
	@CrossOrigin(origins = "*")
	public @ResponseBody ModelAndView gA035MainList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String page = String.valueOf(map.get("page")); 
		
		//파라미터 수신데이터
		GA03MAINUSERVO vo = new GA03MAINUSERVO();
		
		if(page !=null && page != "null" && page !="") {
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
	 
		
		List<GA03MAINUSERVO> list = null;
		int totalCnt = 0;
		int resultCnt = 0; 
		try {
			
			list = gA03MAINUSERService.selectUserList(vo);
			resultCnt = gA03MAINUSERService.selectUserListCnt(vo);
			
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
	 * GCS > MAIN > 군집드론 공연목록 리스트
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping(value = "/gcs/dashboard/gA031MainList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView gA031MainList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String page = String.valueOf(map.get("page")); 
		
		//파라미터 수신데이터
		GA03MAINVO vo = new GA03MAINVO();
		
		if(user !=null && user.getMbCode() !="") { 
			vo.setDlUserId(user.getMbCode());
		}
		
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
			
			list = gA03MAINService.selectWaypointSwarmList(vo);
			resultCnt = gA03MAINService.selectWaypointSwarmListCnt(vo);
			
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
	
	
	
}
