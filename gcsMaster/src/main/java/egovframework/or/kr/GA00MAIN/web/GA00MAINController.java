package egovframework.or.kr.GA00MAIN.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.GA00MAIN.service.GA00MAINService;
import egovframework.or.kr.GA00MAIN.service.GA00MAINVO;
import egovframework.or.kr.GA03MAIN.service.DeviceVO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRVO;
import egovframework.or.kr.com.utill.CommUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

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
public class GA00MAINController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(GA00MAINController.class);
	
	/**
	 * GA03MAINService
	 */
	@Resource(name = "GA00MAINService")
    private GA00MAINService gA00MAINService;
	 
	 
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	 
    @RequestMapping(value = "/gcs/ga00main/ga00mainDeviceTypeList.do", method = RequestMethod.POST)
    public @ResponseBody ModelAndView ga00mainDeviceTypeList(@RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
		//접속 사용자
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		ModelAndView mav = new ModelAndView("jsonView");		
		EgovMap map = CommUtil.makeEgovMap(param); 
		 
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		GA00MAINVO vo = new GA00MAINVO();
		 
		List<GA00MAINVO> list = null;
		list = gA00MAINService.selectDeviceType(vo);
		
		mav.addObject("list", list);
		
		LOGGER.debug("ga00mainDeviceTypeList: {}",list); 

		return mav;
	}
	
}
