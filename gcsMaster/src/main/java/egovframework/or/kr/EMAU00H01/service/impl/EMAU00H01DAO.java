package egovframework.or.kr.EMAU00H01.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00H01.service.AppProInfo;
import egovframework.or.kr.EMAU00H01.service.PartOrgVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

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
@Repository("EMAU00H01DAO")
public class EMAU00H01DAO extends EgovAbstractDAO {

 
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 신청과제 정보 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H0101(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H0101", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여기관 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	
	public int insertEMAU00H01021(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01021", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여기관 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	
	public int insertEMAU00H01022(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01022", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여기관 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	
	public int insertEMAU00H01023(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01023", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여인력 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H01041(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01041", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여인력 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H01042(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01042", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여인력 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H01043(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01043", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 연구개발 및 사업화 계획
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H0105(Map<String, Object> param) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H0105", param);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H01071(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01071", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H01072(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01072", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H01073(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01073", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H01074(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01074", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H01075(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01075", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int insertEMAU00H01076(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00H01.insertEMAU00H01076", paramMap);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}

	public List<AppProInfo> searchPk(AppProInfo vo) {
		// TODO Auto-generated method stub
		try {
		return (List<AppProInfo>) list("EMAU00H01.searchPk", vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<AppProInfo> searchPk2(AppProInfo vo) {
		// TODO Auto-generated method stub
		try {
		return (List<AppProInfo>) list("EMAU00H01.searchPk2", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<AppProInfo> searchPk3(AppProInfo vo) {
		// TODO Auto-generated method stub
		try {
		return (List<AppProInfo>) list("EMAU00H01.searchPk3", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<AppProInfo> searchPk4(AppProInfo vo) {
		// TODO Auto-generated method stub
		try {
		return (List<AppProInfo>) list("EMAU00H01.searchPk4", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int uploadFile(AppProInfo vo) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("EMAU00H01.uploadFile", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
	}
}
}
