package egovframework.or.kr.EMAU00F.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00F.service.EmauProjectVO;
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
public interface EMAU00F01Service {
	
	/**
	 * 권한 관리 - 담당자별 목록
	 * @param vo EmmbgroupVO
	 * @return EmmbgroupVO
	 *
	 * @exception Exception Exception
	 */
	List<EmmbgroupVO> managerList(EmmbgroupVO vo) throws Exception;
	
	/**
	 * 권한 관리 - 담당자별 검색 목록
	 * @param vo Map
	 * @return EmmbgroupVO
	 *
	 * @exception Exception Exception
	 */
	List<EmmbgroupVO> searchManagerList(EmmbgroupVO vo) throws Exception;
	
	/**
	 * 권한 관리 - 담당자별(담당자 정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
	HashMap<String, Object> managerDetail(Map<String, Object> param) throws Exception;
	
	/**
	 * 권한 관리 - 담당자별(회원정보 - 권한)
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	List<EmmbgroupVO> authList(Map<String, Object> param) throws Exception;
	
	/**
	 * 권한 관리 - 검색 1Dept 셀렉트박스 
	 * @param vo EmmbgroupVO
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	List<EmmbgroupVO> searchFirstOption(EmmbgroupVO vo) throws Exception ;
	
	/**
	 * 권한 관리 - 검색 2Dept 셀렉트박스 
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	List<EmmbgroupVO> searchSubOption(Map<String, Object> param) throws Exception ;
	
	/**
	 * 권한 관리 - 권한추가 - 사업 검색
	 * @param param Map
	 * @return EmauProjectVO List
	 *
	 * @exception Exception Exception
	 */
	List<EmauProjectVO> searchProject(Map<String, Object> param) throws Exception;
	
	/**
	 * 권한 관리 - 담당자별(권한 추가/수정)
	 * @param param Map
	 * @return int
	 *
	 * @exception Exception Exception
	 */
	int authInsert(Map<String, Object> param) throws Exception;
	
	/**
	 * 권한 관리 - 담당자별(권한 추가/수정)
	 * @param param Map
	 * @return int
	 *
	 * @exception Exception Exception
	 */
	int authUpdate(Map<String, Object> param) throws Exception;
	
	/**
	 * 권한 관리 - 담당자별(권한 해당정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
	HashMap<String, Object> authDetail(Map<String, Object> param) throws Exception;
	
	/**
	 * 권한 관리 - 담당자별(권한 삭제)
	 * @param param Map
	 * @return int
	 *
	 * @exception Exception Exception
	 */
	int authDelete(Map<String, Object> param) throws Exception;
	
	/**
	 * 권한 관리 - 사업별 목록
	 * @param vo EmauProjectVO
	 * @return EmauProjectVO
	 *
	 * @exception Exception Exception
	 */
	List<EmauProjectVO> projectList(EmauProjectVO epVO) throws Exception;

	/**
	 * 권한 관리 - 사업별(사업정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
	HashMap<String, Object> projectDetail(HashMap<String, Object> paramMap) throws Exception;

	/**
	 * 권한 관리 - 사업별(사업정보 - 부서별 권한설정)
	 * 사업권한 가져오기
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	List<EmmbgroupVO> projectAuthList(Map<String, Object> param) throws Exception;

	int projectUpdate(HashMap<String, Object> paramMap) throws Exception;

	List<EmauProjectVO> searchProjectAutocomplete(HashMap<String, Object> paramMap) throws Exception;

	List<EmauProjectVO> searchProjectList(HashMap<String, Object> paramMap) throws Exception;

	int changePassword(LoginVO vo) throws Exception;

	int managerListCnt(EmmbgroupVO vo) throws Exception;

	int searchManagerListCnt(EmmbgroupVO vo) throws Exception;

	List<EmmbgroupVO> popupManagerList(Map<String, Object> param) throws Exception;





	

	

	

	



	


	/**
	 * 사업부서 정보
	 * @return EmmbgroupVO
	 *
	 * @param vo    EmmbgroupVO
	 * @exception Exception Exception
	 */
	//public EmmbgroupVO searchGroup(EmmbgroupVO vo) throws Exception;

}