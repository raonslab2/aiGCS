package egovframework.or.mobile.login.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
 
import egovframework.or.mobile.login.service.MobileLoginService;
import egovframework.or.mobile.login.service.MobileLoginVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 일반 로그인을 처리하는 비즈니스 구현 클래스
 * 
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *      </pre>
 */
@Service("MobileLoginService")
public class MobileLoginServiceImpl extends EgovAbstractServiceImpl implements MobileLoginService {

	@Resource(name = "MobileLoginDAO")
	private MobileLoginDAO mobileLoginDAO;

	@Override
	public List<MobileLoginVO> selectList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return mobileLoginDAO.selectList(param);
	}
 

	/**
	 * 일반 로그인을 처리한다
	 * 
	 * @param String LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */ 
	/*
	@Override
	public List<LoginVO> selectList(Map<String, Object> param) throws Exception{
		// TODO Auto-generated method stub
		return loginDAO.selectList(param);
	}
	*/

 
}