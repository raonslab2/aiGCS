package egovframework.or.kr.EMAU00A.web;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.icu.text.SimpleDateFormat;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.or.kr.EMAU00A.service.DashboardVO;
import egovframework.or.kr.EMAU00A.service.EMAU00A01Service;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00H.EMAU00H1VO;
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
public class EMAU00A01Controller {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovFileMngUtil.class);
	
	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00A01Service")
    private EMAU00A01Service eMAU00A01Service;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
 

	/**
	 * 스케줄관리 > 년간
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/gcs/dashboard/eMAU00A01Main.do")
	public String eMAU00A01Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/dashboard01Page";
	} 
	
	/**
	 * 스케줄관리 > 년간
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A011Main.do")
	public String eMAU00A011Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/dashboard01Page2";
	} 
	
	@RequestMapping(value = "/empo/dashboard/eMAU00A0101Task.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00A0101Task(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		DashboardVO vo = new DashboardVO();
		String searchGubun = (String) map.get("searchGubun");
		String searchToday = (String) map.get("searchToday");
		String pjGubun = (String) map.get("pjGubun");
		
		if(searchGubun == null || searchGubun.equals("")) {
			searchGubun = "1";
		}
		
		if(searchGubun !=null && searchGubun != "") {
			vo.setSearchGubun(searchGubun);
		}
		
		if(searchToday !=null && searchToday != "") {
			vo.setSearchToday(searchToday);
		}
		 
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMbCode(user.getMbCode());
		
		vo.setGrmCode(user.getGrmCode());
		vo.setPjGubun(pjGubun);
		
		//기준일자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Calendar c1 = Calendar.getInstance();
        String pjYear = sdf.format(c1.getTime());
        vo.setPjYear(pjYear);
        
 
	 
		List<DashboardVO> list = null;
  
		try {
			if(searchGubun != null && searchGubun.equals("1")  ) {
				list = eMAU00A01Service.selectTask(vo);
			}else if(searchGubun != null && searchGubun.equals("2") ) {
				list = eMAU00A01Service.selectTask2(vo);
			}else if(searchGubun != null && searchGubun.equals("3") ) {
				list = eMAU00A01Service.selectTask3(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LOGGER.debug("eMAU00B01DetailList: {}",list);
		mav.addObject("list", list);
		 
		return mav;
	}
	
	@RequestMapping(value = "/empo/dashboard/eMAU00A0101TaskProcess.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00A0101TaskProcess(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		DashboardVO vo = new DashboardVO();
		String searchPjCode = (String) map.get("searchPjCode");
		String searchToday = (String) map.get("searchToday");
		
		
		if(searchPjCode !=null && searchPjCode != "") {
			vo.setSearchPjCode(searchPjCode);
		}
		
		if(searchToday !=null && searchToday != "") {
			vo.setSearchToday(searchToday);
		}
		
		List<DashboardVO> list = null;
		
		try {
			if(searchPjCode != null && !searchPjCode.equals("")  ) {
				list = eMAU00A01Service.selectTaskProcess(vo);
			}  
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LOGGER.debug("selectTaskProcess: {}",list);
		mav.addObject("list", list);
		

		
		return mav;
	}
	
	/**
	 * 스케줄관리 > Task detail
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A0101TaskDetail.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00A0101TaskDetail(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		DashboardVO vo = new DashboardVO();
		String searchPjCode = (String) map.get("searchPjCode");
		String searchToday = (String) map.get("searchToday");
		String searchPjStart = (String) map.get("searchPjStart");
		
		
		if(searchPjCode !=null && searchPjCode != "") {
			vo.setSearchPjCode(searchPjCode);
		}
		
		if(searchToday !=null && searchToday != "") {
			vo.setSearchToday(searchToday);
		}
		
		if(searchPjStart !=null && searchPjStart != "") {
			vo.setSearchPjStart(searchPjStart);
		}
		
		List<DashboardVO> list = null;
		
		try {
			if(searchPjCode != null && !searchPjCode.equals("")  ) {
				list = eMAU00A01Service.selectTaskDetail(vo);
			}  
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		List<DashboardVO> checkList = null;
		if(list !=null) {
			for (DashboardVO dashboardVO : list) {
				checkList = selectCheckList(dashboardVO.getPcName()); 
			}
		}
		
		
		
		LOGGER.debug("eMAU00A0101TaskDetail: {}",list);
		mav.addObject("list", list);
		mav.addObject("checkList", checkList);
		
		return mav;
	}
	
	/**
	 * 스케줄관리 > CheckList
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	private List<DashboardVO> selectCheckList(String pcName) {
		DashboardVO vo = new DashboardVO(); 
		vo.setPcName(pcName);
		
		List<DashboardVO> tmList = null;
		try {
			tmList = eMAU00A01Service.selectCheckList(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return tmList;
	}
	
	
	
	/**
	 * 스케줄관리 > 담당간사 지원요청 수량
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/selectPjRequest.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectPjRequest(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		DashboardVO vo = new DashboardVO(); 
		String searchToday = (String) map.get("searchToday");
		
		String gsPk = (String) map.get("gsPk");
		
		
		
		if(searchToday !=null && searchToday != "") {
			vo.setSearchToday(searchToday);
		}
		
		if(gsPk !=null && gsPk != "") {
			vo.setGsPk(gsPk);
		}
		
		//조회 사용자
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMbCode(user.getMbCode());		
		vo.setGrmCode(user.getGrmCode());
		
		List<DashboardVO> list = null;
		
		try {
			list = eMAU00A01Service.selectPjRequest(vo); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

		
		LOGGER.debug("eMAU00A0101TaskDetail: {}",list);
		mav.addObject("list", list);
		mav.addObject("listCnt", list.size());
		
		return mav;
	}
	
	/**
	 * 스케줄관리 > 담당간사 지원요청 응답
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/selectPjRequest2.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectPjRequest2(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		DashboardVO vo = new DashboardVO(); 
		String searchToday = (String) map.get("searchToday");
		
		String gsPk = (String) map.get("gsPk");
		
		
		
		if(searchToday !=null && searchToday != "") {
			vo.setSearchToday(searchToday);
		}
		
		if(gsPk !=null && gsPk != "") {
			vo.setGsPk(gsPk);
		}
		
		//조회 사용자
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMbCode(user.getMbCode());		
		vo.setGrmCode(user.getGrmCode());
		
		List<DashboardVO> list = null;
		
		try {
			list = eMAU00A01Service.selectPjRequest2(vo); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		  
		LOGGER.debug("eMAU00A0101TaskDetail: {}",list);
		mav.addObject("list", list);
		mav.addObject("listCnt", list.size());
		 
		return mav;
	}
	
	/**
	 * 스케줄관리 > 알림
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/selectNotice.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectNotice(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		DashboardVO vo = new DashboardVO(); 
		String searchStart = (String) map.get("searchStart");
		String searchEnd = (String) map.get("searchEnd");
		String noticeRow = (String) map.get("noticeRow");
		
		if(searchStart !=null && searchStart != "") {
			vo.setSearchStart(searchStart);
		}
		if(searchEnd !=null && searchEnd != "") {
			vo.setSearchEnd(searchEnd);
		}
		if(noticeRow !=null && noticeRow != "") {
			int noticeRow1 = Integer.parseInt(noticeRow);
			vo.setFirstIndex(noticeRow1);
			vo.setRecordCountPerPage(1);
		}
		
		//조회 사용자
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMbCode(user.getMbCode());		
		vo.setGrmCode(user.getGrmCode());
		
		List<DashboardVO> list = null;
		
		try {
			list = eMAU00A01Service.selectNotice(vo); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

		
		LOGGER.debug("eMAU00A0101TaskDetail: {}",list);
		mav.addObject("list", list);
		
		return mav;
	}
	
	/**
	 * 스케줄관리 > 알림 삭제
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/deleteNotice.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView deleteNotice(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		Map<String, Object> mapData = new HashMap<>();
		String noPk = (String) map.get("noPk");
		 
		
		if(noPk !=null && noPk != "") {
			mapData.put("noPk", noPk);
		}
		 
		
		int result = 0;
		
		try {
			result = eMAU00A01Service.deleteNotice(mapData); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

		
		LOGGER.debug("eMAU00A0101TaskDetail: {}",result);
		mav.addObject("result", result);
		
		return mav;
	}
	
	
	/**
	 * 데시보드 > 통계정보
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A0101Sum.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00A0101Sum(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		
		String page = String.valueOf(map.get("page"));		
		String grmCode = user.getGrmCode(); 
  
		DashboardVO vo = new DashboardVO();
        //vo.setPjYear(searchYy); 
        
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		//availableVO.setPageUnit(propertyService.getInt("pageUnit"));
		//availableVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	 
		List<DashboardVO> list = null;
		int totalCnt = 0;
		int resultCnt = 0;		 
		try {
			list = eMAU00A01Service.sumPj(vo);
			resultCnt = eMAU00A01Service.sumPjCnt(vo);
			paginationInfo.setTotalRecordCount(resultCnt);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		totalCnt = list.size();
		
		mav.addObject("list", list);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("paginationInfo", paginationInfo);
		
		LOGGER.debug("eMAU00A0101Sum: {}",mav);
 
		

		
		return mav;
	}
	
	/**
	 * 데시보드 > 통계정보
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A0102Sum.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00A0102Sum(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		//기준일자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Calendar c1 = Calendar.getInstance();
        String pjYear = sdf.format(c1.getTime());
		 
		String grmCode = user.getGrmCode(); 
		HashMap<String, Object> vo = new HashMap<String, Object>();
		vo.put("busiYy", pjYear);
		 
		HashMap<String, Object> dashListSum = null;
		try {
			dashListSum = eMAU00A01Service.selectAcntList(vo); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LOGGER.debug("eMAU00A0101Sum: {}",mav);
 
		mav.addObject("list", dashListSum);

		
		return mav;
	}
	
	
	
	
	/**
	 * 스케줄관리 > 전체보기
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A0101Main.do")
	public String eMAU00A0101Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/dashboard0101Page";
	} 
	
	
	/**
	 * 스케줄관리 > 담당간사 지원요청
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A01work00101.do")
	public String eMAU00A01work00101(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/work_001_01";
	} 
	
 
	
	/**
	 * 스케줄관리 > 전체보기 > Todo
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A0101TODO.do")
	public String eMAU00A0101TODO(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/todo_001";
	} 
	
	/**
	 * 스케줄관리 > 전체보기 > Todo
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A0102TODO.do")
	public String eMAU00A0102TODO(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/todo_002";
	} 
	
	
	/**
	 * 스케줄관리 > 전체보기 > 체크리스트 추가
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A01check00101.do")
	public String eMAU00A01check00101(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/check_001_01";
	} 
	
	 
	
	/**
	 * 스케줄관리 > 전체보기 > Todo
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A0101check00101.do")
	public String eMAU00A0101check00101(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/check_001_01";
	} 
	
	
	@RequestMapping(value = "/empo/dashboard/eMAU00A010100101schedule.do")
	public String eMAU00A0101dash00101schedule(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/dash_001_01_schedule";
	} 
	
	
	
	@RequestMapping(value = "/empo/dashboard/eMAU00A010100102.do")
	public String eMAU00A010100102(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/dash_001_02"; 
	} 
	
	
	
	
	
	
	
	
	/**
	 * 스케줄관리 > 전체보기
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A01Popup.do")
	public String eMAU00A01Popup(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/dashboard01Popup";
	} 
	
	/**
	 * 스케줄관리 > 주간전체
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A0101popup.do")
	public String eMAU00A0101popup(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/dashboard0101popup";
	} 
	
	/**
	 * 스케줄관리 > 월간
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A02Main.do")
	public String eMAU00A02Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  


		return "main/dashboard/dashboard02Page";
	} 
	
	/**
	 * 스케줄관리 > 월간
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/dashboard/eMAU00A03Main.do")
	public String eMAU00A03Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  

		return "main/dashboard/dashboard03Page";
	} 
	
	@RequestMapping(value = "/empo/dashboard/dashboardWork.do")
	public String dashboardWork(HttpServletRequest request, ModelMap model)
	  throws Exception{
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
  
		return "main/dashboard/dashboard_work";
	} 
	
	
	@RequestMapping(value = "/empo/dashboard/popupDetail.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView popupDetail(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		//LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		
		String page = String.valueOf(map.get("page1"));		
		//String grmCode = user.getGrmCode(); 
  
		String searchYear = String.valueOf(map.get("searchYear"));	
		String searchName = (String) map.get("searchName");
		
		EmpjVO vo = new EmpjVO();
        //vo.setPjYear(searchYy); 
        
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		
		//availableVO.setPageUnit(propertyService.getInt("pageUnit"));
		//availableVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		List<EmpjVO> list = null;
		int resultCnt = 0;
		int totalCnt = 0;
				 
		try {
			list = eMAU00A01Service.popupDetail(vo);
			resultCnt = eMAU00A01Service.popupDetailCnt(vo);
			paginationInfo.setTotalRecordCount(resultCnt);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		//totalCnt = list.size();
		
		mav.addObject("list", list);
		//mav.addObject("totalCnt", totalCnt);
		mav.addObject("paginationInfo", paginationInfo);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/dashboard/eMAU00A0101DIINFO", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00A0101DIINFO(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");

		List<DashboardVO> list = null;
		try {
			list = eMAU00A01Service.eMAU00A0101DIINFO(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		System.out.println(list);

		mav.addObject("list", list);
		return mav;
	}
	
	
}