package egovframework.or.kr.GA03MAIN.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.GA03MAIN.service.GA03MAINUSERService;
import egovframework.or.kr.GA03MAIN.service.GA03MAINUSERVO;
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

@Service("GA03MAINUSERService")
public class GA03MAINUSERServiceImpl extends EgovAbstractServiceImpl implements GA03MAINUSERService{

	@Resource(name = "GA03MAINUSERDAO")
	private GA03MAINUSERDAO gA03MAINUSERDAO;

	@Override
	public List<GA03MAINUSERVO> selectUserList(GA03MAINUSERVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINUSERDAO.selectUserList(vo);
	}

	@Override
	public int selectUserListCnt(GA03MAINUSERVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINUSERDAO.selectUserListCnt(vo);
	}
 
 

}
