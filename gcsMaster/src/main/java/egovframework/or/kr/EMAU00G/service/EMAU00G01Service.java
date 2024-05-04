package egovframework.or.kr.EMAU00G.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.CommonVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;

/**
 * 일반 로그인을 처리하는 비즈니스 구현 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */

public interface EMAU00G01Service {

	HashMap<String, Object> searchBusiness(Map<String, Object> param);

	String businessDepart(LoginVO user);

	List<EMAU00G01VO> searchRpaPjList1(Map<String, Object> param) throws Exception;

	List<EMAU00G01VO> dataRequest(Map<String, Object> paramMap);

	List<EmpjVO> autocomplete(Map<String, Object> param);

	List<EMAU00G01VO> searchRpaPjList(Map<String, Object> param);

	int insertEMAU00G01(Map<String, Object> param) throws Exception;

	List<EMAU00G01VO> eMAU00RPA10001(Map<String, Object> param) throws Exception;
	
	int eMAU00RPA10002(String seCode) throws Exception;


	int insert2EMAU00G01(HashMap<String, Object> resultMap) throws Exception;

	HashMap<String, Object> selectEMAU00G01(Map<String, Object> param) throws Exception;
}