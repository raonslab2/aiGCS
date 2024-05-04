package egovframework.or.kr.EMAU00A.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;

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
public interface EMAU00A01Service {

	/**
	 * 일반 로그인을 처리한다
	 * @return LoginVO
	 *
	 * @param vo    LoginVO
	 * @exception Exception Exception
	 */
	public LoginVO test(LoginVO vo) throws Exception;
	
	 
	
	/**
	 * 대시보드 > 프로세스 , 담당사업
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectTask(DashboardVO vo) throws Exception;
	
	/**
	 * 대시보드 > 프로세스 , 소속부서
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectTask2(DashboardVO vo) throws Exception;
	
	/**
	 * 대시보드 > 프로세스 , 사업전체
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectTask3(DashboardVO vo) throws Exception;
	
	
	/**
	 * 대시보드 > 담당자
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> sumPj(DashboardVO vo) throws Exception; 
	
	/**
	 * 대시보드 > 부서
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> sumPj2(DashboardVO vo) throws Exception; 
	
	/**
	 * 대시보드 > 전체
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> sumPj3(DashboardVO vo) throws Exception; 
	
	/**
	 * 대시보드 > 접수마감 10일전
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectPjList(DashboardVO vo) throws Exception;
	
	/**
	 * 대시보드 > 담당간사 지원요청
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	HashMap<String, Object> noticeUser(Map<String, Object> param) throws Exception;
	
	/**
	 * 대시보드 > 분과구성 협의회
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectPjDetailList(DashboardVO vo) throws Exception;
	
	/**
	 * 대시보드 > Check List
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectCheckList(DashboardVO vo) throws Exception;
	
	/**
	 * 대시보드 > 전체보기 페이지 > Tasks
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectTotalTask(DashboardVO vo) throws Exception;
	
	/**
	 * 대시보드 > 전체보기 페이지 > 진행중, 예정, 완료 , 전체
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	HashMap<String, Object> sumTotalPj(Map<String, Object> param) throws Exception;
	
	/**
	 * 대시보드 > 전체보기 페이지 > 접수마감 10일전
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectTotalPjList(DashboardVO vo) throws Exception;
	
	/**
	 * 대시보드 > 전체보기 페이지 > Check List
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectTotalCheckList(DashboardVO vo) throws Exception;

	/**
	 * 대시보드 > 전체보기 페이지 > Tasks , 진행중인 프로세스
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectTaskDetail(DashboardVO vo) throws Exception;
	
	/**
	 * 대시보드 > 전체보기 페이지 > Tasks , 진행중인 프로세스
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectNotice(DashboardVO vo) throws Exception;
	
	int deleteNotice(Map<String, Object> param) throws Exception;
	
	/**
	 * 대시보드 > 전체보기 페이지 > Tasks , 전체 프로세스
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectTaskProcess(DashboardVO vo) throws Exception;


	/**
	 * 대시보드 > 담당간사 지원요청 목록
	 * @param param Map
	 * @return DashboardVO
	 *
	 * @exception Exception Exception
	 */
	List<DashboardVO> selectPjRequest(DashboardVO vo) throws Exception;



	List<DashboardVO> selectPjRequest2(DashboardVO vo) throws Exception;



	int sumPjCnt(DashboardVO vo) throws Exception;



	public List<EmpjVO> popupDetail(EmpjVO vo) throws Exception;



	public int popupDetailCnt(EmpjVO vo) throws Exception;
 

	public HashMap<String, Object> selectAcntList(HashMap<String, Object> vo);



	List<DashboardVO> eMAU00A0101DIINFO(Map<String, Object> param) throws Exception;
 

	 
 
}