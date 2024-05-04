package egovframework.or.kr.TD0001.service;

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
	
	// TodayWork100VO
	//Shows a list of data	
	public List<TodayWork100VO> TodayWork100List(TodayWork100VO vo)throws Exception;
	
	public int TodayWork100ListCnt(TodayWork100VO vo)throws Exception;	
	
	//"Write a post about what to  do today"
	public TodayWork100VO TodayWork100Write(TodayWork100VO vo)throws Exception;	
	
	//Data Research	
	public List<TodayWork100VO> TodayWork100Search(TodayWork100VO vo)throws Exception;	
	
	//View data in detail	
	public TodayWork100VO TodayWork100View(TodayWork100VO vo)throws Exception;

	public int insertTodayWork100(TodayWork100VO vo)throws Exception;

	public int updateTodayWork101(TodayWork100VO vo)throws Exception;

	public List<TodayWork100VO> selectTodayWork901List(TodayWork100VO vo)throws Exception;

	public int selectTodayWork901ListCnt(TodayWork100VO vo)throws Exception;

	public int insertTodayWork901Write(TodayWork100VO vo)throws Exception;

	public TodayWork100VO selectTodayWork901Pk(TodayWork100VO vo)throws Exception;

	public int insertTwFile(TodayWork100VO vo)throws Exception;

	public TodayWork100VO selectTodayWork901Write(TodayWork100VO vo)throws Exception;

	public int updateTodayWork901Write(TodayWork100VO vo)throws Exception;

	public List<TodayWork100VO> selectTodayWork900(TodayWork100VO vo)throws Exception;

	public int selectTodayWork900Cnt(TodayWork100VO vo)throws Exception;

	public TodayWork100VO selectTodayWork900View(TodayWork100VO vo)throws Exception;

	public List<TodayWork100VO> selectTodayWork901WriteAtach(TodayWork100VO vo)throws Exception;

	public int selectTodayWork901WriteAtachCnt(TodayWork100VO vo)throws Exception;

	public List<TodayWork100VO> selectTodayWork905(TodayWork100VO vo)throws Exception;

	public int selectTodayWork905Cnt(TodayWork100VO vo)throws Exception;

	public List<TodayWork100VO> selectCallChatList(TodayWork100VO vo)throws Exception;

	public int selectCallChatListCnt(TodayWork100VO vo)throws Exception;

	public void insertChatMsg(TodayWork100VO vo)throws Exception;

	public void deleteTwChatUnRead(TodayWork100VO vo)throws Exception;

	public int selectUnread(TodayWork100VO vo)throws Exception;
 

	 
}
