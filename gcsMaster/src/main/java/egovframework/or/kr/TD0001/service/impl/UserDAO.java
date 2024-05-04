package egovframework.or.kr.TD0001.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.TD0001.service.UserVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("UserDAO")
public class UserDAO extends EgovAbstractDAO {

	public List<UserVO> selectUserList(UserVO vo) {
		// TODO Auto-generated method stub
		return (List<UserVO>) list("USER.selectUserList", vo);
	}

	public List<UserVO> selectTwCode(UserVO vo) {
		// TODO Auto-generated method stub
		return (List<UserVO>) list("USER.selectTwCode", vo);
	}

	public int updateTwStatus(UserVO vo) {
		// TODO Auto-generated method stub
		return (int) update("USER.updateTwStatus", vo);
	}
 
 
}
