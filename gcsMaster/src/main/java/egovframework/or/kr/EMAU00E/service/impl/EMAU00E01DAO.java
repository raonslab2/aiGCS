package egovframework.or.kr.EMAU00E.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.let.cop.com.service.BoardUseInf;
import egovframework.let.cop.com.service.BoardUseInfVO;
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00E.service.BusinessPjInfVO;
import egovframework.or.kr.EMAU00E.service.BusinessPjVO;
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
@Repository("EMAU00E01DAO")
public class EMAU00E01DAO extends EgovAbstractDAO {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		return (LoginVO) select("EMAU00E01.test", vo);
	}
	


    /**
     * 게시판 사용 정보를 삭제한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteBBSUseInf(BusinessPjInf bdUseInf) throws Exception {
	update("EMAU00E01DAO.deleteBBSUseInf", bdUseInf);
    }

    /**
     * 커뮤니티에 사용되는 게시판 사용정보 목록을 조회한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BusinessPjInf> selectBBSUseInfByCmmnty(BusinessPjInfVO bdUseVO) throws Exception {
	return (List<BusinessPjInf>) list("EMAU00E01DAO.selectBBSUseInfByCmmnty", bdUseVO);
    }

    /**
     * 동호회에 사용되는 게시판 사용정보 목록을 조회한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BusinessPjInf> selectBBSUseInfByClub(BusinessPjInfVO bdUseVO) throws Exception {
	return (List<BusinessPjInf>) list("EMAU00E01DAO.selectBBSUseInfByClub", bdUseVO);
    }

    /**
     * 커뮤니티에 사용되는 모든 게시판 사용정보를 삭제한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteAllBBSUseInfByCmmnty(BusinessPjInfVO bdUseVO) throws Exception {
	update("EMAU00E01DAO.deleteAllBBSUseInfByCmmnty", bdUseVO);
    }

    /**
     * 동호회에 사용되는 모든 게시판 사용정보를 삭제한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteAllBBSUseInfByClub(BusinessPjInfVO bdUseVO) throws Exception {
	update("EMAU00E01DAO.deleteAllBBSUseInfByClub", bdUseVO);
    }

    /**
     * 게시판 사용정보를 등록한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void insertBBSUseInf(BusinessPjInf bdUseInf) throws Exception {
	insert("EMAU00E01DAO.insertBBSUseInf", bdUseInf);
    }

    /**
     * 게시판 사용정보 목록을 조회한다.
     *
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BusinessPjInfVO> selectBBSUseInfs(BusinessPjInfVO bdUseVO) throws Exception {
	return (List<BusinessPjInfVO>) list("EMAU00E01DAO.selectBBSUseInfs", bdUseVO);
    }

    /**
     *
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public int selectBBSUseInfsCnt(BusinessPjInfVO bdUseVO) throws Exception {
	return (Integer)select("EMAU00E01DAO.selectBBSUseInfsCnt", bdUseVO);
    }

    /**
     * 게시판 사용정보에 대한 상세정보를 조회한다.
     *
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public BusinessPjInfVO selectBBSUseInf(BusinessPjInfVO bdUseVO) throws Exception {
	return (BusinessPjInfVO)select("EMAU00E01DAO.selectBBSUseInf", bdUseVO);
    }

    /**
     * 게시판 사용정보를 수정한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void updateBBSUseInf(BusinessPjInf bdUseInf) throws Exception {
	update("EMAU00E01DAO.updateBBSUseInf", bdUseInf);
    }

    /**
     * 게시판에 대한 사용정보를 삭제한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteBBSUseInfByBoardId(BusinessPjInf bdUseInf) throws Exception {
	update("EMAU00E01DAO.deleteBBSUseInfByBoardId", bdUseInf);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 목록을 조회한다.
     *
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BusinessPjInfVO> selectBBSUseInfsByTrget(BusinessPjInfVO bdUseVO) throws Exception {
	return (List<BusinessPjInfVO>) list("EMAU00E01DAO.selectBBSUseInfsByTrget", bdUseVO);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 전체 건수를 조회한다.
     *
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public int selectBBSUseInfsCntByTrget(BusinessPjInfVO bdUseVO) throws Exception {
	return (Integer)select("EMAU00E01DAO.selectBBSUseInfsCntByTrget", bdUseVO);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 수정한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void updateBBSUseInfByTrget(BusinessPjInf bdUseInf) throws Exception {
	update("EMAU00E01DAO.updateBBSUseInfByTrget", bdUseInf);
    }
    
    /**
	 * 사업관리 - 사업명(사업정보)
	 * @param param Map
	 * @return HashMap
	 *
	 * @exception Exception
	 */
    public HashMap<String, Object> projectDetail(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (HashMap<String, Object>) select("EMAU00E01.projectDetail", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}



	public List<BusinessPjInf> searchFirstOption(BusinessPjInf vo) {
		try {
			return (List<BusinessPjInf>) list("EMAU00E01.searchFirstOption", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}



	 List<BusinessPjInf> searchManagerList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		 try {
				return (List<BusinessPjInf>) list("EMAU00E01.searchManagerList", param);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
				return null;
			}
	}



	public List<BusinessPjInf> memberList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<BusinessPjInf>) list("EMAU00E01.memberList", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null ;
		}
	}




	/**
	 * 사업 관리 - 검색 2Dept 셀렉트박스 
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	public List<BusinessPjInf> searchSubOption(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<BusinessPjInf>) list("EMAU00E01.searchSubOption", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}



	public int authInsert(Map<String, Object> param) {
		// TODO Auto-generated method stub
				try {
					return (int) insert("EMAU00E01.authInsert", param);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}



	public int authUpdate(Map<String, Object> param) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00E01.authUpdate", param);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}



	public int authDelete(Map<String, Object> param) {
		// TODO Auto-generated method stub
				try {
					return delete("EMAU00E01.authDelete", param);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}



	public HashMap<String, Object> authDetail(Map<String, Object> param) {
		try {
			return (HashMap<String, Object>) select("EMAU00E01.authDetail", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}


	/**
	 * 사업관리 > 사업명 검색 ( 사업명 )
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	public List<BusinessPjInf> searchBusinessList(BusinessPjInf vo) throws Exception{
		// TODO Auto-generated method stub
		return (List<BusinessPjInf>) list("EMAU00E01.searchBusinessList", vo);
	}


	/**
	 * 사업관리 > 사업명 검색 ( 사업부서 )
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	public List<BusinessPjInf> searchDeptList(BusinessPjInf vo) throws Exception{
		// TODO Auto-generated method stub
		return (List<BusinessPjInf>) list("EMAU00E01.searchDeptList", vo);
	}


	/**
	 * 사업관리 > 사업권한 가져오기
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	public List<BusinessPjInf> searchAuthList(BusinessPjInf vo) {
		// TODO Auto-generated method stub
		return (List<BusinessPjInf>) list("EMAU00E01.searchAuthList", vo);
	}



	public BusinessPjInf getSysUpdate(BusinessPjInf vo) {
		// TODO Auto-generated method stub
		return (BusinessPjInf) list("EMAU00E01.getSysUpdate", vo);
	}


	/**
	 * 사업관리 > 최종 업데이트 날짜 가져오기
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	public HashMap<String, Object> getSysUpdate(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("EMAU00E01.getSysUpdate", param);
	}
	
	/**
	 * 사업관리 > 사업권한 저장하기
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	public int authBusinessUpdate(Map<String, Object> param) {
		// TODO Auto-generated method stub
				try {
					return (int) update("EMAU00E01.authBusinessUpdate", param);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
					return 0;
				}
	}



	public int searchBusinessListCnt(BusinessPjInf vo) throws Exception {
		// TODO Auto-generated method stub
		return (int) select("EMAU00E01.searchBusinessListCnt", vo);
	}



	public int searchDeptListCnt(BusinessPjInf vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00E01.searchDeptListCnt", vo);
	}

	
}


