package egovframework.or.kr.EMAU000.service.impl;

import egovframework.com.cmm.LoginVO;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * 일반 로그인을 처리하는 비즈니스 구현 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Repository("eMAU00001DAO")
public class EMAU00001DAO extends EgovAbstractDAO {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		return (LoginVO) select("eMAU00001DAO.actionLogin", vo);
	}

	/**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO searchId(LoginVO vo) throws Exception {
		return (LoginVO) select("eMAU00001DAO.searchId", vo);
	}

	/**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO searchPassword(LoginVO vo) throws Exception {
		return (LoginVO) select("eMAU00001DAO.searchPassword", vo);
	}

	/**
	 * 변경된 비밀번호를 저장한다.
	 * @param vo LoginVO
	 * @exception Exception
	 */
	public void updatePassword(LoginVO vo) throws Exception {
		update("eMAU00001DAO.updatePassword", vo);
	}

	public LoginVO pwCheck(LoginVO loginVO) throws Exception {
		// TODO Auto-generated method stub
		return (LoginVO) select("eMAU00001DAO.pwCheck", loginVO);
	}

	public int changePassword(LoginVO vo) {
		// TODO Auto-generated method stub
		return (int) update("eMAU00001DAO.changePassword", vo);
	}

	public int smtechIdUpdate(LoginVO vo) {
		// TODO Auto-generated method stub
		return (int) update("eMAU00001DAO.smtechIdUpdate", vo);
	}

	public HashMap<String, Object> seeSmtechId(LoginVO vo) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("eMAU00001DAO.seeSmtechId", vo);
	}

	public void actionLoginSuccess(LoginVO vo) {
		// TODO Auto-generated method stub
		insert("eMAU00001DAO.actionLoginSuccess", vo);
	}

	public int mobileLoginCnt(LoginVO vo) {
		// TODO Auto-generated method stub
		return (int) select("eMAU00001DAO.mobileLoginCnt", vo);
	}

}
