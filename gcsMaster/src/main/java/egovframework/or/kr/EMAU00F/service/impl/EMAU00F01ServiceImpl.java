package egovframework.or.kr.EMAU00F.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00F.service.EMAU00F01Service;
import egovframework.or.kr.EMAU00F.service.EmauProjectVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

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
@Service("EMAU00F01Service")
public class EMAU00F01ServiceImpl extends EgovAbstractServiceImpl implements EMAU00F01Service {

	@Resource(name = "EMAU00F01DAO")
	private EMAU00F01DAO eMAU00F01DAO;
	
	/**
	 * 권한 관리 - 담당자별 목록
	 * @param vo EmmbgroupVO
	 * @return EmmbgroupVO
	 * 
	 * @exception Exception
	 */
	@Override
	public List<EmmbgroupVO> managerList(EmmbgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.managerList(vo);
	}
	
	/**
	 * 권한 관리 - 담당자별 검색 목록
	 * @param param Map
	 * @return EmmbgroupVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<EmmbgroupVO> searchManagerList(EmmbgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.searchManagerList(vo);
	}
	
	/**
	 * 권한 관리 - 담당자별(담당자 정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
	@Override
	public HashMap<String, Object> managerDetail(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.managerDetail(param);
	}
	
	/**
	 * 권한 관리 - 담당자별(회원정보 - 권한)
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<EmmbgroupVO> authList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.authList(param);
	}
	
	/**
	 * 권한 관리 - 검색 1Dept 셀렉트박스
	 * @param vo EmmbgroupVO
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<EmmbgroupVO> searchFirstOption(EmmbgroupVO vo) throws Exception  {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.searchFirstOption(vo);
	}
	
	/**
	 * 권한 관리 - 검색 2Dept 셀렉트박스 
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<EmmbgroupVO> searchSubOption(Map<String, Object> param) throws Exception  {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.searchSubOption(param);
	}
	
	/**
	 * 권한 관리 - 권한추가 - 사업 검색
	 * @param param Map
	 * @return EmauProjectVO List
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<EmauProjectVO> searchProject(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.searchProject(param);
	}
	
	/**
	 * 권한 관리 - 담당자별(권한 추가/수정)
	 * @param param Map
	 * @return int
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int authInsert(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.authInsert(param);
	}
	
	/**
	 * 권한 관리 - 담당자별(권한 추가/수정)
	 * @param param Map
	 * @return int
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int authUpdate(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.authUpdate(param);
	}
	
	/**
	 * 권한 관리 - 담당자별(권한 해당정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
	@Override
	public HashMap<String, Object> authDetail(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.authDetail(param);
	}
	
	/**
	 * 권한 관리 - 담당자별(권한 삭제)
	 * @param param Map
	 * @return int
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int authDelete(Map<String, Object> param) throws Exception{
		// TODO Auto-generated method stub
		return eMAU00F01DAO.authDelete(param);
	}
	
	/**
	 * 권한 관리 - 사업별 목록
	 * @param vo EmauProjectVO
	 * @return EmauProjectVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<EmauProjectVO> projectList(EmauProjectVO epVO) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.projectList(epVO);
	}
	
	/**
	 * 권한 관리 - 사업별(사업정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception
	 */
	@Override
	public HashMap<String, Object> projectDetail(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.projectDetail(paramMap);
	}
	
	/**
	 * 권한 관리 - 사업별(사업정보 - 부서별 권한설정)
	 * 사업권한 가져오기
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<EmmbgroupVO> projectAuthList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.projectAuthList(param);
	}

	

	

	@Override
	public int projectUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.projectUpdate(paramMap);
	}

	@Override
	public List<EmauProjectVO> searchProjectAutocomplete(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.searchProjectAutocomplete(paramMap);
	}

	@Override
	public List<EmauProjectVO> searchProjectList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.searchProjectList(paramMap);
	}

	@Override
	public int changePassword(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.changePassword(vo);
	}

	@Override
	public int managerListCnt(EmmbgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.managerListCnt(vo);
	}

	@Override
	public int searchManagerListCnt(EmmbgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.searchManagerListCnt(vo);
	}

	@Override
	public List<EmmbgroupVO> popupManagerList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00F01DAO.popupManagerList(param);
	}



	


	

	

	

	

	

	
	/**
	 * 조직부서 검색
	 * @param vo EmmbgroupVO
	 * @return EmmbgroupVO
	 * @exception Exception
	 */
	/*
	@Override
	public EmmbgroupVO searchGroup(EmmbgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		EmmbgroupVO egroupVO = eMAU00F01DAO.searchGroup(vo);
		System.out.println(vo);
		System.out.println(egroupVO);
		
		return egroupVO;
	}
	*/

}