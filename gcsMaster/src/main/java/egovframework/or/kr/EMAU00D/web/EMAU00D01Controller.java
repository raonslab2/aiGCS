package egovframework.or.kr.EMAU00D.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import egovframework.let.cop.com.service.EgovBBSUseInfoManageService;
import egovframework.or.kr.EMAU00D.service.EMAU00D01Service;
import egovframework.or.kr.EMAU00D.service.EmauHolidayVO;
import egovframework.or.kr.EMAU00D.service.EmauProcessVO;
import egovframework.or.kr.EMAU00F.service.EmauProjectVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.or.kr.com.utill.EmpiUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
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
public class EMAU00D01Controller {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovFileMngUtil.class);
	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "eMAU00D01Service")
	private EMAU00D01Service eMAU00D01Service;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	/** EgovBBSUseInfoManageService */
	@Resource(name = "EgovBBSUseInfoManageService")
	private EgovBBSUseInfoManageService bbsUseService;

	/**
	 * 프로세스 관리  - 프로세스 매핑 (페이지)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D01Main.do")
	public String eMAU00D01Main(HttpServletRequest request, ModelMap model) throws Exception {
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}

		return "main/process/process01Page";
	}
	
	@RequestMapping(value = "/empo/process/processGetPopup.do")
	public String processGetPopup(HttpServletRequest request, ModelMap model) throws Exception {
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/process/processGetPopup";
	}
	
	@RequestMapping(value = "/empo/process/loginUserProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView loginUserProjectList(@RequestParam Map<String, Object> param,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		String pjYear = (String) param.get("pjYear");
		
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		user.setPjYear(pjYear);
		
		List<EmmbgroupVO> list = null;
		try {
			list = eMAU00D01Service.loginUserProjectList(user);
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
		
		mav.addObject("list", list);
		mav.addObject("mbCode", user.getMbCode());

		return mav;
	}

	@RequestMapping(value = "/empo/process/searchProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView searchProjectList(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("jsonView"); 
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String pjYear = (String) map.get("pjYear");
		String pjTitle = (String) map.get("pjTitle");
		String grmCode = user.getGrmCode();
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjYear!=null && !pjYear.equals("")) {
			paramMap.put("pjYear", pjYear);
		}
		
		if(pjTitle!=null && !pjTitle.equals("")) {
			paramMap.put("pjTitle", pjTitle);
		}
		
		if(grmCode!=null && !grmCode.equals("")) {
			paramMap.put("grmCode", grmCode);
		}
		
		List<EmauProjectVO> list = null;
		try {
			list = eMAU00D01Service.searchProjectList(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/process/selectFetch.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView selectFetch(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String pjCode = (String) map.get("pjCode");
		String mbCode = (String) map.get("mbCode");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjCode!=null && !pjCode.equals("")) {
			paramMap.put("pjCode", pjCode);
		}
		
		if(mbCode!=null && !mbCode.equals("")) {
			paramMap.put("mbCode", mbCode);
		}
		
		int result = 0;
		try {
			result = eMAU00D01Service.selectFetch(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		
		mav.addObject("count", result);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/process/projectProcessMappingList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView projectProcessMappingList(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");

		EgovMap map = CommUtil.makeEgovMap(param); 
		String pjCode = (String) map.get("pjCode");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjCode!=null && !pjCode.equals("")) {
			paramMap.put("pjCode", pjCode);
		}
		
		List<EmauProcessVO> list = null;
		try {
			list = eMAU00D01Service.projectProcessMappingList(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	@RequestMapping(value = "/empo/process/processIsUse.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView processIsUse(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");

		System.out.println(param);
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String pjYear = (String) map.get("pjYear");
		String pjTitle = (String) map.get("pjTitle");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjYear!=null && !pjYear.equals("")) {
			paramMap.put("pjYear", pjYear);
		}
		
		if(pjTitle!=null && !pjTitle.equals("")) {
			paramMap.put("pjTitle", pjTitle);
		}
		
		HashMap<String, Object> resultMap = null;
		try {
			resultMap = eMAU00D01Service.processIsUse(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		
		mav.addObject("list", resultMap);

		return mav;
	}
	
	@RequestMapping(value = "/empo/process/projectProcessMappingSave.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView projectProcessMappingSave(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");

		EgovMap map = CommUtil.makeEgovMap(param); 
		System.out.println(map);
		
		String pjCode = (String) map.get("pjCode");
		String pcCode = (String) map.get("pcCode");
		String pcName = (String) map.get("pcName");
		String pcWorkPoint = (String) map.get("pcWorkPoint");
		String pcUse = (String) map.get("pcUse");
		String pcOrderBy  = (String) map.get("pcOrderBy");
		String pjCateCode = (String) map.get("pjCateCode");
		String pcDayStart = (String) map.get("pcDayStart");
		String pcDayEnd = (String) map.get("pcDayEnd");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjCode!=null && !pjCode.equals("")) {
			paramMap.put("pjCode", pjCode);
		}
		
		if(pcCode!=null && !pcCode.equals("")) {
			paramMap.put("pcCode", pcCode);
		}
		
		if(pcName!=null && !pcName.equals("")) {
			paramMap.put("pcName", pcName);
		}
		
		if(pcWorkPoint!=null && !pcWorkPoint.equals("")) {
			paramMap.put("pcWorkPoint", pcWorkPoint);
		}
		
		if(pcUse!=null && !pcUse.equals("")) {
			paramMap.put("pcUse", pcUse);
		}
		
		if(pcOrderBy!=null && !pcOrderBy.equals("")) {
			paramMap.put("pcOrderBy", pcOrderBy);
		}
		
		if(pjCateCode!=null && !pjCateCode.equals("")) {
			paramMap.put("pjCateCode", pjCateCode);
		}
		
		if(pcDayStart!=null && !pcDayStart.equals("")) {
			paramMap.put("pcDayStart", pcDayStart);
		}
		
		if(pcDayEnd!=null && !pcDayEnd.equals("")) {
			paramMap.put("pcDayEnd", pcDayEnd);
		}
		
		HashMap<String, Object> hasDataConfirm = null;
		int result = 0;
		try {
			hasDataConfirm = eMAU00D01Service.hasDataConfirm(paramMap);
			System.out.println(hasDataConfirm);
			
			if (hasDataConfirm != null) {
				paramMap.put("pjPk", hasDataConfirm.get("pjPk"));
				System.out.println(paramMap.size());
				if (paramMap.size() > 8) {
					result = eMAU00D01Service.projectProcessCheckDayUpdate(paramMap);
				} else {
					result = eMAU00D01Service.projectProcessCheckUpdate(paramMap);
				}
				mav.addObject("pjPk", hasDataConfirm.get("pjPk"));
//				
			} else {
				paramMap.put("pjPk", 0);
				System.out.println(paramMap.size());
//				result = eMAU00D01Service.projectProcessCheckInsert(paramMap);
				if (paramMap.size() > 8) {
					result = eMAU00D01Service.projectProcessCheckDayInsert(paramMap);
				} else {
					result = eMAU00D01Service.projectProcessCheckInsert(paramMap);
				}
				mav.addObject("pjPk", result);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/process/processGetSave.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView processGetSave(@RequestBody List<Map<String, Object>> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		List<Map<String, Object>> receive = param;
		
		System.out.println(receive);
		System.out.println(receive.size());
		
		int result = 0;
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		HashMap<String, Object> hasDataConfirm = null;
		try {
			for (int i = 0; i < receive.size(); i++ ) { 
				String pjCode = (String) receive.get(i).get("pjCode");
				String pcCode = String.valueOf(receive.get(i).get("pcCode"));
				String pcName = (String) receive.get(i).get("pcName");
				String pcOrderBy = String.valueOf(receive.get(i).get("pcOrderBy"));
				String pjCateCode = (String) receive.get(i).get("pjCateCode");
				String pcWorkPoint = (String) receive.get(i).get("pcWorkPoint");
				String pcUse = (String) receive.get(i).get("pcUse");
				String pcDayStart = (String) receive.get(i).get("pcDayStart");
				String pcDayEnd = (String) receive.get(i).get("pcDayEnd");
				
				
				if(pjCode!=null && ! pjCode.equals("")) {
					paramMap.put("pjCode", pjCode);
				}
				
				if(pcCode!=null && ! pcCode.equals("")) {
					paramMap.put("pcCode", pcCode);
				}
				
				if(pcName!=null && ! pcName.equals("")) {
					paramMap.put("pcName", pcName);
				}
				
				if(pcOrderBy!=null && ! pcOrderBy.equals("")) {
					paramMap.put("pcOrderBy", pcOrderBy);
				}
				
				if(pjCateCode!=null && ! pjCateCode.equals("")) {
					paramMap.put("pjCateCode", pjCateCode);
				}
				
				if(pcWorkPoint!=null && ! pcWorkPoint.equals("")) {
					paramMap.put("pcWorkPoint", pcWorkPoint);
				}
				
				if(pcUse!=null && ! pcUse.equals("")) {
					paramMap.put("pcUse", pcUse);
				}
				
				if(pcDayStart!=null && ! pcDayStart.equals("")) {
					paramMap.put("pcDayStart", pcDayStart);
				}
				
				if(pcDayEnd!=null && ! pcDayEnd.equals("")) {
					paramMap.put("pcDayEnd", pcDayEnd);
				}
				
				if(pcDayStart.equals("")) {
					paramMap.remove("pcDayStart");
				}
				
				if(pcDayEnd.equals("")) {
					paramMap.remove("pcDayEnd");
				}
				
				hasDataConfirm = eMAU00D01Service.hasDataConfirm(paramMap);
				System.out.println(hasDataConfirm);
				
				if (hasDataConfirm != null) {
					paramMap.put("pjPk", hasDataConfirm.get("pjPk"));
					result = eMAU00D01Service.projectProcessCheckDayUpdate(paramMap);
				} else {
					paramMap.put("pjPk", 0);
					result = eMAU00D01Service.projectProcessCheckDayInsert(paramMap);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/process/processMoveSave.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView processMoveSave(@RequestBody List<Map<String, Object>> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		List<Map<String, Object>> receive = param;
		
		System.out.println(receive);
		System.out.println(receive.size());
		
		int result = 0;
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		try {
			for (int i = 0; i < receive.size(); i++ ) { 
				String pcCode = String.valueOf(receive.get(i).get("pcCode"));
				String pcOrderBy = String.valueOf(receive.get(i).get("pcOrderBy"));
				String subPcCode = String.valueOf(receive.get(i).get("subPcCode"));
				String subPcPCode = String.valueOf(receive.get(i).get("subPcPCode"));
				String subPcOrderBy = String.valueOf(receive.get(i).get("subPcOrderBy"));
				
				if(pcCode!=null && ! pcCode.equals("")) {
					paramMap.put("pcCode", pcCode);
				}
				
				if(pcOrderBy!=null && ! pcOrderBy.equals("")) {
					paramMap.put("pcOrderBy", pcOrderBy);
				}
				
				if(subPcCode!=null && ! subPcCode.equals("")) {
					paramMap.put("subPcCode", subPcCode);
				}
				
				if(subPcPCode!=null && ! subPcPCode.equals("")) {
					paramMap.put("subPcPCode", subPcPCode);
				}
				
				if(subPcOrderBy!=null && ! subPcOrderBy.equals("")) {
					paramMap.put("subPcOrderBy", subPcOrderBy);
				}
				
				if (paramMap.get("subPcCode") == null) {
					result = eMAU00D01Service.mainProcessMoveUpdate(paramMap);
				} else {
					result = eMAU00D01Service.subProcessMoveUpdate(paramMap);
				}
				
				//result = eMAU00D01Service.mainProcessMoveUpdate(paramMap);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return mav;
	}
	
	

	@RequestMapping(value = "/empo/process/todoAramSave.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView todoAramSave(@RequestBody List<Map<String, Object>> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		List<Map<String, Object>> receive = param;
		
		System.out.println(receive);
		System.out.println(receive.size());
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		HashMap<String, Object> hasDataConfirm = null;
		int result = 0;
		try {
			if (receive.size() > 0) {
				for (int i = 0; i < receive.size(); i++ ) { 
					String tdGubun = String.valueOf(receive.get(i).get("tdGubun"));
					String tdCode = (String) receive.get(i).get("tdCode");
					String tdDay = (String) receive.get(i).get("tdDay");
					String pjPk = String.valueOf(receive.get(i).get("pjPk"));
					String cdArCode = (String) receive.get(i).get("cdArCode");
					String mbCode = (String) receive.get(i).get("mbCode");
					
					if(tdGubun!=null && ! tdGubun.equals("")) {
						paramMap.put("tdGubun", tdGubun);
					}
					
					if(tdCode!=null && ! tdCode.equals("")) {
						paramMap.put("tdCode", tdCode);
					}
					
					if(tdDay!=null && ! tdDay.equals("")) {
						paramMap.put("tdDay", tdDay);
					}
					
					if(pjPk!=null && ! pjPk.equals("")) {
						paramMap.put("pjPk", pjPk);
					}
					
					if(cdArCode!=null && ! cdArCode.equals("")) {
						paramMap.put("cdArCode", cdArCode);
					}
					
					if(mbCode!=null && ! mbCode.equals("")) {
						paramMap.put("mbCode", mbCode);
					}
					
					hasDataConfirm = eMAU00D01Service.todoAramHasData(paramMap);
					System.out.println(hasDataConfirm);
					
					if(hasDataConfirm != null) {
						paramMap.put("tdPk", hasDataConfirm.get("tdPk"));
						result = eMAU00D01Service.todoAramUpdate(paramMap);
					} else {
						paramMap.put("tdPk", 0);
						result = eMAU00D01Service.todoAramInsert(paramMap);
					}
					
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return mav;
	}
	
	
	
	/**
	 * 프로세스 관리  - 프로세스 설정 (페이지)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02Main.do")
	public String eMAU00D02Main(HttpServletRequest request, ModelMap model) throws Exception {
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/process/process02Page";
	}
	
	/**
	 * 프로세스 관리  - 프로세스 설정 - 프로세스 CHECKLIST 추가 팝업
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02CheckListPopup.do")
	public String eMAU00D02CheckListPopup(HttpServletRequest request, ModelMap model) throws Exception {
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/process/checkListPopup";
	}
	
	/**
	 * 프로세스 관리 - 프로세스 설정 - 프로세스 목록
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02ProcessList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D02ProcessList() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		EmauProcessVO epVO = new EmauProcessVO();
		List<EmauProcessVO> list = null;
		try {
			list = eMAU00D01Service.processList(epVO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	/**
	 * 프로세스 관리  - 프로세스 설정 - 프로세스 정보
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02ProcessDetail.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D02ProcessDetail(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		
		HashMap<String, Object> map = null;
		try {
			map = eMAU00D01Service.processDetail(param);
		} catch (Exception e) {
			// TODO: handle exception
		}
			
		System.out.println(map);
		
		mav.addObject("list", map);
		
		return mav;
	}

	/**
	 * 프로세스 관리  - 프로세스 설정 - CHECKLIST 목록
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02ProcessCheckList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D02ProcessCheckList(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");

		List<EmauProcessVO> list = null;
		try {
			list = eMAU00D01Service.processCheckList(param); 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	
	/**
	 * 프로세스 관리  - 프로세스 설정 - 프로세스 대분류, 소분류 추가
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02ProcessCategorySave.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D02ProcessCategorySave(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		// 분류명
		String pcName = (String) map.get("pcName"); 
		
		// 일정표시	
		String pcScheduleCode = (String) map.get("pcScheduleCode"); 
		
		// 사용설정
		String pcUse = (String) map.get("pcUse"); 
		
		// 상위분류 Code
		String pcPCode = (String) map.get("pcPCode"); 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pcName!=null && !pcName.equals("")) {
			paramMap.put("pcName", pcName);
		}
		
		if(pcScheduleCode!=null && !pcScheduleCode.equals("")) {
			paramMap.put("pcScheduleCode", pcScheduleCode);
		}
		
		if(pcUse!=null && !pcUse.equals("")) {
			paramMap.put("pcUse", pcUse);
		}
		
		if(pcPCode!=null && !pcPCode.equals("")) {
			paramMap.put("pcPCode", pcPCode);
		}
		
		int pcCode = 0;
		int result = 0;
		
		HashMap<String, Object> resultMap = null;
		try {
			pcCode = eMAU00D01Service.processCategorySave(paramMap); 
			if(pcPCode!=null && !pcPCode.equals("")) {
				paramMap.put("pcCode", pcCode);
			}
			
			result = eMAU00D01Service.processOrderByUpdate(paramMap); 
			
			resultMap = eMAU00D01Service.processDetail(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		System.out.println(resultMap);
		
		mav.addObject("list", resultMap);
		
		return mav;
	}
	
	/**
	 * 프로세스 관리  - 프로세스 설정 - 프로세스 삭제
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02ProcessCategoryDelete.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D02ProcessCategoryDelete(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		// 분류명
		String pcCode = (String) map.get("pcCode"); 
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pcCode!=null && !pcCode.equals("")) {
			paramMap.put("pcCode", pcCode);
		}
		
		int result = 0;
		int result1 = 0;
		List<EmauProcessVO> resultList = null;
		try {
			resultList = eMAU00D01Service.fetchParentObject(paramMap);
			result = eMAU00D01Service.processCategoryDelete(paramMap);
			result1 = eMAU00D01Service.projectProcessMappingDelete(paramMap);
			System.out.println(resultList);
			if (resultList.size() != 0) {
				for (EmauProcessVO index : resultList) {
					System.out.println(index.getPcCode());
					paramMap.put("pcCode", index.getPcCode());
					System.out.println(paramMap);
					result = eMAU00D01Service.processCategoryDelete(paramMap);
					result1 = eMAU00D01Service.projectProcessMappingDelete(paramMap);
				}
			} 
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		
		mav.addObject("list", map);
		
		return mav;
	}
	
	/**
	 * 프로세스 관리  - 프로세스 설정 - CHECKLIST 항목 삭제
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param param List
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02CheckListDelete.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D02CheckListDelete(@RequestParam("clPk[]") List<Integer> clPk) {
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println(clPk);
		
		try {
			for (int id : clPk) {
				int result = eMAU00D01Service.checkListDelete(id);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 프로세스 관리  - 프로세스 설정 - CHECKLIST 항목 추가
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02CheckListCreate.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D02CheckListCreate(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		
		int lastInsertId = 0;
		HashMap<String, Object> map = null;
		
		try {
			lastInsertId = eMAU00D01Service.checkListCreate(param);

			map = eMAU00D01Service.createCheckListDetail(lastInsertId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		System.out.println(map);

		mav.addObject("list", map);
		
		return mav;
	}
	
	
	/**
	 * 프로세스 관리  - 프로세스 설정 - 프로세스 저장
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param param List<Map<String, Object>>
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D02ProcessSave.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D02ProcessSave(@RequestBody List<Map<String, Object>> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<Map<String, Object>> receive = param;
		
		HashMap<String, Object> paramMap1 = new HashMap<String, Object>();
		HashMap<String, Object> paramMap2 = new HashMap<String, Object>();
		
		String pcCode = String.valueOf(receive.get(0).get("pcCode"));
		String pcName = (String) receive.get(0).get("pcName");
		String pcScheduleCode = (String) receive.get(0).get("pcScheduleCode");
		String pcUse = (String) receive.get(0).get("pcUse");
		
		if(pcCode!=null && ! pcCode.equals("")) {
			paramMap1.put("pcCode", pcCode);
		}
		
		if(pcName!=null && ! pcName.equals("")) {
			paramMap1.put("pcName", pcName);
		}
		
		if(pcScheduleCode!=null && !pcScheduleCode.equals("")) {
			paramMap1.put("pcScheduleCode", pcScheduleCode);
		}
		
		if(pcUse!=null && !pcUse.equals("")) {
			paramMap1.put("pcUse", pcUse);
		}
		
		HashMap<String, Object> map = null;
		try {
			int result1 = eMAU00D01Service.processUpdate(paramMap1);
			
			if (receive.size() > 1) {
				for (int i = 1; i < receive.size(); i++ ) { 
					paramMap2.put("clUse", receive.get(i).get("clUse"));
					paramMap2.put("clPk", receive.get(i).get("cl_pk"));
					
					int result2 = eMAU00D01Service.checkListUseYNUpdate(paramMap2);
				}
			}
			
			map = eMAU00D01Service.processDetail(paramMap1);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", map);
		
		return mav;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 프로세스 관리  - 표준일정 설정(페이지)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D03Main.do")
	public String eMAU00D03Main(HttpServletRequest request, ModelMap model) throws Exception {
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/process/process03Page";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 프로세스 관리  - 휴일 설정 (페이지)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D04Main.do")
	public String eMAU00D04Main(HttpServletRequest request, ModelMap model) throws Exception {
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}

		return "main/process/process04Page";
	}
	
	/**
	 * 프로세스 - 휴일 설정 목록
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00D04HolidayList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D04HolidayList() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<EmauHolidayVO> list = null;
		EmauHolidayVO vo = new EmauHolidayVO();
		try {
			list = eMAU00D01Service.holidayList(vo);
			
			for (EmauHolidayVO index : list) {
				if (index.getHoRepeatCycle() == 1) {
					index.setHoRepeatCycleName("매년");
				} else {
					index.setHoRepeatCycleName("-");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/auth/eMAU00D01choiceholiday.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00D01choiceholiday(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		HashMap<String, Object> map = null;
		try {
			map = eMAU00D01Service.choiceholiday(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(map);
		mav.addObject("list", map);
		
		return mav;
	}
	
	/**
	 * 프로세스 관리  - 분류이동 편집 (팝업)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/process/eMAU00D05ProcessEditPage.do")
	public String eMAU00D05ProcessEditPage(HttpServletRequest request, ModelMap model) throws Exception {
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/process/processEditPage";
	}


}