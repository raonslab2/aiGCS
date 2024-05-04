package egovframework.or.kr.EMAU00B.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00A.service.DashboardVO;
import egovframework.or.kr.EMAU00B.service.EmpjPsVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
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
@Repository("EMAU00B01DAO")
public class EMAU00B01DAO extends EgovAbstractDAO {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		return (LoginVO) select("EMAU00B01.test", vo);
	}
	
	/**
	 * 프로젝트 리스트
	 * @param vo EmpjVO
	 * @return EmpjVO
	 * @exception Exception
	 */
	public List<EmpjVO> selectPjList(EmpjVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00B01.selectPjList", vo);
	}
	
	/**
	 * 프로젝트 프로세스 리스트
	 * @param vo EmpjVO
	 * @return EmpjVO
	 * @exception Exception
	 */
	public List<EmpjPsVO> selectPjPsList(EmpjPsVO vo) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmpjPsVO>) list("EMAU00B01.selectPjPsList", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
		
	}

	public int selectPjPsListCnt(EmpjPsVO vo) {
		// TODO Auto-generated method stub
		return (Integer) select("EMAU00B01.selectPjPsListCnt", vo);
	}

	public List<DashboardVO> selectMonthList(DashboardVO vo) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00B01.selectMonthList", vo);
	}

	public int scheduleInsert(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) insert("EMAU00B01.scheduleInsert", paramMap);
	}

	public HashMap<String, Object> newScheduleDetail(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("EMAU00B01.newScheduleDetail", paramMap);
	}

	public int scheduleDelete(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) insert("EMAU00B01.scheduleDelete", paramMap);
	}

	public int scheduleUpdate(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) update("EMAU00B01.scheduleUpdate", paramMap);
	}

	public List<DashboardVO> scheduleWeekList(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (List<DashboardVO>) list("EMAU00B01.scheduleWeekList", paramMap);
	}
	
	/**
	 * 스케줄러 > 과제
	 * @return 
	 * @param vo    
	 * @exception Exception Exception
	 */ 
	public List<EmpjVO> selectProjectList(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00B01.selectProjectList", vo);
	}

	public int selectProjectListCnt(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00B01.selectProjectListCnt", vo);
	}

	public List<EmpjVO> excelDownloadList(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00B01.excelDownloadList", paramMap);
	} 
	
	public List<EmpjVO> selectProjectList2(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00B01.selectProjectList2", vo);
	}
 
	
	public int selectProjectListCnt2(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00B01.selectProjectListCnt2", vo);
	}

	public List<EmpjVO> finalProjectList(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00B01.finalProjectList", vo);
	}

	public int finalProjectListCnt(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00B01.finalProjectListCnt", vo);
	}

	public List<EmpjVO> seProjectList(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00B01.seProjectList", vo);
	}

	public int seProjectListCnt(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00B01.seProjectListCnt", vo);
	}

	public List<EmpjVO> applicationProjectList(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00B01.applicationProjectList", vo);
	}

	public int applicationProjectListCnt(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00B01.applicationProjectListCnt", vo);
	}

	public List<EmpjVO> specProjectList(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00B01.specProjectList", vo);
	}

	public int specProjectListCnt(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00B01.specProjectListCnt", vo);
	}

	public List<EmpjVO> reportProjectList(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00B01.reportProjectList", vo);
	}

	public int reportProjectListCnt(EmpjVO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00B01.reportProjectListCnt", vo);
	}

	public List<DashboardVO> selectPjMonthList(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub 
		return (List<DashboardVO>) list("EMAU00B01.selectPjMonthList", paramMap);
	}
 

}
