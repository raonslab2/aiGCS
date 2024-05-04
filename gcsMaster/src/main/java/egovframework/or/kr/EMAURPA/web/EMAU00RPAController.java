package egovframework.or.kr.EMAURPA.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
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
import egovframework.let.cop.com.service.EgovBBSUseInfoManageService;
import egovframework.or.kr.EMAU00F.service.EMAU00F01Service;
import egovframework.or.kr.EMAU00G.service.EMAU00G01Service;
import egovframework.or.kr.EMAU00G.service.EMAU00G01VO;
import egovframework.or.kr.com.utill.CommUtil;
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
public class EMAU00RPAController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EMAU00RPAController.class);

	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EMAU00F01Service")
	private EMAU00F01Service eMAU00F01Service;

	@Resource(name = "EMAU00G01Service")
	private EMAU00G01Service eMAU00G01Service;

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
	 * 권한 관리 - 담당자별
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */

	/**
	 * RPA 수집된 정보 --> 스케줄러에 등록
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/rpa/eMAU00RPA1000.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00RPA1000(@RequestBody Map<String, Object> param, ModelMap model) {
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);

		String taskName = (String) param.get("taskName");
		List<EMAU00G01VO> list = null;
		int result = 0;
		try {
			// 1. 미수행과제 호출 - EM_RPA_REQUEST
			list = (List<EMAU00G01VO>) eMAU00G01Service.eMAU00RPA10001(param);
			// 2. 수행으로 처리
			String seCode = (String) list.get(0).getSeCode();
			// String seCode = String.valueOf(list.get(0).getSeCode());
			result = eMAU00G01Service.eMAU00RPA10002(seCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		LinkedHashMap<String, Object> resultMap = new LinkedHashMap<String, Object>();
		if (taskName.equals("task2")) {
//			1. 사업접수결과보고_결재
			resultMap.put("product", "Live JSON generator");
			resultMap.put("version", 3.1);
			resultMap.put("releaseDate", "2021-05-20T00:00:00.000Z");
			resultMap.put("demo", true);
			LinkedHashMap<String, Object> referenceMap = new LinkedHashMap<String, Object>();
			referenceMap.put("소속사업실", list.get(0).getGrmName());
			referenceMap.put("사업차수", "2차");
			referenceMap.put("사업수립일", "20. 12. 30.");
			referenceMap.put("사업공고일", "21. 4. 23.");
			referenceMap.put("사업신청접수일", "21. 4. 23. ~ 5. 24.");
			LinkedHashMap<String, Object> referenceMap1 = new LinkedHashMap<String, Object>();
			referenceMap1.put("공고코드", "S01040");
			// referenceMap1.put("공고명", list.get(0).getPjTitle());
			referenceMap1.put("공고명", "2021년 공정품질기술개발사업(현장형R&D) 공고");
//			referenceMap1.put("세부공고코드", list.get(0).getPjTitleNum());
			referenceMap1.put("세부공고코드", "2");
//			referenceMap1.put("세부공고명", list.get(0).getPjTitle());
			referenceMap1.put("세부공고명", "2021년 공정품질기술개발사업(현장형R&D) 2차 공고");
			LinkedHashMap<String, Object> referenceMap2 = new LinkedHashMap<String, Object>();
			referenceMap2.put("공고코드", "S01041");
// 			referenceMap2.put("공고명", list.get(0).getPjTitle());
			referenceMap2.put("공고명", "2021년 공정품질기술개발사업(혁신형R&D) 공고");
			referenceMap2.put("세부공고코드", "2");
//			referenceMap2.put("세부공고코드", list.get(0).getPjTitleNum());
//			referenceMap2.put("세부공고명", list.get(0).getPjTitle());
			referenceMap2.put("세부공고명", "2021년 공정품질기술개발사업(혁신형R&D) 2차 공고");
			List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
			listMap.add(referenceMap1);
			listMap.add(referenceMap2);
			referenceMap.put("조회조건(Main)", listMap);
			referenceMap.put("알림", "hw.jeon@takesolution.co.kr");
			referenceMap.put("일련번호", list.get(0).getSeCode());
			resultMap.put("ReferenceInformation", referenceMap);
			JSONObject json = new JSONObject(resultMap);
			LOGGER.error("{} : ModelAndView.", json.toString());
			mav.addObject(json.toString());
//			mav.addObject("result", "200::" + resultMap.toString());
		}
		if ((taskName.equals("task3")) || (taskName.equals("task1"))) {
//			2. 사업접수결과보고_중복성검토및요건검토자료요청
			resultMap.put("product", "Live JSON generator");
			resultMap.put("version", 3.1);
			resultMap.put("releaseDate", "2021-05-20T00:00:00.000Z");
			resultMap.put("demo", true);
			LinkedHashMap<String, Object> referenceMap = new LinkedHashMap<String, Object>();
			referenceMap.put("소속사업실", list.get(0).getGrmName());
			HashMap<String, Object> noticeMap = new HashMap<String, Object>();
			noticeMap.put("공고코드", list.get(0).getPjCode());
//			noticeMap.put("공고코드", "S01076");
			noticeMap.put("공고명", list.get(0).getPjTitle());
//			noticeMap.put("공고명", "2021년도 창업성장기술개발사업 전략형 과제(4IR) 제1차 시행계획 공고");
			referenceMap.put("공고", noticeMap);
			HashMap<String, Object> noticeDetailMap = new HashMap<String, Object>();
			noticeDetailMap.put("세부공고코드", list.get(0).getPjTitleNum());
//			noticeDetailMap.put("세부공고코드", "1");
			noticeDetailMap.put("세부공고명", list.get(0).getPjTitle());
//			noticeDetailMap.put("세부공고명", "2021년도 창업성장기술개발사업 전략형 과제(4IR) 제1차 시행계획 공고");
			referenceMap.put("세부공고", noticeDetailMap);
			referenceMap.put("알림", "hw.jeon@takesolution.co.kr");
			referenceMap.put("일련번호", list.get(0).getSeCode());
			resultMap.put("ReferenceInformation", referenceMap);
			JSONObject json = new JSONObject(resultMap);
			mav.addObject(json.toString());
//			mav.addObject("result", "200::" + resultMap.toString());
		}
		if (taskName.equals("task4")) {
//			 3. 평가결과보고
			resultMap.put("product", "Live JSON generator");
			resultMap.put("version", 3.1);
			resultMap.put("releaseDate", "2021-05-20T00:00:00.000Z");
			resultMap.put("demo", true);
			LinkedHashMap<String, Object> referenceMap = new LinkedHashMap<String, Object>();
			List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
			referenceMap.put("소속사업실", list.get(0).getGrmName());
			LinkedHashMap<String, Object> referenceMap1 = new LinkedHashMap<String, Object>();
//			referenceMap1.put("공고코드", "S01022");
			referenceMap1.put("공고명", list.get(0).getPjTitle());
//			referenceMap1.put("공고명", "2021년도 중소기업기술혁신개발사업 '시장대응형(일반) 과제' 1차 시행계획 수정 공고");
			referenceMap1.put("세부공고코드", list.get(0).getPjTitleNum());
//			referenceMap1.put("세부공고코드", "2");
			referenceMap1.put("세부공고명", list.get(0).getPjTitle());
//			referenceMap1.put("세부공고명", "2021년도 중소기업기술혁신개발사업 '시장대응형(일반) 과제' 1차 시행계획 수정 공고");
			listMap.add(referenceMap1);
			referenceMap.put("조회조건", listMap);
			referenceMap.put("평가구분", list.get(0).getReGubun());
//			referenceMap.put("평가구분", "서면");
//			referenceMap.put("알림", "hw.jeon@takesolution.co.kr");
			referenceMap.put("일련번호", list.get(0).getSeCode());
			resultMap.put("ReferenceInformation", referenceMap);
			System.out.println(resultMap);
			JSONObject json = new JSONObject(resultMap);
			mav.addObject(json.toString());
//			mav.addObject("result", "200::" + resultMap.toString());
		}
		return mav;
	}

	/**
	 * RPA 수집된 정보 --> 스케줄러에 등록
	 * 
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/empo/rpa/eMAU00RPA1001.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView eMAU00RPA1001(@RequestBody Map<String, Object> param, ModelMap model) {
		ModelAndView mav = new ModelAndView("jsonView");
		EgovMap map = CommUtil.makeEgovMap(param);

		LOGGER.error("{} : ModelAndView.", map.toString());

		String seqCode = String.valueOf(map.get("SeqCode"));
		String successYN = (String) map.get("successYN");
		String failReason = (String) map.get("failReason");

		String strJoin = "";
		if ("".equals(param.get("resultFile"))) {
			LOGGER.error("{} : param.get(\"resultFile\").", param.get("resultFile"));
		} else {
			ArrayList<String> resultFile = (ArrayList<String>) param.get("resultFile");
			strJoin = String.join("||", resultFile);
			LOGGER.error("{} : param.get(\"strJoin\").", strJoin);
		}

		param.put("resultFile", strJoin);

		int result = 0;
		HashMap<String, Object> resultMap = null;
		try {
			resultMap = eMAU00G01Service.selectEMAU00G01(param);
			System.out.println("resultMap :: " + resultMap);
			result = eMAU00G01Service.insert2EMAU00G01(resultMap);
			eMAU00G01Service.insertEMAU00G01(param);
		} catch (Exception e) {
			// TODO: handle exception e.printStackTrace();
		}
		System.out.println(map.toString());
		mav.addObject("result", "200::" + map.toString());

		return mav;
	}

}