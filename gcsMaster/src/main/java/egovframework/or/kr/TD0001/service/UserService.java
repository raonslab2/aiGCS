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
public interface UserService { 
	
 
	//Data Research	
	public List<UserVO> selectUserList(UserVO vo)throws Exception;

	public List<UserVO> selectTwCode(UserVO vo)throws Exception;

	public int updateTwStatus(UserVO vo)throws Exception;	
	
	 
}
