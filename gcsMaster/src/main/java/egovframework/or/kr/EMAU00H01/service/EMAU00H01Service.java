package egovframework.or.kr.EMAU00H01.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.AvailableVO;
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

public interface EMAU00H01Service {
  
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 신청과제 정보 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	 int insertEMAU00H0101(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여기관 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01021(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여기관 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01022(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여기관 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01023(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여인력 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01041(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여인력 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01042(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여인력 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01043(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 연구개발 및 사업화 계획
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H0105(Map<String, Object> param) throws Exception;
	 
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01071(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01072(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01073(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01074(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01075(HashMap<String, Object> paramMap) throws Exception;
	
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	int insertEMAU00H01076(HashMap<String, Object> paramMap) throws Exception;

	List<AppProInfo> searchPk(AppProInfo vo) throws Exception;

	List<AppProInfo> searchPk2(AppProInfo vo) throws Exception;

	List<AppProInfo> searchPk3(AppProInfo vo) throws Exception;

	List<AppProInfo> searchPk4(AppProInfo vo) throws Exception;

	int uploadFile(AppProInfo vo) throws Exception;
}