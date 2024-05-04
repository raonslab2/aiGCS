package egovframework.or.kr.EMAU00F.web;

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
import egovframework.let.cop.com.service.BoardUseInfVO;
import egovframework.let.cop.com.service.EgovBBSUseInfoManageService;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.or.kr.EMAU00F.service.EMAU00F01Service;
import egovframework.or.kr.EMAU00F.service.EmauProjectVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.or.kr.com.utill.EmpiUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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
public class EMAU00F01Controller {

	private static final Logger LOGGER = LoggerFactory.getLogger(EMAU00F01Controller.class);

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00F01Service")
	private EMAU00F01Service eMAU00F01Service;

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
	 * 권한 관리 - 담당자별 목록(페이지)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01Main.do")
	public String eMAU00F01Main(@ModelAttribute("searchVO") BoardUseInfVO bdUseVO, ModelMap model) throws Exception { 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/auth/auth01Page";
	}
	 
	
	/**
	 * 권한 관리 - 담당자별 목록
	 * 권한 관리 - 담당자별 검색 목록
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo EmmbgroupVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01ManagerList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F01ManagerList(@RequestParam Map<String, Object> param,HttpServletRequest request) throws Exception {
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
	 
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		EgovMap map = CommUtil.makeEgovMap(param);
		
		String page = String.valueOf(map.get("page"));
		
		EmmbgroupVO vo = new EmmbgroupVO();
		vo.setMbCode(user.getMbCode());
		
		if(page !="") {
			int page1 = Integer.parseInt(page);
			vo.setPageIndex(page1);
		}
		String groupPart1 = (String) map.get("groupPart1");
		String groupPart2 = (String) map.get("groupPart2");
		String searchName = (String) map.get("searchName");
		String dept = (String) map.get("dept");
		PaginationInfo paginationInfo = new PaginationInfo();
		
		//paginationInfo.setCurrentPageNo(1);
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//수신데이터 검증 , (사업명, 사업부서)
		if(groupPart1!=null && !groupPart1.equals("")) {
			vo.setGroupPart1(groupPart1);
		}
		
        //수신데이터 검증 , (사업년도)
		if(groupPart2!=null && !groupPart2.equals("")) {
			vo.setGroupPart2(groupPart2);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		if(dept!=null && !dept.equals("")) {
			vo.setSearchCnd(dept);
		}
		
		List<EmmbgroupVO> list = null;
		int resultCnt = 0;
		try {
			list = eMAU00F01Service.managerList(vo);
			resultCnt = eMAU00F01Service.managerListCnt(vo);
			paginationInfo.setTotalRecordCount(resultCnt);
//			if (doSearch.equals("0")) {
//				list = eMAU00F01Service.managerList(vo);
//				resultCnt = eMAU00F01Service.managerListCnt(vo);
//				
//				paginationInfo.setTotalRecordCount(resultCnt);
//			} else {
//				if (dept.equals("0")) {
//					list = eMAU00F01Service.managerList(vo);
//					resultCnt = eMAU00F01Service.managerListCnt(vo);
//					
//					paginationInfo.setTotalRecordCount(resultCnt);
//				}
//				list = eMAU00F01Service.searchManagerList(vo);
//				resultCnt = eMAU00F01Service.searchManagerListCnt(vo);
//				
//				paginationInfo.setTotalRecordCount(resultCnt);
//			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", list);
		mav.addObject("paginationInfo", paginationInfo);
		
		return mav;
	}
	
	/**
	 * 권한 관리 - 담당자별(담당자 정보)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01ManagerDetail.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F01ManagerDetail(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");

		HashMap<String, Object> map = null;
		try {
			map = eMAU00F01Service.managerDetail(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(map);

		mav.addObject("list", map);

		return mav;
	}
	
	/**
	 * 권한 관리 - 담당자별(회원정보 - 권한)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01AuthList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F01AuthList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<EmmbgroupVO> list = null;
		try {
			list = eMAU00F01Service.authList(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	/**
	 * 권한 관리 - 검색 1Dept 셀렉트박스 
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param vo EmmbgroupVO
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01SearchFirstOption.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F01SearchFirstOption() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		EmmbgroupVO vo = new EmmbgroupVO();
		List<EmmbgroupVO> list = null;
		
		try {
			list = eMAU00F01Service.searchFirstOption(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	/**
	 * 권한 관리 - 검색 2Dept 셀렉트박스 
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01SearchSubOption.do", method = RequestMethod.GET)
	public @ResponseBody ModelAndView eMAU00F01SearchSubOption(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");

		List<EmmbgroupVO> list = null;
		try {
			list = eMAU00F01Service.searchSubOption(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	
	/**
	 * 권한 관리 - 권한 추가 팝업(페이지)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01AuthCreatePopup.do")
	public String eMAU00F01AuthCreatePopup(@ModelAttribute("searchVO") BoardUseInfVO bdUseVO, ModelMap model) throws Exception { 
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/auth/auth01CreatePopup";
	}
	
	/**
	 * 권한 관리 - 권한추가 - 사업 검색
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01SearchProject.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F01SearchProject(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
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
		
		List<EmauProjectVO> list = null;
		try {
			list = eMAU00F01Service.searchProject(paramMap);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", list);
		return mav;
	}
	
	/**
	 * 권한 관리 - 담당자별(권한 추가/수정/해당 정보)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01AuthInsert.do", method = RequestMethod.POST)
	public ModelAndView eMAU00F01AuthInsert(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		int pjAuId = 0;
		HashMap<String, Object> map = null;
		try {
			if (param.get("pjAuId").equals("0")) {
				pjAuId = eMAU00F01Service.authInsert(param);
				param.put("pjAuId", pjAuId);
			} else {
				eMAU00F01Service.authUpdate(param);
				//map = eMAU00F01Service.authDetail(param);
			}
			map = eMAU00F01Service.authDetail(param);
			System.out.println(map);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", map);
		return mav;
	}
 
	/**
	 * 권한 관리 - 담당자별(권한 삭제)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01AuthDelete.do", method = RequestMethod.POST)
	public ModelAndView eMAU00F01AuthDelete(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		try {
			int result = eMAU00F01Service.authDelete(param);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return mav;
	}
	
	/**
	 * 권한 관리 - 사업별 목록(페이지)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F02Main.do")
	public String eMAU00F02Main(HttpServletRequest request, ModelMap model) throws Exception {
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/auth/auth02Page";
	}
	
	/**
	 * 권한 관리 - 사업별 목록
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F02projectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F02projectList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String pjYear = (String) map.get("pjYear");
		
		EmauProjectVO epVO = new EmauProjectVO();
		if(pjYear!=null && !pjYear.equals("")) {
			epVO.setPjYear(pjYear);
		}
		
		List<EmauProjectVO> list = null;
		try {
			list = eMAU00F01Service.projectList(epVO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);
		
		return mav;
	}
	
	/**
	 * 권한 관리 - 사업별(사업정보)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F02ProjectDetail.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F02ProjectDetail(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");

		System.out.println(param);
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String pjCode = (String) map.get("pjCode");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjCode!=null && !pjCode.equals("")) {
			paramMap.put("pjCode", pjCode);
		}
		
		HashMap<String, Object> resultMap = null;
		try {
			resultMap = eMAU00F01Service.projectDetail(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", resultMap);

		return mav;
	}
	
	/**
	 * 권한 관리 - 사업별(사업정보 - 부서별 권한설정)
	 * 사업권한 가져오기
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F02projectAuthList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F02projectAuthList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		

		List<EmmbgroupVO> list = null;
		try {
			list = eMAU00F01Service.projectAuthList(param);
		} catch (Exception e) {
			// TODO: handle exception
		}

		System.out.println(param);
		System.out.println(list);
		
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/empo/auth/projectUpdate.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView projectUpdate(@RequestBody List<Map<String, Object>> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<Map<String, Object>> receive = param;
		
		String pjCode = (String) receive.get(0).get("pjCode");
		String pjUse = (String) receive.get(0).get("pjUse");
		String auCode = (String) receive.get(0).get("auCode");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjCode!=null && !pjCode.equals("")) {
			paramMap.put("pjCode", pjCode);
		}
		
		if(pjUse!=null && !pjUse.equals("")) {
			paramMap.put("pjUse", pjUse);
		}
		
		if(auCode!=null && !auCode.equals("")) {
			paramMap.put("auCode", auCode);
		}
		
		int result = 0;
		HashMap<String, Object> resultMap = null;
		try {
			result = eMAU00F01Service.projectUpdate(paramMap);
			resultMap = eMAU00F01Service.projectDetail(paramMap);
			
			if (receive.size() > 1) {
				for (int i = 1; i < receive.size(); i++ ) {
					//String pjYear = String.valueOf(receive.get(i).get("pjYear"));
					String pjYear = String.valueOf(receive.get(i).get("pjYear"));
					String pjCode1 = (String) receive.get(i).get("pjCode");
					String auCode1 = (String) receive.get(i).get("auCode");
					String mbCode = (String) receive.get(i).get("mbCode");
					
					if(pjYear!=null && ! pjYear.equals("")) {
						paramMap.put("pjYear", pjYear);
					}
					
					if(pjCode1!=null && ! pjCode1.equals("")) {
						paramMap.put("pjCode", pjCode1);
					}
					
					if(auCode1!=null && ! auCode1.equals("")) {
						paramMap.put("auCode", auCode1);
					}
					
					if(mbCode!=null && ! mbCode.equals("")) {
						paramMap.put("mbCode", mbCode);
					}
					
					System.out.println(paramMap);
					result = eMAU00F01Service.authInsert(paramMap);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", resultMap);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/auth/searchProjectAutocomplete.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView searchProjectAutocomplete(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
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
		
		List<EmauProjectVO> list = null;
		try {
			list = eMAU00F01Service.searchProjectAutocomplete(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/empo/auth/searchProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView searchProjectList(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		String pjYear = (String) map.get("pjYear");
		String pjTitle = (String) map.get("pjTitle");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjYear!=null && !pjYear.equals("")) {
			paramMap.put("pjYear", pjYear);
		}
		
		if(pjTitle!=null && !pjTitle.equals("")) {
			paramMap.put("pjTitle", pjTitle);
		}else {
			paramMap.put("pjTitle", "");
		}
		
		List<EmauProjectVO> list = null;
		try {
			list = eMAU00F01Service.searchProjectList(paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	/**
	 * 권한 관리 - 사업별 권한 추가 - 담당자별 검색 목록
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F01managerSearch.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00F01managerSearch(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EmmbgroupVO> list = null;
		try {
			list = eMAU00F01Service.popupManagerList(param);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(list);
		mav.addObject("list", list);

		return mav;
	}
	
	/**
	 * 권한 관리 - 담당자별 회원 목록(페이지)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/auth/eMAU00F03Main.do")
	public String eMAU00F03Main(@ModelAttribute("searchVO") BoardUseInfVO bdUseVO, ModelMap model) throws Exception { 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/auth/auth03Page";
	}

	@RequestMapping(value = "/empo/auth/changePassword.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView changePassword(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		System.out.println(map);
		
		String newPwd = (String) map.get("newPwd1");
		String mbCode = (String) map.get("pwdMbCode");
		
		LoginVO vo = new LoginVO();
		
		if(newPwd!=null && !newPwd.equals("")) {
			vo.setPassword(newPwd);
		}
		
		if(mbCode!=null && !mbCode.equals("")) {
			vo.setId(mbCode);
		}
		
		String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getId());
		System.out.println(enpassword);
		vo.setPassword(enpassword);
		
		int result = 0;
		try {
			result = eMAU00F01Service.changePassword(vo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
//		LoginVO vo = new LoginVO();
//		if(newPwd!=null && !newPwd.equals("")) {
//			vo.setId("id");
//		}
		
		return mav;
	}
}