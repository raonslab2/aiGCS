package egovframework.or.kr.EMAU00E.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public interface EMAU00E01Service {

    /**
     * 게시판 사용 정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteBBSUseInf(BusinessPjInf bdUseInf) throws Exception;

    /**
     * 커뮤니티에 사용되는 게시판 사용정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteBBSUseInfByCmmnty(BusinessPjInfVO bdUseVO) throws Exception;

    /**
     * 동호회에 사용되는 게시판 사용정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteBBSUseInfByClub(BusinessPjInfVO bdUseVO) throws Exception;

    /**
     * 커뮤니티에 사용되는 모든 게시판 사용정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteAllBBSUseInfByCmmnty(BusinessPjInfVO bdUseVO) throws Exception;

    /**
     * 동호회에 사용되는 모든 게시판 사용정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteAllBBSUseInfByClub(BusinessPjInfVO bdUseVO) throws Exception;

    /**
     * 게시판 사용정보를 등록한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void insertBBSUseInf(BusinessPjInf bdUseInf) throws Exception;

    /**
     * 게시판 사용정보 목록을 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectBBSUseInfs(BusinessPjInfVO bdUseVO) throws Exception;

    /**
     * 게시판 사용정보를 수정한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void updateBBSUseInf(BusinessPjInf bdUseInf) throws Exception;

    /**
     * 게시판 사용정보에 대한 상세정보를 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public BusinessPjInfVO selectBBSUseInf(BusinessPjInfVO bdUseVO) throws Exception;

    /**
     * 게시판에 대한 사용정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception BusinessPjInf
     */
    public void deleteBBSUseInfByBoardId(BusinessPjInf bdUseInf) throws Exception;

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 목록을 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectBBSUseInfsByTrget(BusinessPjInfVO bdUseVO) throws Exception;

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 수정한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void updateBBSUseInfByTrget(BusinessPjInf bdUseInf) throws Exception;

    /**
	 * 사업 관리 - 사업별(사업정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
    HashMap<String, Object> projectDetail(Map<String, Object> param) throws Exception;
    /**
	 * 사업 관리 - 사업별(사업정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
	List<BusinessPjInf> searchFirstOption(BusinessPjInf vo) throws Exception;
	/**
	 * 권한 관리 - 검색 2Dept 셀렉트박스 
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	List<BusinessPjInf> searchSubOption(Map<String, Object> param) throws Exception ;
	/**
	 * 사업 관리 - 사업별(사업정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception Exception
	 */
	List<BusinessPjInf> searchManagerList(Map<String, Object> param);
	/**
	 * 사업 관리 - 담당자별(사업정보 - 권한)
	 * @param param Map
	 * @return BusinessPjInf List
	 *
	 * @exception Exception Exception
	 */
	List<BusinessPjInf> memberList(Map<String, Object> param) throws Exception;
	
	/**
	 * 사업 관리 - 담당자별(사업정보 - 권한)
	 * @param param Map
	 * @return BusinessPjInf List
	 *
	 * @exception Exception Exception
	 */
	List<BusinessPjInf> searchProject(Map<String, Object> param) throws Exception;
	int authInsert(Map<String, Object> param) throws Exception;
	int authUpdate(Map<String, Object> param) throws Exception;
	int authDelete(Map<String, Object> param) throws Exception;
	
	HashMap<String, Object> authDetail(Map<String, Object> param) throws Exception;
	
	/**
	 * 사업관리 > 최종 업데이트 날짜 가져오기
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	HashMap<String, Object> getSysUpdate(Map<String, Object> param) throws Exception;
 

	
	/**
	 * 사업관리 > 검색서비스 ( 사업명 )
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	List<BusinessPjInf> searchBusinessList(BusinessPjInf vo) throws Exception;
	
	/**
	 * 사업관리 > 검색서비스 ( 사업부서 )
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	List<BusinessPjInf> searchDeptList(BusinessPjInf vo) throws Exception;
 
	/**
	 * 사업관리 > 사업권한 가져오기
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	List<BusinessPjInf> searchAuthList(BusinessPjInf vo) throws Exception;

	/**
	 * 사업관리 > 사업권한 저장하기
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	 int authBusinessUpdate(Map<String, Object> param) throws Exception;

	public int searchBusinessListCnt(BusinessPjInf vo) throws Exception;

	public int searchDeptListCnt(BusinessPjInf vo) throws Exception;
	
	 
}
	