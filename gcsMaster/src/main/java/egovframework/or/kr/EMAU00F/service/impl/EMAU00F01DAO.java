package egovframework.or.kr.EMAU00F.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00F.service.EmauProjectVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

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
@Repository("EMAU00F01DAO")
public class EMAU00F01DAO extends EgovAbstractDAO {

	/**
	 * 권한 관리 - 담당자별 목록
	 * @param vo EmmbgroupVO
	 * @return EmmbgroupVO
	 * 
	 * @exception Exception
	 */
	public List<EmmbgroupVO> managerList(EmmbgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmmbgroupVO>) list("EMAU00F01.managerList", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null ;
		}
	}
	
	/**
	 * 권한 관리 - 담당자별 검색 목록
	 * @param vo Map
	 * @return EmmbgroupVO
	 *
	 * @exception Exception Exception
	 */
	public List<EmmbgroupVO> searchManagerList(EmmbgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmmbgroupVO>) list("EMAU00F01.searchManagerList", vo);
	}
	
	/**
	 * 권한 관리 - 담당자별(담당자 정보)
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	public HashMap<String, Object> managerDetail(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (HashMap<String, Object>) select("EMAU00F01.managerDetail", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null ;
		}
	}
	
	/**
	 * 권한 관리 - 담당자별(회원정보 - 권한)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
	public List<EmmbgroupVO> authList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmmbgroupVO>) list("EMAU00F01.authList", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null ;
		}
	}
	
	/**
	 * 권한 관리 - 검색 1Dept 셀렉트박스
	 * @param vo EmmbgroupVO
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	public List<EmmbgroupVO> searchFirstOption(EmmbgroupVO vo) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmmbgroupVO>) list("EMAU00F01.searchFirstOption", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	/**
	 * 권한 관리 - 검색 2Dept 셀렉트박스 
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	public List<EmmbgroupVO> searchSubOption(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmmbgroupVO>) list("EMAU00F01.searchSubOption", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	/**
	 * 권한 관리 - 권한추가 - 사업 검색
	 * @param param Map
	 * @return EmauProjectVO List
	 *
	 * @exception Exception Exception
	 */
	public List<EmauProjectVO> searchProject(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmauProjectVO>) list("EMAU00F01.searchProject", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	/**
	 * 권한 관리 - 담당자별(권한 추가/수정)
	 * @param param Map
	 * @return int
	 *
	 * @exception Exception Exception
	 */
	public int authInsert(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (int) insert("EMAU00F01.authInsert", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	/**
	 * 권한 관리 - 담당자별(권한 추가/수정)
	 * @param param Map
	 * @return int
	 *
	 * @exception Exception Exception
	 */
	public int authUpdate(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (int) update("EMAU00F01.authUpdate", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	/**
	 * 권한 관리 - 담당자별(권한 해당정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
	public HashMap<String, Object> authDetail(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (HashMap<String, Object>) select("EMAU00F01.authDetail", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	/**
	 * 권한 관리 - 담당자별(권한 삭제)
	 * @param param Map
	 * @return int
	 *
	 * @exception Exception Exception
	 */
	public int authDelete(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return delete("EMAU00F01.authDelete", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}
	
	/**
	 * 권한 관리 - 사업별 목록
	 * @param vo EmauProjectVO
	 * @return EmauProjectVO
	 *
	 * @exception Exception Exception
	 */
	public List<EmauProjectVO> projectList(EmauProjectVO epVO) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmauProjectVO>) list("EMAU00F01.projectList", epVO);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null ;
		}
	}
	
	/**
	 * 권한 관리 - 사업별(사업정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception
	 */
	public HashMap<String, Object> projectDetail(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (HashMap<String, Object>) select("EMAU00F01.projectDetail", paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	/**
	 * 권한 관리 - 사업별(사업정보 - 부서별 권한설정)
	 * 사업권한 가져오기
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	public List<EmmbgroupVO> projectAuthList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmmbgroupVO>) list("EMAU00F01.projectAuthList", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}



	public int projectUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) update("EMAU00F01.projectUpdate", paramMap);
	}

	public List<EmauProjectVO> searchProjectAutocomplete(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmauProjectVO>) list("EMAU00F01.searchProjectAutocomplete", paramMap);
	}

	public List<EmauProjectVO> searchProjectList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmauProjectVO>) list("EMAU00F01.searchProjectList", paramMap);
	}

	public int changePassword(LoginVO vo) {
		// TODO Auto-generated method stub
		return (int) update("EMAU00F01.changePassword", vo);
	}

	public int managerListCnt(EmmbgroupVO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00F01.managerListCnt", vo);
	}

	public int searchManagerListCnt(EmmbgroupVO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00F01.searchManagerListCnt", vo);
	}

	public List<EmmbgroupVO> popupManagerList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (List<EmmbgroupVO>) list("EMAU00F01.popupManagerList", param);
	}



}
