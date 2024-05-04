package egovframework.or.kr.EMAU00G.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.language.bm.Rule.RPattern;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
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
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.EMAU00C01Service;
import egovframework.or.kr.EMAU00G.service.EMAU00G01Service;
import egovframework.or.kr.EMAU00G.service.EMAU00G01VO;
import egovframework.or.kr.com.utill.EmpiUserDetailsHelper;

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
public class EMAU00G01Controller {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovFileMngUtil.class);

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00G01Service")
	private EMAU00G01Service eMAU00G01Service;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00C01Service")
	private EMAU00C01Service eMAU00C01Service;
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;

	/**
	 * RPA 자료요청 화면
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/rpa/eMAU00G01Main.do")
	public String eMAU00G01Main(HttpServletRequest request, ModelMap model) throws Exception {

		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}

		LOGGER.error("{} : test.", "eMAU00C01Main");

		return "main/rpa/rpa01Page";
	}
	
	/**
	 * 사업명 검색 searchUserPjList
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */

	@RequestMapping(value = "/empo/rpa/searchRpaPjList.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00G01searchBusiness(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");

		List<EMAU00G01VO> list = null;
		try {
			list = (List<EMAU00G01VO>) eMAU00G01Service.searchRpaPjList(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		mav.addObject("list", list);
		
		return mav;
	}

	/**
	 * RPA 자료조회 화면
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/rpa/eMAU00G02Main.do")
	public String eMAU00G02Main(HttpServletRequest request, ModelMap model) throws Exception {

		// 0.사용자권한 처리
		if (!EmpiUserDetailsHelper.isAuthenticated()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "main/login/empilogin";
		}

		LOGGER.error("{} : test.", "eMAU00C01Main");
		
		return "main/rpa/rpa02Page";
	}
	
	// 로그인한 계정 사업부서
	@RequestMapping(value = "/empo/rpa/businessDepart.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00G01businessDepart(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("jsonView");
		LoginVO user = (LoginVO) request.getSession().getAttribute("LoginVO");
		
		System.out.println("getName : " + user.getName());
		
		String grSumName = null;
		try {
			grSumName = eMAU00G01Service.businessDepart(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grSumName", grSumName);
		map.put("mbName", user.getName());
		map.put("grmCode", user.getGrmCode());
		map.put("mbCode", user.getMbCode());
		
		System.out.println(map);
		mav.addObject("list", map);

		return mav;
		
	}
	
	@RequestMapping(value = "/empo/rpa/searchRpaPjList1.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00G01searchRpaPjList1(@RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView("jsonView");

		List<EMAU00G01VO> list = null;
		try {
			list = eMAU00G01Service.searchRpaPjList1(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		mav.addObject("list", list);
		
	 
		return mav;
	}
	
	
	@RequestMapping(value = "/empo/rpa/dataRequest.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00G01dataRequest(@RequestBody List<Map<String, Object>> param) {
		ModelAndView mav = new ModelAndView("jsonView");

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		List<EMAU00G01VO> list = null;
		for (int i = 0; i < param.size(); i++ ) {
			paramMap.put("pjCode", param.get(i).get("pjCode"));
			paramMap.put("pjTitle", param.get(i).get("pjTitle"));
			paramMap.put("pjTitleNum", param.get(i).get("pjTitleNum"));
			paramMap.put("reGubun", param.get(i).get("reGubun"));
			paramMap.put("grmCode", param.get(i).get("grmCode"));
			paramMap.put("mbCode", param.get(i).get("mbCode"));
			System.out.println(paramMap);
			list = eMAU00G01Service.dataRequest(paramMap);
		}
		return mav;
	}
	
	@RequestMapping(value = "/empo/rpa/autocomplete.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView autocomplete(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		System.out.println(param);
		List<EmpjVO> list = null;
		try {
			list = eMAU00G01Service.autocomplete(param);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	/**
	 * 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다.
	 *
	 * @param commandMap
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/empo/rpa/FileDown.do")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String atchPath = (String) commandMap.get("atchPath");
		String fileName = (String) commandMap.get("fileName");

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {

			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(atchPath);
			fileVO.setFileSn(fileName);
			
			//FileVO fvo = fileService.selectFileInf(fileVO);
		 
			
			
			//File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
			//고칠것
			File uFile = new File(atchPath, fileName);
			long fSize = uFile.length();

			if (fSize > 0) {
				String mimetype = "application/x-msdownload";

				//response.setBufferSize(fSize);	// OutOfMemeory 발생
				response.setContentType(mimetype);
				//response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fvo.getOrignlFileNm(), "utf-8") + "\"");
				//setDisposition(fvo.getOrignlFileNm(), request, response);
				
				//고칠것
				setDisposition(fileName, request, response);
				//response.setContentLength(fSize);

				/*
				 * FileCopyUtils.copy(in, response.getOutputStream());
				 * in.close();
				 * response.getOutputStream().flush();
				 * response.getOutputStream().close();
				 */
				BufferedInputStream in = null;
				BufferedOutputStream out = null;

				try {
					in = new BufferedInputStream(new FileInputStream(uFile));
					out = new BufferedOutputStream(response.getOutputStream());

					FileCopyUtils.copy(in, out);
					out.flush();
				} catch (Exception ex) {
					// 다음 Exception 무시 처리
					// Connection reset by peer: socket write error
					LOGGER.debug("IGNORED: {}", ex.getMessage());
				} finally {
					if (in != null) {
						try {
							in.close();
						} catch (Exception ignore) {
							LOGGER.debug("IGNORED: {}", ignore.getMessage());
						}
					}
					if (out != null) {
						try {
							out.close();
						} catch (Exception ignore) {
							LOGGER.debug("IGNORED: {}", ignore.getMessage());
						}
					}
				}

			} else {
				response.setContentType("application/x-msdownload");

				PrintWriter printwriter = response.getWriter();
				printwriter.println("<html>");
				//printwriter.println("<br><br><br><h2>Could not get file name:<br>" + fvo.getOrignlFileNm() + "</h2>");
				printwriter.println("<br><br><br><h2>Could not get file name:<br>"+fileName+"</h2>");
				printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
				printwriter.println("<br><br><br>&copy; webAccess");
				printwriter.println("</html>");
				printwriter.flush();
				printwriter.close();
			}
		}
	}
	
	/**
	 * Disposition 지정하기.
	 *
	 * @param filename
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			//throw new RuntimeException("Not supported browser");
			throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}
	
	/**
	 * 브라우저 구분 얻기.
	 *
	 * @param request
	 * @return
	 */
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}
	
}