package egovframework.or.kr.GA03MAIN.service;

import java.util.List;

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
public interface TodayWork100Service { 
	
	//public List<GA03MAINAIRVO> selectAirList(GA03MAINAIRVO vo) throws Exception;
	
	//TodayWork100VO
	
	public List<TodayWork100VO> TodayWork100List (TodayWork100VO vo);	//Shows a list of data
	public TodayWork100VO TodayWork100Write (TodayWork100VO vo);	//Write a post about what to do today
	public List<TodayWork100VO> TodayWork100Search (TodayWork100VO vo);	//Data Research
	public TodayWork100VO TodayWork100View (TodayWork100VO vo);	//view Data in detail

	
}
