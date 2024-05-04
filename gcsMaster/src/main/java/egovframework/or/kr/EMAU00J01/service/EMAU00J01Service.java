package egovframework.or.kr.EMAU00J01.service;

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

public interface EMAU00J01Service {
 
	List<EMAU00J01VO> selectList(Map<String, Object> param);
 
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 잠재력 > 창의 도전성
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	 int insertEMAU00J0102(HashMap<String, Object> paramMap) throws Exception;
	 
   /**
	* 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 잠재력 > 창의 도전성
	* @param param Map
	* @return 
	*
	* @exception Exception Exception
	*/
	 int updateEMAU00J0102(TechVO vo) throws Exception;

	/**
     * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 잠재력 > 기술 파급력
	 * @param param Map
	 * @return 
     *
     * @exception Exception Exception
	 */
	 int insertEMAU00J0103(HashMap<String, Object> paramMap) throws Exception;
	
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 잠재력 > 기술 파급력
	  * @param param Map
	  * @return 
	  *
	  * @exception Exception Exception
	  */
	 int updateEMAU00J0103(TechVO vo) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	 int insertEMAU00J0104(HashMap<String, Object> paramMap) throws Exception;
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	 int updateEMAU00J0104(TechVO vo) throws Exception;
	 
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 기술개발 역량
     * @param param Map
     * @return 
	 *
	 * @exception Exception Exception
   	 */
	 int insertEMAU00J0105(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 기술개발 역량
      * @param param Map
      * @return 
	  *
	  * @exception Exception Exception
   	  */
	 int updateEMAU00J0105(TechVO vo) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 계획의 구체성 및 적정성
      * @param param Map
      * @return 
	  *
	  * @exception Exception Exception
   	  */
	 int insertEMAU00J0106(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 계획의 구체성 및 적정성
      * @param param Map
      * @return 
	  *
	  * @exception Exception Exception
   	  */
	 int updateEMAU00J0106(TechVO vo) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 기술보호 적정성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int insertEMAU00J0107(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 기술보호 적정성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int updateEMAU00J0107(TechVO vo) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 목표시장 잠재력 > 목표시장 혁신성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int insertEMAU00J0108(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 목표시장 잠재력 > 목표시장 혁신성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int updateEMAU00J0108(BusinessVO vo) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 목표시장 잠재력 > 목표시장 규모 및 성장성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int insertEMAU00J0109(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 목표시장 잠재력 > 목표시장 규모 및 성장성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int updateEMAU00J0109(BusinessVO vo) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 사업화 역량
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int insertEMAU00J0110(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 사업화 역량
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int updateEMAU00J0110(BusinessVO vo) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 시장진입 가능성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int insertEMAU00J0111(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 시장진입 가능성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int updateEMAU00J0111(BusinessVO vo) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 사업화 투자계획 적정성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int insertEMAU00J0112(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 사업화 투자계획 적정성
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int updateEMAU00J0112(BusinessVO vo) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 정책부합성> 고용친화도
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int insertEMAU00J0113(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 정책부합성> 고용친화도
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int updateEMAU00J0113(PolicyConformVO vo) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 정책부합성> 산업별특화지표
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int insertEMAU00J0114(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
	  * 지능형 평가모델 > 과제평가 > 심층평가> 정책부합성> 산업별특화지표
	  * @param param Map
	  * @return 
      *
	  * @exception Exception Exception
	  */
	 int updateEMAU00J0114(PolicyConformVO vo) throws Exception;
}