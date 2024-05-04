package egovframework.or.kr.EMAU00E.web;

import java.text.SimpleDateFormat;
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
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00E.service.BusinessPjInfVO;
import egovframework.or.kr.EMAU00E.service.EMAU00E01Service;
import egovframework.or.kr.EMAU00F.service.EMAU00F01Service;
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
public class EMAU00E01Controller {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EMAU00E01Controller.class);

	
	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00F01Service")
	private EMAU00F01Service eMAU00F01Service;
	
	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00E01Service")
    private EMAU00E01Service eMAU00E01Service;
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
	/** EgovBBSUseInfoManageService */
    @Resource(name = "EgovBBSUseInfoManageService")
    private EgovBBSUseInfoManageService bbsUseService;
 

	/**
	 * 사업 관리 - 사업명
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
    
    @RequestMapping(value = "/empo/business/eMAU00E01Main.do")
	public String eMAU00E01Main(@ModelAttribute("searchVO") BusinessPjInfVO bdUseVO, ModelMap model)
	  throws Exception{
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "main/login/empilogin";
    	}
    	
    	return "main/business/business01Page";
	}
    
	/**
	 * 사업권한가져오기
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * @param vo BusinessPjInfVO
	 * @param param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/business/searchAuthList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView searchAuthList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception {
		
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	}
    	
    	
		ModelAndView mav = new ModelAndView("jsonView");
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		
		//사업년도
		String searchYear = (String) map.get("searchAuthYear"); 
		
		//사업명
		String searchName = (String) map.get("searchAuthName"); 
		
	 
		
		//파라미터 수신데이터
		BusinessPjInf vo = new BusinessPjInf();
        //사업년도
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
        //사업명
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		//검색조건 객체 담고
		
		List<BusinessPjInf> list = null;
		int totalCnt1 = 0;
		try {
			list = eMAU00E01Service.searchAuthList(vo);
			totalCnt1 = list.size();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", list);
		mav.addObject("totalCnt1", totalCnt1);
		return mav;
	}
	
	/**
	 * 사업 관리 - 사업부서
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/business/eMAU00E02Main.do")
	public String eMAU00E02Main(@ModelAttribute("searchVO") BusinessPjInfVO bdUseVO, ModelMap model)
	  throws Exception{
    	// 0.사용자권한 처리
    	if(!EmpiUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "main/login/empilogin";
    	}
    	
    	return "main/business/business02Page";
	}
	
	@RequestMapping(value = "/empo/business/eMAU00E01ProjectList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00E01ProjectList(@RequestParam Map<String, Object> param, ModelMap model, HttpServletRequest request) throws Exception {
		
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);
		//검색조건, 사업명 or 사업부서
		String searchDiv = (String) map.get("searchDiv"); 
		
		//검색조건, 사업명 or 사업부서
		String searchYear = (String) map.get("searchYear"); 
		
		//검색조건, 사업명 or 사업부서  ==> 검색명
		String searchName = (String) map.get("searchName"); 
		
		String page = String.valueOf(map.get("page"));
		
		String grmCode = user.getGrmCode();
		
		//파라미터 수신데이터
		BusinessPjInf vo = new BusinessPjInf();
		
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
		
        //수신데이터 검증 , (사업명, 사업부서)
		if(searchDiv!=null && !searchDiv.equals("")) {
			vo.setSearchDiv(searchDiv);
		}
		
        //수신데이터 검증 , (사업년도)
		if(searchYear!=null && !searchYear.equals("")) {
			vo.setSearchYear(searchYear);
		}
		
		if(searchName!=null && !searchName.equals("")) {
			vo.setSearchName(searchName);
		}
		
		if(grmCode!=null && !grmCode.equals("")) {
			vo.setGrmCode(grmCode);
		}
		
		List<BusinessPjInf> list = null;
		int totalCnt = 0;
		int resultCnt = 0;
		try { 
			if(vo!=null && vo.getSearchDiv().equals("name")) {//사업명 
				list = eMAU00E01Service.searchBusinessList(vo); 
				resultCnt = eMAU00E01Service.searchBusinessListCnt(vo);
				
				paginationInfo.setTotalRecordCount(resultCnt);
			}else if(vo!=null && vo.getSearchDiv().equals("dept")){
				list = eMAU00E01Service.searchDeptList(vo); 
				resultCnt = eMAU00E01Service.searchDeptListCnt(vo);
				
				paginationInfo.setTotalRecordCount(resultCnt);
			}
			totalCnt = list.size();
 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		//시스템 최종 업데이트 시간
		HashMap<String, Object> resultMap = null;
		resultMap = eMAU00E01Service.getSysUpdate(resultMap);
		//타임스탬프 활용
		SimpleDateFormat sDate2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		mav.addObject("list", list);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("paginationInfo", paginationInfo);
		mav.addObject("sysUpdate", sDate2.format(resultMap.get("sysUpdate")));
		//mav.addObject("sysUpdate", "2021-07-19 16:10:00");

		return mav;
	}
	
	
	/**
	 * 사업 관리 - 사업부서
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/business/eMAU00E01BusinessCreatePopup.do")
	public String eMAU00E01BusinessCreatePopup(@ModelAttribute("searchVO") BoardUseInfVO bdUseVO, ModelMap model) throws Exception { 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/business/pj_001_01";
	}
	/**
	 * 사업 관리 - 사업명
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/business/eMAU00E01ProjectDetail.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00E01ProjectDetail(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");

		System.out.println(param);
		HashMap<String, Object> map = null;
		try {
			map = eMAU00E01Service.projectDetail(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		System.out.println(map);

		mav.addObject("list", map);

		return mav;
	}
	/**
	 * 사업 관리 - 사업명
	 * 
	 * @return 팝업페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/business/eMAU00E01SearchFirstOption.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00E01SearchFirstOption() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		BusinessPjInf vo = new BusinessPjInf();
		List<BusinessPjInf> list = null;
		
		try {
			list = eMAU00E01Service.searchFirstOption(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	/**
	 * 사업 관리 - 사업명
	 * 
	 * @return 팝업페이지 정보 Map [key : 항목명]
	 *
	 * @param Map
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/business/eMAU00E01SearchSubOption.do", method = RequestMethod.GET)
	public @ResponseBody ModelAndView eMAU00E01SearchSubOption(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");

		List<BusinessPjInf> list = eMAU00E01Service.searchSubOption(param);
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	
	
	@RequestMapping(value = "/empo/business/eMAU00E01MemberList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00E01MemberList(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<BusinessPjInf> list = null;
		try {
			list = eMAU00E01Service.memberList(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);

		mav.addObject("list", list);

		return mav;
	}
	/**
	 * 사업 관리 - 담당자별(권한 추가)
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/business/eMAU00E01AuthInsert.do", method = RequestMethod.POST)
	public ModelAndView eMAU00E01AuthInsert(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		int pjAuId = 0;
		HashMap<String, Object> map = null;
		try {
			if (param.get("pjAuId").equals("0")) {
				pjAuId = eMAU00E01Service.authInsert(param);
				param.put("pjAuId", pjAuId);
			} else {
				eMAU00E01Service.authUpdate(param);
				//map = eMAU00F01Service.authDetail(param);
			}
			map = eMAU00E01Service.authDetail(param);
			System.out.println(map);
			
		} catch (Exception e) {
			// TODO: handle exception
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
	@RequestMapping(value = "/empo/business/eMAU00E01AuthDelete.do", method = RequestMethod.POST)
	public ModelAndView eMAU00E01AuthDelete(@RequestParam Map<String, Object> param) throws Exception {
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
	
	
	@RequestMapping(value = "/empo/business/eMAU00E01managerSearch.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00E01managerSearch(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		
		List<BusinessPjInf> list = null;
		try {
			list = eMAU00E01Service.searchManagerList(param);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(list);
		mav.addObject("list", list);

		return mav;
	}
	
	
	@RequestMapping(value = "/empo/business/AuthBusinessUpdate.do", method = RequestMethod.POST)
	public ModelAndView AuthBusinessUpdate(@RequestBody List<Map<String, Object>> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<Map<String, Object>> receive = param;
		
		String pjCode = (String) receive.get(0).get("pjCode");
		String auCode = (String) receive.get(0).get("auCode");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		if(pjCode!=null && !pjCode.equals("")) {
			paramMap.put("pjCode", pjCode);
		}
		
		if(auCode!=null && !auCode.equals("")) {
			paramMap.put("auCode", auCode);
		}
		
		HashMap<String, Object> resultMap = null;
		try {
			eMAU00E01Service.authBusinessUpdate(paramMap);
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
					eMAU00F01Service.authInsert(paramMap);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
//		try {
//				
//				
//				//map = eMAU00F01Service.authDetail(param);
//				System.out.println(param);
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		
		return mav;
	}
	
}