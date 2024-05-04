package egovframework.or.mobile.login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.or.mobile.login.service.MobileLoginService;

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
public class MobileLoginController {

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "MobileLoginService")
    private MobileLoginService mobileLoginService;
 

	/**
	 * 지능형평가모델 > 신청과제정보
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/mobile/login/mobilelogin.do")
	public String EMAU00H0101(HttpServletRequest request, ModelMap model)
	  throws Exception{
		
        //String result = mobileLoginService.selectList(param);
		return "main/mobile/login/mobileLogin";
	} 
	 
}