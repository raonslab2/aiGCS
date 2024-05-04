package egovframework.or.kr.EMAU00C.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.let.cop.smt.sim.service.IndvdlSchdulManageVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00G.service.EMAU00G01VO;

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
public interface EMAU00C01Service {
	public List<EMAU00C01VO> possibleStatus(Map<String, Object> param) throws Exception;



	/**
	 * 일반 로그인을 처리한다
	 * @return LoginVO
	 *
	 * @param vo    LoginVO
	 * @exception Exception Exception
	 */
	public LoginVO test(LoginVO vo) throws Exception;
	
	
	/**
	 * 분과구성 현황
	 * @return LoginVO
	 *
	 * @param vo    LoginVO
	 * @exception Exception Exception
	 */  
	public List<AvailableVO> selectAvailableList(AvailableVO availableVO) throws Exception;



	public List<EmPaDiVO> searchEmPjVuCode(String searchCode) throws Exception;


	public List<EmmbgroupVO> autocomplete(Map<String, Object> param) throws Exception;

	//public List<EmpjVO> autocomplete();


	//public List<CommonVO> searchUserPjList(String searchCode)throws Exception;
	
	/**
	 * 가용자원 > 검색서비스 ( 사업명 )
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	List<AvailableVO> searchBusinessList(AvailableVO vo) throws Exception;
	
	/**
	 * 가용자원 > 검색서비스 (추가기능)
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	List<AvailableVO> searchAddList(AvailableVO vo) throws Exception;
	
	/**
	 * 가용자원 > 분과구성 현황 등록 > 검색서비스 (추가기능)
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	List<AvailableVO> searchBusinessAllList(AvailableVO vo) throws Exception;
	
	/**
	 * 가용자원 > 분과구성 (사업명 불러오기)
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	HashMap<String, Object> selectBusinessList(Map<String, Object> param) throws Exception;
	
	/**
	 * 가용자원 > 분과구성 등록
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	int insertDivision(Map<String, Object> param) throws Exception;


	public List<EmpjVO> autocomplete2(Map<String, Object> param) throws Exception;

	public List<EmpjVO> autocomplete3(Map<String, Object> param) throws Exception;


	public List<EMAU00C01VO> selectAreaList2(EMAU00C01VO vo) throws Exception;


	public List<EMAU00C01VO> selectAreaCateList(EMAU00C01VO vo) throws Exception;


	public List<EMAU00C01VO> addEvaluation(Map<String, Object> param) throws Exception;


	public HashMap<String, Object> hasDataConfirm(Map<String, Object> param) throws Exception;


	public List<EmpjVO> autocomplete4(Map<String, Object> param);


	public List<EMAU00C01VO> insertUser(Map<String, Object> param) throws Exception;


	public List<EMAU00C01VO> selectPjUsertList(EMAU00C01VO vo) throws Exception;


	public List<EMAU00C01VO> selectAreaDetailList(Map<String, Object> param) throws Exception;


	public List<EMAU00C01VO> selectAreaList(Map<String, Object> param) throws Exception;


	public List<EMAU00C01VO> selectUserList(Map<String, Object> param) throws Exception;


	public List<EMAU00C01VO> selectWeekUserList(Map<String, Object> param) throws Exception;

	/**
	 * 가용자원 - 셀렉트박스 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	public List<AvailableVO> searchOption(AvailableVO vo) throws Exception ;


	public List<EMAU00C01VO> clickArea(Map<String, Object> param) throws Exception;




	public int insertArea(Map<String, Object> param) throws Exception;


	public List<EMAU00C01VO> searchGrmName(Map<String, Object> param) throws Exception;
	
	/**
	 * 가용자원 > 분과구성 현황 분과위원회  
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	List<AvailableVO> divisionList(Map<String, Object> param) throws Exception;
	
	/**
	 * 가용자원 > 분과구성 현황 평가장 검색 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	 List<AvailableVO> searchAreaList(AvailableVO vo) throws Exception;
	 
	 /**
	  * 가용자원 > 분과구성 현황 담당간사 검색 
	  * 
	  * @return  정보 Map [key : 항목명]
	  *
	  * @param paramMap AvailableVO
	  * @exception Exception Exception
	  */
	 List<AvailableVO> searchMemberList(HashMap<String, Object> paramMap) throws Exception;
	 
	 /**
		 * 가용자원 > 분과구성 현황 수정  
		 * 
		 * @return  int
		 *
		 * @param vo AvailableVO
		 * @exception Exception Exception
		 */
	int updateDivision(Map<String, Object> param) throws Exception;


	public List<EMAU00C01VO> businessInfo(Map<String, Object> param) throws Exception;


	public int workRequest(HashMap<String, Object> paramMap) throws Exception;



	public int confirmUpdate(int id) throws Exception;



	public List<EMAU00C01VO> grmInfo(EMAU00C01VO vo) throws Exception;



	public List<EMAU00C01VO> memberInfo(EMAU00C01VO vo) throws Exception;



	public int isDataArea(HashMap<String, Object> paramMap) throws Exception;



	public int updateArea(HashMap<String, Object> paramMap) throws Exception;



	public int deleteArea(int id) throws Exception;



	public List<EMAU00C01VO> areaList(EMAU00C01VO vo) throws Exception;



	public List<EMAU00C01VO> selectAreaDetail(HashMap<String, Object> paramMap) throws Exception;



	public HashMap<String, Object> paDataDetail(HashMap<String, Object> paramMap) throws Exception;



	public List<EmPaDiVO> searchEmPjDiCode() throws Exception;



	public HashMap<String, Object> isCommonResource(HashMap<String, Object> paramMap) throws Exception;



	public List<AvailableVO> placeAutocomplete(HashMap<String, Object> paramMap) throws Exception;



	public List<AvailableVO> searchPlaceList(HashMap<String, Object> paramMap) throws Exception;



	public HashMap<String, Object> placeIsUse(HashMap<String, Object> paramMap) throws Exception;



	public int placeSave(HashMap<String, Object> paramMap) throws Exception;



	public int memberSave(HashMap<String, Object> paramMap) throws Exception;


	
	public int coCateInsert(HashMap<String, Object> paramMap) throws Exception;



	public int placeDelete(HashMap<String, Object> paramMap) throws Exception;



	public List<AvailableVO> coCateDetail(HashMap<String, Object> paramMap) throws Exception;



	public int coCateDelete(HashMap<String, Object> paramMap) throws Exception;



	public List<EMAU00C01VO> isUsePlace(HashMap<String, Object> paramMap) throws Exception;



	public int selectCount(AvailableVO availableVO) throws Exception;



	public int selectSearch1Count(AvailableVO availableVO) throws Exception;



	public int selectSearch2Count(AvailableVO availableVO) throws Exception;



	public int selectPjUserCount(EMAU00C01VO vo) throws Exception;



	public List<AvailableVO> excelDownloadList(HashMap<String, Object> paramMap) throws Exception;

}