package egovframework.or.kr.TD0001.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.TD0001.service.TodayWork100VO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("TodayWork100DAO")
public class TodayWork100DAO extends EgovAbstractDAO {

	public List<TodayWork100VO> TodayWork100List(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		//return (List<TodayWork100VO>) list("GA03MAINAIR.selectAirList", vo);
		return (List<TodayWork100VO>) list("TD0001.TodayWork100List", vo);
	}

	public int TodayWork100ListCnt(TodayWork100VO vo) {
		// TODO Auto-generated method stub 
		return (int) select("TD0001.TodayWork100ListCnt", vo);
	}

	public int insertTodayWork100(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (int) insert("TD0001.insertTodayWork100", vo);
	}

	public List<TodayWork100VO> selectTodayWork901List(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (List<TodayWork100VO>) list("TD0001.selectTodayWork901List", vo);
	}

	public int selectTodayWork901ListCnt(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (int) select("TD0001.selectTodayWork901ListCnt", vo);
	}

	public int insertTodayWork901Write(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("TD0001.insertTodayWork901Write", vo);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		
	}

	public TodayWork100VO selectTodayWork901Pk(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (TodayWork100VO) select("TD0001.selectTodayWork901Pk", vo);
	}

	public int insertTwFile(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("TD0001.insertTwFile", vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}

	public TodayWork100VO selectTodayWork901Write(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (TodayWork100VO) select("TD0001.selectTodayWork901Write", vo);
	}

	public int updateTodayWork901Write(TodayWork100VO vo) {
		// TODO Auto-generated method stub 
		try {
			return update("TD0001.updateTodayWork901Write", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public List<TodayWork100VO> selectTodayWork900(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		//return (List<TodayWork100VO>) list("TD0001.selectTodayWork901List", vo);
		return (List<TodayWork100VO>) list("TD0001.selectTodayWork900", vo);
	}

	public int selectTodayWork900Cnt(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		//return (int) select("TD0001.selectTodayWork901ListCnt", vo);
		return (int) select("TD0001.selectTodayWork900Cnt", vo);
	}

	public TodayWork100VO selectTodayWork900View(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (TodayWork100VO) select("TD0001.selectTodayWork900View", vo);
	}

	public List<TodayWork100VO> selectTodayWork901WriteAtach(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (List<TodayWork100VO>) list("TD0001.selectTodayWork901WriteAtach", vo);
	}

	public int selectTodayWork901WriteAtachCnt(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (int) select("TD0001.selectTodayWork901WriteAtachCnt", vo);
	}

	public List<TodayWork100VO> selectTodayWork905(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (List<TodayWork100VO>) list("TD0001.selectTodayWork905", vo);
	}

	public int selectTodayWork905Cnt(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (int) select("TD0001.selectTodayWork905Cnt", vo);
	}

	public List<TodayWork100VO> selectCallChatList(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (List<TodayWork100VO>) list("TD0001.selectCallChatList", vo);
	}

	public int selectCallChatListCnt(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (int) select("TD0001.selectCallChatListCnt", vo);
	}

	public void insertChatMsg(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		insert("TD0001.insertChatMsg", vo);
	}

	public void deleteTwChatUnRead(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		insert("TD0001.deleteTwChatUnRead", vo);
	}

	public int selectUnread(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return (int) select("TD0001.selectUnread", vo);
	}
 
 
}
