package egovframework.or.kr.EMA00H01.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.EMA00H01.service.EMA00H01Service;
import egovframework.or.kr.EMA00H01.service.EMA00H01VO;
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
@Service("EMA00H01Service")
public class EMA00H01ServiceImpl extends EgovAbstractServiceImpl implements EMA00H01Service {
	
    @Resource(name = "EMA00H01DAO")
    private EMA00H01DAO eMA00H01DAO; 
    /**
     * 게시판 사용정보를 등록한다.
     * 
     * @see egovframework.let.cop.bbs.com.service.EgovBBSUseInfoManageService#insertBBSUseInf(egovframework.let.cop.bbs.com.service.BusinessPjInf)
     */
  	public int EMA00H01Insert(EMA00H01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMA00H01DAO.EMA00H01Insert(vo);
	}
  	
	@Override
	public List<EMA00H01VO> selectEMA00H01(EMA00H01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMA00H01DAO.selectEMA00H01(vo);
	}
	
	@Override
	public int selectEMA00H01Cnt(EMA00H01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMA00H01DAO.selectEMA00H01Cnt(vo);
	}
	
	@Override
	public EMA00H01VO selectTmUserEMA00H01(EMA00H01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMA00H01DAO.selectTmUserEMA00H01(vo);
	}
	@Override
	public List<EMA00H01VO> selectEMA00H01Detail(EMA00H01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMA00H01DAO.selectEMA00H01Detail(vo);
	}


 
     
	
 
	

}
