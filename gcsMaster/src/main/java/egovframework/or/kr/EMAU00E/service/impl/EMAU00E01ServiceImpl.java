package egovframework.or.kr.EMAU00E.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00E.service.BusinessPjInfVO;
import egovframework.or.kr.EMAU00E.service.EMAU00E01Service;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 게시판 이용정보를 관리하기 위한 서비스 구현 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.04.02
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.02  이삼섭          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *
 * </pre>
 */
@Service("EMAU00E01Service")
public class EMAU00E01ServiceImpl extends EgovAbstractServiceImpl implements EMAU00E01Service {
	
    @Resource(name = "EMAU00E01DAO")
    private EMAU00E01DAO eMAU00E01DAO;

    /**
     * 게시판 사용 정보를 삭제한다.
     *  BusinessPjInf.java
     * @see egovframework.let.cop.bbs.com.service.EgovBBSUseInfoManageService#deleteBBSUseInf(egovframework.let.cop.bbs.com.service.BusinessPjInf)
     */
    public void deleteBBSUseInf(BusinessPjInf bdUseInf) throws Exception {
	eMAU00E01DAO.deleteBBSUseInf(bdUseInf);
    }

    /**
     * 게시판 사용정보를 등록한다.
     * 
     * @see egovframework.let.cop.bbs.com.service.EgovBBSUseInfoManageService#insertBBSUseInf(egovframework.let.cop.bbs.com.service.BusinessPjInf)
     */
    public void insertBBSUseInf(BusinessPjInf bdUseInf) throws Exception {
	eMAU00E01DAO.insertBBSUseInf(bdUseInf);
    }

    /**
     * 게시판 사용정보 목록을 조회한다.
     * 
     * @see egovframework.let.cop.bbs.com.service.EgovBBSUseInfoManageService#selectBBSUseInfs(egovframework.let.cop.bbs.com.service.BusinessPjInfVO)
     */
    public Map<String, Object> selectBBSUseInfs(BusinessPjInfVO bdUseVO) throws Exception {

	List<BusinessPjInfVO> result = eMAU00E01DAO.selectBBSUseInfs(bdUseVO);
	int cnt = eMAU00E01DAO.selectBBSUseInfsCnt(bdUseVO);
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 게시판 사용정보를 수정한다.
     * 
     * @see egovframework.let.cop.bbs.com.service.EgovBBSUseInfoManageService#updateBBSUseInf(egovframework.let.cop.bbs.com.service.BusinessPjInf)
     */
    public void updateBBSUseInf(BusinessPjInf bdUseInf) throws Exception {
	eMAU00E01DAO.updateBBSUseInf(bdUseInf);
    }

    /**
     * 게시판 사용정보에 대한 상세정보를 조회한다.
     * 
     * @see egovframework.let.cop.bbs.com.service.EgovBBSUseInfoManageService#selectBBSUseInf(egovframework.let.cop.bbs.com.service.BusinessPjInfVO)
     */
    public BusinessPjInfVO selectBBSUseInf(BusinessPjInfVO bdUseVO) throws Exception {
	return eMAU00E01DAO.selectBBSUseInf(bdUseVO);
    }

    /**
     * 동호회에 사용되는 게시판 사용정보를 삭제한다.
     * 
     * @see egovframework.let.cop.com.service.EgovBBSUseInfoManageService#deleteBBSUseInfByClub(egovframework.let.cop.com.service.BusinessPjInf)
     */
    public void deleteBBSUseInfByClub(BusinessPjInfVO bdUseVO) throws Exception {
	List<BusinessPjInf> result = eMAU00E01DAO.selectBBSUseInfByClub(bdUseVO);
	
	BusinessPjInf bdUseInf = null;
	Iterator<BusinessPjInf> iter = result.iterator();
	while (iter.hasNext()) {
	    bdUseInf = (BusinessPjInf)iter.next();
	    
	    bdUseInf.setLastUpdusrId(bdUseVO.getLastUpdusrId());
	    //bdUseInf.setTrgetId(bdUseVO.getClbId());	// 사용자 ID를 넘겨야 함..
	    bdUseInf.setTrgetId(bdUseVO.getTrgetId());
	    
	    eMAU00E01DAO.deleteBBSUseInf(bdUseInf);
	}
    }

    /**
     * 커뮤니티에 사용되는 게시판 사용정보를 삭제한다.
     * 
     * @see egovframework.let.cop.com.service.EgovBBSUseInfoManageService#deleteBBSUseInfByCmmnty(egovframework.let.cop.com.service.BusinessPjInf)
     */
    public void deleteBBSUseInfByCmmnty(BusinessPjInfVO bdUseVO) throws Exception {
	List<BusinessPjInf> result = eMAU00E01DAO.selectBBSUseInfByCmmnty(bdUseVO);
	
	BusinessPjInf bdUseInf = null;
	Iterator<BusinessPjInf> iter = result.iterator();
	
	while (iter.hasNext()) {
	    bdUseInf = (BusinessPjInf)iter.next();
	    
	    bdUseInf.setLastUpdusrId(bdUseVO.getLastUpdusrId());
	    //bdUseInf.setTrgetId(bdUseVO.getCmmntyId());	// 사용자 ID를 넘겨야 함..
	    bdUseInf.setTrgetId(bdUseVO.getTrgetId());
	    
	    eMAU00E01DAO.deleteBBSUseInf(bdUseInf);
	}
    }

    /**
     * 동호회에 사용되는 모든 게시판 사용정보를 삭제한다.
     * 
     * @see egovframework.let.cop.com.service.EgovBBSUseInfoManageService#deleteAllBBSUseInfByClub(egovframework.let.cop.com.service.BusinessPjInfVO)
     */
    public void deleteAllBBSUseInfByClub(BusinessPjInfVO bdUseVO) throws Exception {
	eMAU00E01DAO.deleteAllBBSUseInfByClub(bdUseVO);
    }

    /**
     * 커뮤니티에 사용되는 모든 게시판 사용정보를 삭제한다.
     * 
     * @see egovframework.let.cop.com.service.EgovBBSUseInfoManageService#deleteAllBBSUseInfByCmmnty(egovframework.let.cop.com.service.BusinessPjInfVO)
     */
    public void deleteAllBBSUseInfByCmmnty(BusinessPjInfVO bdUseVO) throws Exception {
	eMAU00E01DAO.deleteAllBBSUseInfByCmmnty(bdUseVO);
    }

    /**
     * 게시판에 대한 사용정보를 삭제한다.
     * 
     * @see egovframework.let.cop.com.service.EgovBBSUseInfoManageService#deleteBBSUseInfByBoardId(egovframework.let.cop.com.service.BusinessPjInf)
     */
    public void deleteBBSUseInfByBoardId(BusinessPjInf bdUseInf) throws Exception {
	eMAU00E01DAO.deleteBBSUseInfByBoardId(bdUseInf);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 목록을 조회한다.
     * 
     * @see egovframework.let.cop.com.service.EgovBBSUseInfoManageService#selectBBSUseInfsByTrget(egovframework.let.cop.com.service.BusinessPjInfVO)
     */
    public Map<String, Object> selectBBSUseInfsByTrget(BusinessPjInfVO bdUseVO) throws Exception {
	List<BusinessPjInfVO> result = eMAU00E01DAO.selectBBSUseInfsByTrget(bdUseVO);
	int cnt = eMAU00E01DAO.selectBBSUseInfsCntByTrget(bdUseVO);
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 수정한다.
     */
    public void updateBBSUseInfByTrget(BusinessPjInf bdUseInf) throws Exception {
	eMAU00E01DAO.updateBBSUseInfByTrget(bdUseInf);
    }

	@Override
	public HashMap<String, Object> projectDetail(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.projectDetail(param);
	}
	
	/**
	 * 사업 관리 - 검색 1Dept 셀렉트박스 
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<BusinessPjInf> searchFirstOption(BusinessPjInf vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.searchFirstOption(vo);
	}
	
	/**
	 * 권한 관리 - 검색 2Dept 셀렉트박스 
	 * @param param Map
	 * @return EmmbgroupVO List
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<BusinessPjInf> searchSubOption(Map<String, Object> param) throws Exception  {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.searchSubOption(param);
	}

	@Override
	public List<BusinessPjInf> searchManagerList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.searchManagerList(param);
	}

	@Override
	public List<BusinessPjInf> memberList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.memberList(param);
	}

	@Override
	public List<BusinessPjInf> searchProject(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int authInsert(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.authInsert(param);
	}

	@Override
	public int authUpdate(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.authUpdate(param);
	}

	@Override
	public int authDelete(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.authDelete(param);
	}

	@Override
	public HashMap<String, Object> authDetail(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.authDetail(param);
	}
	
	/**
	 * 사업관리 > 사업명 검색 LIST ( 사업명 )
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<BusinessPjInf> searchBusinessList(BusinessPjInf vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.searchBusinessList(vo);
	}

	
	/**
	 * 사업관리 > 사업명 검색 LIST ( 사업부서 )
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<BusinessPjInf> searchDeptList(BusinessPjInf vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.searchDeptList(vo);
	}

	
	/**
	 * 사업관리 > 사업권한 가져오기
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<BusinessPjInf> searchAuthList(BusinessPjInf vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.searchAuthList(vo);
	}

	/**
	 * 사업관리 > 최종 업데이트 날짜 가져오기
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public HashMap<String, Object> getSysUpdate(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.getSysUpdate(param);
	}

	
	/**
	 * 사업관리 > 사업권한 저장하기
	 * @param param Map
	 * @return 
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int authBusinessUpdate(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.authBusinessUpdate(param);
	}

	@Override
	public int searchBusinessListCnt(BusinessPjInf vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.searchBusinessListCnt(vo);
	}

	@Override
	public int searchDeptListCnt(BusinessPjInf vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00E01DAO.searchDeptListCnt(vo);
	}
	

}
