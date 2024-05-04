package egovframework.or.kr.EMAU00B.service;

import java.util.HashMap;
import java.util.List;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00A.service.DashboardVO;
import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;

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
public interface EMAU00B01Service {

	/**
	 * 일반 로그인을 처리한다
	 * @return LoginVO
	 *
	 * @param vo    LoginVO
	 * @exception Exception Exception
	 */
	public LoginVO test(LoginVO vo) throws Exception;

	public List<EmpjVO> selectPjList(EmpjVO vo)throws Exception;
	
	public List<EmpjPsVO> selectPjPsList(EmpjPsVO vo)throws Exception;
	
	public int selectPjPsListCnt(EmpjPsVO vo)throws Exception;

	public List<DashboardVO> selectMonthList(DashboardVO vo)throws Exception;

	public int scheduleInsert(HashMap<String, Object> paramMap) throws Exception;

	public HashMap<String, Object> newScheduleDetail(HashMap<String, Object> paramMap) throws Exception;

	public int scheduleDelete(HashMap<String, Object> paramMap) throws Exception;

	public int scheduleUpdate(HashMap<String, Object> paramMap) throws Exception;

	public List<DashboardVO> scheduleWeekList(HashMap<String, Object> paramMap) throws Exception;
	/**
	 * 스케줄러 > 과제
	 * @return 
	 * @param vo    
	 * @exception Exception Exception
	 */  
	public List<EmpjVO> selectProjectList(EmpjVO vo) throws Exception;

	public int selectProjectListCnt(EmpjVO vo) throws Exception;

	public List<EmpjVO> excelDownloadList(HashMap<String, Object> paramMap)throws Exception;

	public List<EmpjVO> selectProjectList2(EmpjVO vo) throws Exception;
	
	public int selectProjectListCnt2(EmpjVO vo) throws Exception;

	public List<EmpjVO> finalProjectList(EmpjVO vo) throws Exception;

	public int finalProjectListCnt(EmpjVO vo) throws Exception;

	public List<EmpjVO> seProjectList(EmpjVO vo) throws Exception;

	public int seProjectListCnt(EmpjVO vo) throws Exception;

	public List<EmpjVO> applicationProjectList(EmpjVO vo) throws Exception;

	public int applicationProjectListCnt(EmpjVO vo) throws Exception;

	public List<EmpjVO> specProjectList(EmpjVO vo) throws Exception;

	public int specProjectListCnt(EmpjVO vo) throws Exception;

	public List<EmpjVO> reportProjectList(EmpjVO vo) throws Exception;

	public int reportProjectListCnt(EmpjVO vo) throws Exception;
 
	public List<DashboardVO> selectPjMonthList(HashMap<String, Object> paramMap) throws Exception;


}