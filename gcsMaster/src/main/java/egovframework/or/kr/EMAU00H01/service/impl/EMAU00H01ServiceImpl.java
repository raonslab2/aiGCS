package egovframework.or.kr.EMAU00H01.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00H01.service.AppProInfo;
import egovframework.or.kr.EMAU00H01.service.EMAU00H01Service;
import egovframework.or.kr.EMAU00H01.service.PartOrgVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

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
@Service("EMAU00H01Service")
public class EMAU00H01ServiceImpl extends EgovAbstractServiceImpl implements EMAU00H01Service {

	@Resource(name = "EMAU00H01DAO")
	private EMAU00H01DAO eMAU00H01DAO;
 

	/**
	 * 일반 로그인을 처리한다
	 * 
	 * @param String LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */ 
	
	
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 신청과제 정보 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H0101(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H0101(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여기관 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01021(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01021(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여기관 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01022(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01022(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여기관 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01023(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01023(paramMap);
	}

	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여인력 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01041(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01041(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여인력 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01042(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01042(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 참여인력 등록
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01043(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01043(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 연구개발 및 사업화 계획
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H0105(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H0105(param);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01071(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01071(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01072(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01072(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01073(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01073(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01074(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01074(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01075(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01075(paramMap);
	}
	
	/**
	 * 지능형 평가모델 > 과제접수 등록 > 기관정보 관리
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertEMAU00H01076(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.insertEMAU00H01076(paramMap);
	}

	@Override
	public List<AppProInfo> searchPk(AppProInfo vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.searchPk(vo);
	}

	@Override
	public List<AppProInfo> searchPk2(AppProInfo vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.searchPk2(vo);
	}

	@Override
	public List<AppProInfo> searchPk3(AppProInfo vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.searchPk3(vo);
	}

	@Override
	public List<AppProInfo> searchPk4(AppProInfo vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.searchPk4(vo);
	}

	@Override
	public int uploadFile(AppProInfo vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H01DAO.uploadFile(vo);
	}
}