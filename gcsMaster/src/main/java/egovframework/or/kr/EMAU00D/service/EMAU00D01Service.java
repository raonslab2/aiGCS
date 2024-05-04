package egovframework.or.kr.EMAU00D.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00F.service.EmauProjectVO;
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
public interface EMAU00D01Service {

	
	public List<EmmbgroupVO> loginUserProjectList(LoginVO user) throws Exception;
	
	/**
	 * 프로세스 - 프로세스 목록
	 * @return EmauProcessVO
	 *
	 * @param epVO    EmauProcessVO
	 * @exception Exception Exception
	 */
	public List<EmauProcessVO> processList(EmauProcessVO epVO) throws Exception;
	
	public HashMap<String, Object> processDetail(Map<String, Object> param);

	public List<EmauProcessVO> processCheckList(Map<String, Object> param);

	public int checkListDelete(int id);

	public int checkListCreate(Map<String, Object> param);

	public HashMap<String, Object> createCheckListDetail(int lastInsertId);
	
	
	
	
	
	public HashMap<String, Object> choiceholiday(Map<String, Object> param) throws Exception;
	
	/**
	 * 프로세스 - 휴일 설정 목록
	 * @return EmauHolidayVO
	 *
	 * @param vo    EmauHolidayVO
	 * @exception Exception Exception
	 */
	public List<EmauHolidayVO> holidayList(EmauHolidayVO vo) throws Exception;

	public int processUpdate(HashMap<String, Object> paramMap1) throws Exception;

	public int checkListUseYNUpdate(HashMap<String, Object> paramMap2) throws Exception;

	public int processCategorySave(HashMap<String, Object> paramMap) throws Exception;

	public int processOrderByUpdate(HashMap<String, Object> paramMap) throws Exception;

	public List<EmauProcessVO> fetchParentObject(HashMap<String, Object> paramMap) throws Exception;

	public int processCategoryDelete(HashMap<String, Object> paramMap) throws Exception;

	public List<EmauProcessVO> projectProcessMappingList(HashMap<String, Object> paramMap) throws Exception;
	
	public HashMap<String, Object> hasDataConfirm(HashMap<String, Object> paramMap) throws Exception;

	public int projectProcessCheckUpdate(HashMap<String, Object> paramMap) throws Exception;

	public int projectProcessCheckInsert(HashMap<String, Object> paramMap) throws Exception;

	public int projectProcessCheckDayUpdate(HashMap<String, Object> paramMap) throws Exception;

	public int projectProcessCheckDayInsert(HashMap<String, Object> paramMap) throws Exception;

	public HashMap<String, Object> todoAramHasData(HashMap<String, Object> paramMap) throws Exception;

	public int todoAramUpdate(HashMap<String, Object> paramMap) throws Exception;

	public int todoAramInsert(HashMap<String, Object> paramMap) throws Exception;

	public List<EmauProjectVO> searchProjectList(HashMap<String, Object> paramMap) throws Exception;

	public int mainProcessMoveUpdate(HashMap<String, Object> paramMap) throws Exception;

	public int subProcessMoveUpdate(HashMap<String, Object> paramMap) throws Exception;

	public int selectFetch(HashMap<String, Object> paramMap) throws Exception;

	public HashMap<String, Object> processIsUse(HashMap<String, Object> paramMap) throws Exception;

	public int projectProcessMappingDelete(HashMap<String, Object> paramMap) throws Exception;





}