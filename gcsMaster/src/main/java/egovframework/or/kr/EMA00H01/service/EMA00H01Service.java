package egovframework.or.kr.EMA00H01.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRVO;

/**
 * 기체관리
 * @author 공통서비스 개발팀 손창주
 * @since 2021.11.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.11.01  손창주          최초 생성 
 *
 *  </pre>
 */
public interface EMA00H01Service { 
	
	public int EMA00H01Insert(EMA00H01VO vo) throws Exception;
	
    //최신주소록 정보
	public List<EMA00H01VO> selectEMA00H01(EMA00H01VO vo) throws Exception; 
	
    //최신주소록 정보 데이터
	public int selectEMA00H01Cnt(EMA00H01VO vo) throws Exception; 
	
	//상담자 정보
	public EMA00H01VO selectTmUserEMA00H01(EMA00H01VO vo) throws Exception;
	
	//비대면 상담내용
	public List<EMA00H01VO> selectEMA00H01Detail(EMA00H01VO vo) throws Exception;


	 
	 
} 