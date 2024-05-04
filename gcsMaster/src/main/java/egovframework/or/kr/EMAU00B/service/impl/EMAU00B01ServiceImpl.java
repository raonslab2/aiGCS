package egovframework.or.kr.EMAU00B.service.impl;

import egovframework.com.cmm.LoginVO; 
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.or.kr.EMAU00A.service.DashboardVO;
import egovframework.or.kr.EMAU00B.service.EMAU00B01Service;
import egovframework.or.kr.EMAU00B.service.EmpjPsVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
@Service("EMAU00B01Service")
public class EMAU00B01ServiceImpl extends EgovAbstractServiceImpl implements EMAU00B01Service {

	@Resource(name = "EMAU00B01DAO")
	private EMAU00B01DAO eMAU00B01DAO;

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	@Override
	public LoginVO test(LoginVO vo) throws Exception {

		// 1. 입력한 비밀번호를 암호화한다.
		String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getId());
		vo.setPassword(enpassword);

		// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
		LoginVO loginVO = eMAU00B01DAO.actionLogin(vo);

		// 3. 결과를 리턴한다.
		if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
			return loginVO;
		} else {
			loginVO = new LoginVO();
		}

		return loginVO;
	}

	@Override
	public List<EmpjVO> selectPjList(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.selectPjList(vo);
	}
	
	@Override
	public List<EmpjPsVO> selectPjPsList(EmpjPsVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.selectPjPsList(vo);
	}

	@Override
	public int selectPjPsListCnt(EmpjPsVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.selectPjPsListCnt(vo);
	}

	@Override
	public List<DashboardVO> selectMonthList(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.selectMonthList(vo);
	}

	@Override
	public int scheduleInsert(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.scheduleInsert(paramMap);
	}

	@Override
	public HashMap<String, Object> newScheduleDetail(HashMap<String, Object> paramMap)  throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.newScheduleDetail(paramMap);
	}

	@Override
	public int scheduleDelete(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.scheduleDelete(paramMap);
	}

	@Override
	public int scheduleUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.scheduleUpdate(paramMap);
	}

	@Override
	public List<DashboardVO> scheduleWeekList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.scheduleWeekList(paramMap);
	}
	
	/**
	 * 스케줄러 > 과제
	 * @return 
	 * @param vo    
	 * @exception Exception Exception
	 */  
	@Override
	public List<EmpjVO> selectProjectList(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.selectProjectList(vo);
	}

	@Override
	public int selectProjectListCnt(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.selectProjectListCnt(vo);
	}

	@Override
	public List<EmpjVO> excelDownloadList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.excelDownloadList(paramMap);
	}

	@Override
	public List<EmpjVO> selectProjectList2(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.selectProjectList2(vo);
	}
	
	@Override
	public int selectProjectListCnt2(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.selectProjectListCnt2(vo);
	}

	@Override
	public List<EmpjVO> finalProjectList(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.finalProjectList(vo);
	}

	@Override
	public int finalProjectListCnt(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.finalProjectListCnt(vo);
	}

	@Override
	public List<EmpjVO> seProjectList(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.seProjectList(vo);
	}

	@Override
	public int seProjectListCnt(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.seProjectListCnt(vo);
	}

	@Override
	public List<EmpjVO> applicationProjectList(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.applicationProjectList(vo);
	}

	@Override
	public int applicationProjectListCnt(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.applicationProjectListCnt(vo);
	}

	@Override
	public List<EmpjVO> specProjectList(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.specProjectList(vo);
	}

	@Override
	public int specProjectListCnt(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.specProjectListCnt(vo);
	}

	@Override
	public List<EmpjVO> reportProjectList(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.reportProjectList(vo);
	}

	@Override
	public int reportProjectListCnt(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.reportProjectListCnt(vo);
	}
 
 
	@Override
	public List<DashboardVO> selectPjMonthList(HashMap<String, Object> paramMap)  throws Exception {
		// TODO Auto-generated method stub
		return eMAU00B01DAO.selectPjMonthList(paramMap);
	}

}