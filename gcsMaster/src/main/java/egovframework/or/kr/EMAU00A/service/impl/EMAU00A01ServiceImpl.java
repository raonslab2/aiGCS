package egovframework.or.kr.EMAU00A.service.impl;

import egovframework.com.cmm.LoginVO; 
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.or.kr.EMAU00A.service.DashboardVO;
import egovframework.or.kr.EMAU00A.service.EMAU00A01Service;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
@Service("EMAU00A01Service")
public class EMAU00A01ServiceImpl extends EgovAbstractServiceImpl implements EMAU00A01Service {

	@Resource(name = "EMAU00A01DAO")
	private EMAU00A01DAO eMAU00A01DAO;

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
		LoginVO loginVO = eMAU00A01DAO.actionLogin(vo);

		// 3. 결과를 리턴한다.
		if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
			return loginVO;
		} else {
			loginVO = new LoginVO();
		}

		return loginVO;
	}
	
	/**
	 * 대시보드 > 알림목록 
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectNotice(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectNotice(vo);
	}
	
	/**
	 * 대시보드 > 프로세스 , 담당사업
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectTask(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectTask(vo);
	}
	
	/**
	 * 대시보드 > 프로세스 , 소속부서
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectTask2(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectTask2(vo);
	}
	
	/**
	 * 대시보드 > 프로세스 , 사업전체
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectTask3(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectTask3(vo);
	}

	
	/**
	 * 대시보드 > 진행중, 예정, 완료 , 전체
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override 
	public List<DashboardVO> sumPj(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.sumPj(vo);
	}
	 
	
	/**
	 * 대시보드 > 접수마감 10일전
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectPjList(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectPjList(vo);
	}
	
	/**
	 * 대시보드 > 담당간사 지원요청
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public HashMap<String, Object> noticeUser(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.noticeUser(param);
	}
	
	/**
	 * 대시보드 > 분과구성 협의회
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectPjDetailList(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectPjDetailList(vo);
	}
	
	/**
	 * 대시보드 > Check List
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectCheckList(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectCheckList(vo);
	}
	
	/**
	 * 대시보드 > 전체보기 페이지 > Tasks
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectTotalTask(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectTotalTask(vo);
	}
	
	/**
	 * 대시보드 > 전체보기 페이지 > 진행중, 예정, 완료 , 전체
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public HashMap<String, Object> sumTotalPj(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.sumTotalPj(param);
	}
	
	/**
	 * 대시보드 > 전체보기 페이지 > 접수마감 10일전
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectTotalPjList(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectTotalPjList(vo);
	}
	
	/**
	 * 대시보드 > 전체보기 페이지 > Check List
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<DashboardVO> selectTotalCheckList(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectTotalCheckList(vo);
	}

	@Override
	public List<DashboardVO> selectTaskDetail(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectTaskDetail(vo);
	}

	@Override
	public List<DashboardVO> selectTaskProcess(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectTaskProcess(vo);
	}

	@Override
	public int deleteNotice(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.deleteNotice(param);
	}

	@Override
	public List<DashboardVO> selectPjRequest(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectPjRequest(vo);
	}
	
	@Override
	public List<DashboardVO> selectPjRequest2(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectPjRequest2(vo);
	}

	@Override
	public List<DashboardVO> sumPj2(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.sumPj2(vo);
	}

	@Override
	public List<DashboardVO> sumPj3(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.sumPj3(vo);
	}

	@Override
	public int sumPjCnt(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.sumPjCnt(vo);
	}

	@Override
	public List<EmpjVO> popupDetail(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.popupDetail(vo);
	}

	@Override
	public int popupDetailCnt(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.popupDetailCnt(vo);
	}

	@Override
	public HashMap<String, Object> selectAcntList(HashMap<String, Object> vo) {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.selectAcntList(vo);
	}

	@Override
	public List<DashboardVO> eMAU00A0101DIINFO(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00A01DAO.eMAU00A0101DIINFO(param);
	}

	
}