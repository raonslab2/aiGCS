package egovframework.or.kr.EMA00H01.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.let.cop.com.service.BoardUseInf;
import egovframework.let.cop.com.service.BoardUseInfVO;
import egovframework.or.kr.EMA00H01.service.EMA00H01VO;
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00E.service.BusinessPjInfVO;
import egovframework.or.kr.EMAU00E.service.BusinessPjVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRVO;
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
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Repository("EMA00H01DAO")
public class EMA00H01DAO extends EgovAbstractDAO { 
	
	/**
	 * INNO > 주소록 최신
	 * @param param Map
	 * @return BusinessPjInfVO
	 *
	 * @exception Exception Exception
	 */ 
	public int EMA00H01Insert(EMA00H01VO vo) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("EMA00H01.EMA00H01Insert", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	public List<EMA00H01VO> selectEMA00H01(EMA00H01VO vo) {
		// TODO Auto-generated method stub
		return (List<EMA00H01VO>) list("EMA00H01.selectEMA00H01", vo);
	}
	 
	
	public int selectEMA00H01Cnt(EMA00H01VO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMA00H01.selectEMA00H01Cnt", vo);
	}

	public EMA00H01VO selectTmUserEMA00H01(EMA00H01VO vo) {
		// TODO Auto-generated method stub
		return (EMA00H01VO) select("EMA00H01.selectEMA00H01Detail", vo);
	}

	public List<EMA00H01VO> selectEMA00H01Detail(EMA00H01VO vo) {
		// TODO Auto-generated method stub
		return (List<EMA00H01VO>) select("EMA00H01.selectEMA00H01Detail", vo);
	}



	
}


