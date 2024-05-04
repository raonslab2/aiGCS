package egovframework.or.kr.EMAU000.web;

import java.util.HashMap;
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
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.cop.com.service.BoardUseInfVO;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.or.kr.EMAU000.service.EMAU00001Service;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.or.kr.com.utill.EmpiUserDetailsHelper;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

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
public class EMAU00001Controller {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovFileMngUtil.class);

	/** EgovLoginService */
	@Resource(name = "eMAU00001Service")
	private EMAU00001Service eMAU00001Service;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** TRACE */
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
 

	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/empo/login/eMAU00001Main.do")
	public String eMAU00A01Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
  

		return "main/login/empilogin"; 
	}  
	
	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/empo/login/eMAU00002Main.do")
	public String eMAU00002Main(HttpServletRequest request, ModelMap model)
	  throws Exception{
  

		return "main/login/empipasswd"; 
	}  
	
	
	@RequestMapping(value = "/empo/login/eMAU00002EmailAuth.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00002EmailAuth(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		String mbCode = (String) param.get("mbCode");
		mbCode = "MB0001";
		
		LoginVO loginVO = new LoginVO();
		loginVO.setMbCode(mbCode);
		
		
		
		LOGGER.debug("mbCode: {}",mbCode);
		
 
		 
		mav.addObject("result", "success");
		
		return mav;
	}
	
	
	/**
	 * 일반 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/gcs/login/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {
		 
		LoginVO vo = eMAU00001Service.pwCheck(loginVO);
		
		if (! loginVO.getSmtechId().equals("")) {
			vo.setSmtechId(loginVO.getSmtechId());
			int result = eMAU00001Service.smtechIdUpdate(vo);
		}
		
		if (vo.getPassword().equals("NULL") ) {
			String enpassword = EgovFileScrty.encryptPassword(loginVO.getPassword(), loginVO.getId());
			vo.setId(loginVO.getId());
			vo.setPassword(enpassword);
			int result = eMAU00001Service.changePassword(vo);
		}
		//mobile login 검증
		/*
		int loginMobile = eMAU00001Service.mobileLoginCnt(loginVO);
		
		if(loginMobile==0) {
			model.addAttribute("message", "모바일 DID 인증이 되어있지 않습니다.");
			return "main/login/empilogin";
		}
		*/
		
		
		// 1. 일반 로그인 처리
		LoginVO resultVO = eMAU00001Service.actionLogin(loginVO);
	 

		boolean loginPolicyYn = true;

		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {
            
			 
			request.getSession().setAttribute("LoginVO", resultVO);
			return "forward:/gcs/TD0001/TodayWork900.do";
		} else {

			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}

	}
	
	@RequestMapping(value = "/gcs/login/actionLoginMobile.do")
	public String actionLoginMobile(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {
		 
		LoginVO vo = eMAU00001Service.pwCheck(loginVO);
		
		if (! loginVO.getSmtechId().equals("")) {
			vo.setSmtechId(loginVO.getSmtechId());
			int result = eMAU00001Service.smtechIdUpdate(vo);
		}
		
		if (vo.getPassword().equals("NULL") ) {
			String enpassword = EgovFileScrty.encryptPassword(loginVO.getPassword(), loginVO.getId());
			vo.setId(loginVO.getId());
			vo.setPassword(enpassword);
			int result = eMAU00001Service.changePassword(vo);
		}
		//mobile login 검증
		/*
		int loginMobile = eMAU00001Service.mobileLoginCnt(loginVO);
		
		if(loginMobile==0) {
			model.addAttribute("message", "모바일 DID 인증이 되어있지 않습니다.");
			return "main/login/empilogin";
		}
		*/
		
		
		// 1. 일반 로그인 처리
		LoginVO resultVO = eMAU00001Service.actionLogin(loginVO);
	 

		boolean loginPolicyYn = true;

		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {
            
			 
			request.getSession().setAttribute("LoginVO", resultVO);
			return "forward:/gcs/TD0001/TodayWork905.do";
		} else {

			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empiloginMobile";
		}

	}
	
	/**
	 * 일반 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/gcs/login/actionLogin2.do")
	public String actionLogin2(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {
		LoginVO vo = eMAU00001Service.pwCheck(loginVO);
		
		if (! loginVO.getSmtechId().equals("")) {
			vo.setSmtechId(loginVO.getSmtechId());
			int result = eMAU00001Service.smtechIdUpdate(vo);
		}
		
		if (vo.getPassword().equals("NULL") ) {
			String enpassword = EgovFileScrty.encryptPassword(loginVO.getPassword(), loginVO.getId());
			vo.setId(loginVO.getId());
			vo.setPassword(enpassword);
			int result = eMAU00001Service.changePassword(vo);
		}
		// 1. 일반 로그인 처리
		LoginVO resultVO = eMAU00001Service.actionLogin(loginVO);

		boolean loginPolicyYn = true;

		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {
            
			//mobile login 성공 이라면
			vo.setDid("did:example:"+vo.getId()+"abcdef#keys-1"); // did:example:123456789abcdef#keys-1
			eMAU00001Service.actionLoginSuccess(vo);
			
			request.getSession().setAttribute("LoginVO", resultVO);
			return "forward:/gcs/dashboard/gA030Main2.do";
		} else {

			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin2";
		}

	}
	
	@RequestMapping(value = "/empo/login/seeSmtechId.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView seeSmtechId(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		EgovMap map = CommUtil.makeEgovMap(param); 
		
		LoginVO vo = new LoginVO();
		
		String id = (String) map.get("id");
		
		if(id !=null && id != "") {
			vo.setMbCode(id);
		}
		
		HashMap<String, Object> resultMap = null;
		try {
			resultMap = eMAU00001Service.seeSmtechId(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		mav.addObject("list", resultMap);
		return mav;
	}
	
	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/empo/login/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		RequestContextHolder.getRequestAttributes().removeAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);

		return "forward:/empo/login/eMAU00001Main.do";
	}
	
	/**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionMain.do")
	public String actionMain(ModelMap model) throws Exception {

		// 1. 사용자 인증 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "cmm/uat/uia/EgovLoginUsr";
		}

		// 2. 메인 페이지 이동
		return "forward:/cmm/main/mainPage.do";
	}
	
	@RequestMapping(value = "/empo/login/eMAU00001ChangePasswordPopup.do")
	public String eMAU00F01AuthCreatePopup(@ModelAttribute("searchVO") BoardUseInfVO bdUseVO, ModelMap model) throws Exception { 
		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}
		
		return "main/login/login01ChangePasswordPopup";
	}
	
}