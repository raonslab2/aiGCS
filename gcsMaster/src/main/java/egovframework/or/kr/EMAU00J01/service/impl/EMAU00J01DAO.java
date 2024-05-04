package egovframework.or.kr.EMAU00J01.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.CommonVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00J01.service.BusinessVO;
import egovframework.or.kr.EMAU00J01.service.EMAU00J01VO;
import egovframework.or.kr.EMAU00J01.service.PolicyConformVO;
import egovframework.or.kr.EMAU00J01.service.TechVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * 일반 로그인을 처리하는 비즈니스 구현 클래스
 * 
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *      </pre>
 */
@Repository("EMAU00J01DAO")
public class EMAU00J01DAO extends EgovAbstractDAO {

	/**
	 * 사업명 검색
	 * 
	 * @param vo searchCode
	 * @return CommonVO
	 * @exception Exception
	 */
	public List<EMAU00J01VO> selectList(Map<String, Object> param) {
		try {
			return (List<EMAU00J01VO>) select("EMAU00J01.selectList", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 잠재력 > 창의 도전성
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00J0102(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0102", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 잠재력 > 창의 도전성
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int updateEMAU00J0102(TechVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0102", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
     * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 잠재력 > 기술 파급력
	 * @param param Map
	 * @return 
     *
     * @exception Exception Exception
	 */
	public int insertEMAU00J0103(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0103", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
     * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 잠재력 > 기술 파급력
	 * @param param Map
	 * @return 
     *
     * @exception Exception Exception
	 */
	public int updateEMAU00J0103(TechVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0103", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00J0104(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0104", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int updateEMAU00J0104(TechVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0104", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 기술개발 역량
     * @param param Map
     * @return 
	 *
	 * @exception Exception Exception
  	 */
	public int insertEMAU00J0105(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0105", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 기술개발 역량
     * @param param Map
     * @return 
	 *
	 * @exception Exception Exception
  	 */
	public int updateEMAU00J0105(TechVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0105", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 계획의 구체성 및 적정성
     * @param param Map
     * @return 
	 *
	 * @exception Exception Exception
  	 */
	public int insertEMAU00J0106(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0106", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 계획의 구체성 및 적정성
     * @param param Map
     * @return 
	 *
	 * @exception Exception Exception
  	 */
	public int updateEMAU00J0106(TechVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0106", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 기술보호 적정성
     * @param param Map
     * @return 
	 *
	 * @exception Exception Exception
  	 */
	public int insertEMAU00J0107(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0107", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 기술성> 목표기술 실현가능성 > 기술보호 적정성
     * @param param Map
     * @return 
	 *
	 * @exception Exception Exception
  	 */
	public int updateEMAU00J0107(TechVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0107", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 목표시장 잠재력 > 목표시장 혁신성
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int insertEMAU00J0108(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0108", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 목표시장 잠재력 > 목표시장 혁신성
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int updateEMAU00J0108(BusinessVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0108", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 목표시장 잠재력 > 목표시장 규모 및 성장성
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int insertEMAU00J0109(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0109", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 목표시장 잠재력 > 목표시장 규모 및 성장성
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int updateEMAU00J0109(BusinessVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0109", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 사업화 역량
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int insertEMAU00J0110(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0110", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 사업화 역량
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int updateEMAU00J0110(BusinessVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0110", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 진입가능성
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int insertEMAU00J0111(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0111", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 진입가능성
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int updateEMAU00J0111(BusinessVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0111", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 사업화 투자계획 적정성
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int insertEMAU00J0112(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0112", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 사업성> 사업화 실현가능성 > 사업화 투자계획 적정성
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int updateEMAU00J0112(BusinessVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0112", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 정책부합성> 고용친화도
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int insertEMAU00J0113(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0113", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 정책부합성> 고용친화도
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int updateEMAU00J0113(PolicyConformVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0113", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 정책부합성> 산업별특화지표
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int insertEMAU00J0114(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00J01.insertEMAU00J0114", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제평가 > 심층평가> 정책부합성> 산업별특화지표
	 * @param param Map
	 * @return 
     *
	 * @exception Exception Exception
	 */
	public int updateEMAU00J0114(PolicyConformVO vo) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00J01.updateEMAU00J0114", vo);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
}
