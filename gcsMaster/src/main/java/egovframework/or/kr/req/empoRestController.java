package egovframework.or.kr.req;

import java.util.HashMap;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSManageService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
public class empoRestController {

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;
 

	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/rest/samplePage.do")
	public String getSamplePage(HttpServletRequest request, ModelMap model)
	  throws Exception{
        /*
		Map<String, Object> map = new HashMap<String, Object>();
		model.addAttribute("notiList", map.get("resultList"));
		*/
	 
		//model.addAttribute("galList", map.get("resultList"));

		// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

		return "main/empoMain";
	} 
	
	@RequestMapping(value = "/empo/rest/samplePage2.do")
	public String getSamplePage2(HttpServletRequest request, ModelMap model)
	  throws Exception{
  
		return "main/empoSampleCalendar1";
	} 
 
	
  @RequestMapping(value = "/empo/rest/ajaxSampleCall.do", method = RequestMethod.POST)
    public ModelAndView fileAjax(MultipartFile file,Model model) throws Exception {
        Map<String,Object> hashMap = new HashMap<>();
        hashMap.put("orgFileName", file.getOriginalFilename());
        hashMap.put("fileSize", file.getSize());
        hashMap.put("orgFileType", file.getContentType());
        
        ModelAndView modelAndView = new ModelAndView("jsonView",hashMap);
        return modelAndView;
    }

  @RequestMapping(value="/mia/miazb0010/blockVcChallenge.do", method=RequestMethod.POST)
  @ResponseBody
  public String simpleWithObject(@RequestParam Map<String,Object> commandMap, ModelMap model
			,HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("jsonView");		
		String challenge = "ddddd";		
		session.setAttribute("vcchallenge", challenge);		
		mav.addObject("result",challenge);

		
      return challenge;
  }
  
  @RequestMapping(value="/mia/miazb0010/blockVcChallenge2.do", method=RequestMethod.POST)
  @ResponseBody
  public ModelAndView simpleWithObject2(@RequestParam Map<String,Object> commandMap, ModelMap model
			,HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("jsonView");		
		String challenge = "ddddd";		
		session.setAttribute("vcchallenge", challenge);		
		mav.addObject("result",challenge);
		mav.addObject("option","test");
		
      return mav;
  }

}