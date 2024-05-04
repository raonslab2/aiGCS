package egovframework.or.kr.EMAU00G.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.CommonVO;
import egovframework.or.kr.EMAU00C.service.impl.EMAU00C01DAO;
import egovframework.or.kr.EMAU00F.service.EMAU00F01Service;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00G.service.EMAU00G01Service;
import egovframework.or.kr.EMAU00G.service.EMAU00G01VO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
@Service("EMAU00G01Service")
public class EMAU00G01ServiceImpl extends EgovAbstractServiceImpl implements EMAU00G01Service {

	@Resource(name = "EMAU00G01DAO")
	private EMAU00G01DAO eMAU00G01DAO;

	@Resource(name = "EMAU00C01DAO")
	private EMAU00C01DAO eMAU00C01DAO;

	/**
	 * 일반 로그인을 처리한다
	 * 
	 * @param String LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */

	@Override
	public HashMap<String, Object> searchBusiness(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.searchBusiness(param);
	}

	@Override
	public String businessDepart(LoginVO user) {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.businessDepart(user);
	}

	@Override
	public List<EMAU00G01VO> searchRpaPjList1(Map<String, Object> param) throws Exception{
		// TODO Auto-generated method stub
		return eMAU00G01DAO.searchRpaPjList1(param);
	}

	@Override
	public List<EMAU00G01VO> dataRequest(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.dataRequest(paramMap);
	}

	@Override
	public List<EmpjVO> autocomplete(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.autocomplete(param);
	}

	@Override
	public List<EMAU00G01VO> searchRpaPjList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.searchRpaPjList(param);
	}

	@Override
	public int insertEMAU00G01(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.insertEMAU00G01(param);
	}

	@Override
	public List<EMAU00G01VO> eMAU00RPA10001(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.eMAU00RPA10001(param);
	}

	@Override
	public int eMAU00RPA10002(String seCode) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.eMAU00RPA10002(seCode);
	}

	@Override
	public int insert2EMAU00G01(HashMap<String, Object> resultMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.insert2EMAU00G01(resultMap);
	}

	@Override
	public HashMap<String, Object> selectEMAU00G01(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00G01DAO.selectEMAU00G01(param);
	}
}