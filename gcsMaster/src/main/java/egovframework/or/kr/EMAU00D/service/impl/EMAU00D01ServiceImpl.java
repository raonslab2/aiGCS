package egovframework.or.kr.EMAU00D.service.impl;

import egovframework.com.cmm.LoginVO; 
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.or.kr.EMAU00D.service.EMAU00D01Service;
import egovframework.or.kr.EMAU00D.service.EmauHolidayVO;
import egovframework.or.kr.EMAU00D.service.EmauProcessVO;
import egovframework.or.kr.EMAU00F.service.EmauProjectVO;
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
@Service("eMAU00D01Service")
public class EMAU00D01ServiceImpl extends EgovAbstractServiceImpl implements EMAU00D01Service {

	@Resource(name = "eMAU00D01DAO")
	private EMAU00D01DAO eMAU00D01DAO;
	
	@Override
	public List<EmmbgroupVO> loginUserProjectList(LoginVO user) throws Exception{
		// TODO Auto-generated method stub
		return eMAU00D01DAO.loginUserProjectList(user);
	}
	
	/**
	 * 프로세스 - 프로세스 목록
	 * @param epVO EmauProcessVO
	 * @return EmauProcessVO
	 * @exception Exception
	 */
	@Override
	public List<EmauProcessVO> processList(EmauProcessVO epVO) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.processList(epVO);
	}


	@Override
	public HashMap<String, Object> processDetail(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.processDetail(param);
	}


	@Override
	public List<EmauProcessVO> processCheckList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.processCheckList(param);
	}


	@Override
	public int checkListDelete(int id) {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.checkListDelete(id);
	}


	@Override
	public int checkListCreate(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.checkListCreate(param);
	}



	@Override
	public HashMap<String, Object> createCheckListDetail(int lastInsertId) {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.createCheckListDetail(lastInsertId);
	}




	@Override
	public HashMap<String, Object> choiceholiday(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.choiceholiday(param);
	}

	
	/**
	 * 프로세스 - 휴일 설정 목록
	 * 
	 * @param vo EmauHolidayVO
	 * @return EmauHolidayVO
	 * @exception Exception
	 */
	@Override
	public List<EmauHolidayVO> holidayList(EmauHolidayVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.holidayList(vo);
	}

	@Override
	public int processUpdate(HashMap<String, Object> paramMap1) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.processUpdate(paramMap1);
	}

	@Override
	public int checkListUseYNUpdate(HashMap<String, Object> paramMap2) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.checkListUseYNUpdate(paramMap2);
	}

	@Override
	public int processCategorySave(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.processCategorySave(paramMap);
	}

	@Override
	public int processOrderByUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.processOrderByUpdate(paramMap);
	}

	@Override
	public List<EmauProcessVO> fetchParentObject(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.fetchParentObject(paramMap);
	}

	@Override
	public int processCategoryDelete(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.processCategoryDelete(paramMap);
	}

	@Override
	public List<EmauProcessVO> projectProcessMappingList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.projectProcessMappingList(paramMap);
	}

	@Override
	public HashMap<String, Object> hasDataConfirm(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.hasDataConfirm(paramMap);
	}

	@Override
	public int projectProcessCheckUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.projectProcessCheckUpdate(paramMap);
	}

	@Override
	public int projectProcessCheckInsert(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.projectProcessCheckInsert(paramMap);
	}

	@Override
	public int projectProcessCheckDayUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.projectProcessCheckDayUpdate(paramMap);
	}

	@Override
	public int projectProcessCheckDayInsert(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.projectProcessCheckDayInsert(paramMap);
	}

	@Override
	public HashMap<String, Object> todoAramHasData(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.todoAramHasData(paramMap);
	}

	@Override
	public int todoAramUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.todoAramUpdate(paramMap);
	}

	@Override
	public int todoAramInsert(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.todoAramInsert(paramMap);
	}

	@Override
	public List<EmauProjectVO> searchProjectList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.searchProjectList(paramMap);
	}

	@Override
	public int mainProcessMoveUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.mainProcessMoveUpdate(paramMap);
	}

	@Override
	public int subProcessMoveUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.subProcessMoveUpdate(paramMap);
	}

	@Override
	public int selectFetch(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.selectFetch(paramMap);
	}

	@Override
	public HashMap<String, Object> processIsUse(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.processIsUse(paramMap);
	}

	@Override
	public int projectProcessMappingDelete(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00D01DAO.projectProcessMappingDelete(paramMap);
	}



}