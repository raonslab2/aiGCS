package egovframework.or.kr.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.web.EgovComUtlController;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class EmpoComUtilController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EmpoComUtilController.class);
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
	@Resource(name = "egovPageLinkWhitelist")
    protected List<String> egovWhitelist;
	
    /**
	 * JSP 호출작업만 처리하는 공통 함수
	 */
	@RequestMapping(value="/EmpPageLink.do")
	public String moveToPage(@RequestParam("link") String linkPage, 
			HttpSession session, 
			@RequestParam(value="menuNo", required=false) String menuNo){
		
		String link = linkPage;
		link = link.replace(";", "");
		link = link.replace(".", "");
		
		// service 사용하여 리턴할 결과값 처리하는 부분은 생략하고 단순 페이지 링크만 처리함
		if (linkPage==null || linkPage.equals("")){
			link="cmm/error/egovError";
		} else {
			if(link.indexOf(",")>-1){
			    link=link.substring(0,link.indexOf(","));
			}
		}
		
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo!=null && !menuNo.equals("")){
			session.setAttribute("menuNo",menuNo);
		}
		
		// 화이트 리스트 처리
		// whitelist목록에 있는 경우 결과가 true, 결과가 false인경우 FAIL처리
		if (egovWhitelist.contains(link) == false) {
			LOGGER.debug("Page Link WhiteList Error! Please check whitelist!"+link);
			link="cmm/error/egovError";
		}
		// 안전한 경로 문자열로 조치
		link = EgovWebUtil.filePathBlackList(link);
		
		return link;
	}

    /**
	 * validation rule dynamic java script
	 */
	@RequestMapping("/Empvalidator.do")
	public String validate(){
		return "cmm/validator";
	}

}
