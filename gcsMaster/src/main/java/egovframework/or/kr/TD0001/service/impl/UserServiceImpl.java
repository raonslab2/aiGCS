package egovframework.or.kr.TD0001.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.TD0001.service.FileUploadVO;
import egovframework.or.kr.TD0001.service.TodayWork100Service;
import egovframework.or.kr.TD0001.service.TodayWork100VO;
import egovframework.or.kr.TD0001.service.UserService;
import egovframework.or.kr.TD0001.service.UserVO;
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

@Service("UserService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService{

	@Resource(name = "UserDAO")
	private UserDAO UserDAO;

	@Override
	public List<UserVO> selectUserList(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return UserDAO.selectUserList(vo);
	}

	@Override
	public List<UserVO> selectTwCode(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return UserDAO.selectTwCode(vo);
	}

	@Override
	public int updateTwStatus(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return UserDAO.updateTwStatus(vo);
	}
 
 
}
