package egovframework.or.kr.GA03MAIN.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA03MAIN.service.GA03MAINUSERVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA03MAINUSERDAO")
public class GA03MAINUSERDAO extends EgovAbstractDAO {
 
	@SuppressWarnings("unchecked")
	public List<GA03MAINUSERVO> selectUserList(GA03MAINUSERVO vo) {
		// TODO Auto-generated method stub
		return (List<GA03MAINUSERVO>) list("GA03MAINUSER.selectUserList", vo);
	}

	public int selectUserListCnt(GA03MAINUSERVO vo) {
		// TODO Auto-generated method stub
		return (int) select("GA03MAINUSER.selectUserListCnt", vo);
	}
 
 
}
