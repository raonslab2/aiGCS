package egovframework.or.kr.EMAU00A.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00A.service.DashboardVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00H.EMAU00H1VO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
@Repository("EMAU00A01DAO")
public class EMAU00A01DAO extends EgovAbstractDAO {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		return (LoginVO) select("EMAU00A01.test", vo);
	}
	
	/**
	 * 대시보드 > 알림목록 
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectNotice(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectNotice", vo);
	}
	
	/**
	 * 대시보드 > 담당사업
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectTask(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectTask", vo);
	}
	
	/**
	 * 대시보드 > 소속부서
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectTask2(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectTask2", vo);
	}
	
	/**
	 * 대시보드 > 사업전체
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectTask3(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectTask3", vo);
	}
	
	
	/**
	 * 대시보드 > 진행중, 예정, 완료 , 전체
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> sumPj(DashboardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.sumPj", vo);
	} 
	
	/**
	 * 대시보드 > 접수마감 10일전
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectPjList(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectPjList", vo);
	}
	
	/**
	 * 대시보드 > 담당간사 지원요청
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public HashMap<String, Object> noticeUser(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("EMAU00A01.noticeUser", param);
	}
	
	/**
	 * 대시보드 > 분과구성 협의회
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectPjDetailList(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectPjDetailList", vo);
	}
	
	/**
	 * 대시보드 > Check List
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectCheckList(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectCheckList", vo);
	}
	
	/**
	 * 대시보드 > 전체보기 페이지 > Tasks
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectTotalTask(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectTotalTask", vo);
	}
	
	/**
	 * 대시보드 > 전체보기 페이지 > 진행중, 예정, 완료 , 전체
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public HashMap<String, Object> sumTotalPj(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("EMAU00A01.sumTotalPj", param);
	}
	
	/**
	 * 대시보드 > 전체보기 페이지 > 접수마감 10일전
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectTotalPjList(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectPjList", vo);
	}
	
	/**
	 * 대시보드 > 전체보기 페이지 > Check List
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	public List<DashboardVO> selectTotalCheckList(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectTotalCheckList", vo);
	}

	public List<DashboardVO> selectTaskDetail(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectTaskDetail", vo);
	}
	
	public List<DashboardVO> selectTaskProcess(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectTaskProcess", vo);
	}

	public int deleteNotice(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return delete("EMAU00A01.deleteNotice", param);
		} catch (Exception e) {
			// TODO: handle exception 
			return 0;
		}
	}

	public List<DashboardVO> selectPjRequest(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectPjRequest", vo);
	}
	
	public List<DashboardVO> selectPjRequest2(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.selectPjRequest2", vo);
	}

	public List<DashboardVO> sumPj2(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.sumPj2", vo);
	}

	public List<DashboardVO> sumPj3(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00A01.sumPj3", vo);
	}

	public int sumPjCnt(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (Integer) select("EMAU00A01.sumPjCnt", vo);
	}

	public List<EmpjVO> popupDetail(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00A01.popupDetail", vo);
	}

	public int popupDetailCnt(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (Integer) select("EMAU00A01.popupDetailCnt", vo);
	}

	public HashMap<String, Object> selectAcntList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (HashMap<String, Object>) select("EMAU00A01.selectAcntList", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		} 
	}

	public List<DashboardVO> eMAU00A0101DIINFO(Map<String, Object> param) {
		try {
			return (List<DashboardVO>) list("EMAU00A01.eMAU00A0101DIINFO", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}


 
	
}
