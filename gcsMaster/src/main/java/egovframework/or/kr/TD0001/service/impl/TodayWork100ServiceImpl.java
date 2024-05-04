package egovframework.or.kr.TD0001.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.TD0001.service.FileUploadVO;
import egovframework.or.kr.TD0001.service.TodayWork100Service;
import egovframework.or.kr.TD0001.service.TodayWork100VO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * gcs 화면
 * 
 * @author 공통서비스 개발팀 손창주
 * @since 2021.11.01
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.11.01  손창주          최초 생성 
 *
 *      </pre>
 */

@Service("TodayWork100Service")
public class TodayWork100ServiceImpl extends EgovAbstractServiceImpl implements TodayWork100Service{

	@Resource(name = "TodayWork100DAO")
	private TodayWork100DAO todayWork100DAO;

	@Override
	public List<TodayWork100VO> TodayWork100List(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.TodayWork100List(vo);
	}

	@Override
	public int TodayWork100ListCnt(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.TodayWork100ListCnt(vo);
	}

	@Override
	public TodayWork100VO TodayWork100Write(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TodayWork100VO> TodayWork100Search(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TodayWork100VO TodayWork100View(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertTodayWork100(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.insertTodayWork100(vo);
	}

	@Override
	public int updateTodayWork101(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TodayWork100VO> selectTodayWork901List(TodayWork100VO vo) {
		// TODO Auto-generated method stub 
		return todayWork100DAO.selectTodayWork901List(vo);
	}

	@Override
	public int selectTodayWork901ListCnt(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork901ListCnt(vo);
	}

	@Override
	public int insertTodayWork901Write(TodayWork100VO vo) {
		// TODO Auto-generated method stub
		return todayWork100DAO.insertTodayWork901Write(vo);
	}

	@Override
	public TodayWork100VO selectTodayWork901Pk(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork901Pk(vo);
	}

	@Override
	public int insertTwFile(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.insertTwFile(vo);
	}

	@Override
	public TodayWork100VO selectTodayWork901Write(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork901Write(vo);
	}

	@Override
	public int updateTodayWork901Write(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.updateTodayWork901Write(vo);
	}

	@Override
	public List<TodayWork100VO> selectTodayWork900(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork900(vo);
	}

	@Override
	public int selectTodayWork900Cnt(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork900Cnt(vo);
	}

	@Override
	public TodayWork100VO selectTodayWork900View(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork900View(vo);
	}

	@Override
	public List<TodayWork100VO> selectTodayWork901WriteAtach(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork901WriteAtach(vo);
	}

	@Override
	public int selectTodayWork901WriteAtachCnt(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork901WriteAtachCnt(vo);
	}

	@Override
	public List<TodayWork100VO> selectTodayWork905(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork905(vo);
	}

	@Override
	public int selectTodayWork905Cnt(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectTodayWork905Cnt(vo);
	}

	@Override
	public List<TodayWork100VO> selectCallChatList(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectCallChatList(vo);
	}

	@Override
	public int selectCallChatListCnt(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectCallChatListCnt(vo);
	}

	@Override
	public void insertChatMsg(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		todayWork100DAO.insertChatMsg(vo);
	}

	@Override
	public void deleteTwChatUnRead(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		todayWork100DAO.deleteTwChatUnRead(vo);
		
	}

	@Override
	public int selectUnread(TodayWork100VO vo) throws Exception {
		// TODO Auto-generated method stub
		return todayWork100DAO.selectUnread(vo);
	}
 
 
 
}
