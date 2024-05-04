package egovframework.or.kr.EMA00H01.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMA00H01.service.EMA00H01Service;
import egovframework.or.kr.EMA00H01.service.EMA00H01VO;

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
public class EME00H01Controller {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EME00H01Controller.class);
	
	/**
	 * GA03MAINService
	 */
	@Resource(name = "EMA00H01Service")
    private EMA00H01Service eMA00H01Service;
	
 
	
	
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	/**
	 * INNO > TM
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EME00H01/eme00h01.do")
	public String emd00h01(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EME00H01/eme00h01"; 
	}
	
	/**
	 * INNO > 신규 데이터
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EME00H01/eme00h02.do")
	public String eme00h02(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EME00H01/eme00h02"; 
	} 
	
	/**
	 * INNO > 구 데이터
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EME00H01/eme00h03.do")
	public String eme00h03(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EME00H01/eme00h03"; 
	} 
	
	/**
	 * INNO > 리서치
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EME00H01/eme00h04.do")
	public String eme00h04(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EME00H01/eme00h04"; 
	} 
	
	/**
	 * INNO > CRM
	 * @return 메인페이지 정보 Map [key : 항목명]
	 * ADDRL LIST
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */ 
	@RequestMapping("/inno/EME00H01/eme00h05.do")
	public String eme00h05(@ModelAttribute("eMA00H01VO") EMA00H01VO eMA00H01VO, HttpServletRequest request,
			ModelMap model) throws Exception {

		//로그인 객체 선언 
    	Boolean isAuthenticated = (LoginVO)request.getSession().getAttribute("LoginVO") == null ? false:true;
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "main/login/empilogin";
    	}
    
		return "main/INNO/EME00H01/eme00h05"; 
	} 
	
}
