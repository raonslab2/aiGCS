package egovframework.or.kr.EMAU00D.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00D.service.EmauHolidayVO;
import egovframework.or.kr.EMAU00D.service.EmauProcessVO;
import egovframework.or.kr.EMAU00F.service.EmauProjectVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

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
@Repository("eMAU00D01DAO")
public class EMAU00D01DAO extends EgovAbstractDAO {

	public List<EmmbgroupVO> loginUserProjectList(LoginVO user) throws Exception{
		// TODO Auto-generated method stub
		return (List<EmmbgroupVO>) list("EMAU00D01.loginUserProjectList", user);
	}

	/**
	 *  프로세스 - 프로세스 목록
	 * 
	 * @param epVO EmauProcessVO
	 * @return EmauProcessVO
	 * @exception Exception
	 */
	public List<EmauProcessVO> processList(EmauProcessVO epVO) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmauProcessVO>) list("EMAU00D01.processList", epVO) ;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public HashMap<String, Object> processDetail(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (HashMap<String, Object>) select("EMAU00D01.processDetail", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EmauProcessVO> processCheckList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<EmauProcessVO>) list("EMAU00D01.processCheckList", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int checkListDelete(int id) {
		// TODO Auto-generated method stub
		try {
			return delete("EMAU00D01.checkListDelete", id);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int checkListCreate(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("EMAU00D01.checkListCreate", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public HashMap<String, Object> createCheckListDetail(int lastInsertId) {
		// TODO Auto-generated method stub
		try {
			return (HashMap<String, Object>) select("EMAU00D01.createCheckListDetail", lastInsertId);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}




	public HashMap<String, Object> choiceholiday(Map<String, Object> param) {
		try {
			return (HashMap<String, Object>) select("EMAU00D01.choiceholiday", param);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	/**
	 * 일반 로그인을 처리한다
	 * 
	 * @param vo EmauHolidayVO
	 * @return EmauHolidayVO
	 * @exception Exception
	 */
	public List<EmauHolidayVO> holidayList(EmauHolidayVO vo) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<EmauHolidayVO>) list("EMAU00D01.holidayList", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int processUpdate(HashMap<String, Object> paramMap1) {
		// TODO Auto-generated method stub
		try {
			return update("EMAU00D01.processUpdate", paramMap1);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int checkListUseYNUpdate(HashMap<String, Object> paramMap2) {
		// TODO Auto-generated method stub
		try {
			return update("EMAU00D01.checkListUseYNUpdate", paramMap2);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int processCategorySave(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) insert("EMAU00D01.processCategorySave", paramMap);
	}

	public int processOrderByUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) update("EMAU00D01.processOrderByUpdate", paramMap);
	}

	public List<EmauProcessVO> fetchParentObject(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmauProcessVO>) list("EMAU00D01.fetchParentObject", paramMap);
	}

	public int processCategoryDelete(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) delete("EMAU00D01.processCategoryDelete", paramMap);
	}

	public List<EmauProcessVO> projectProcessMappingList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmauProcessVO>) list("EMAU00D01.projectProcessMappingList", paramMap);
	}

	public HashMap<String, Object> hasDataConfirm(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("EMAU00D01.hasDataConfirm", paramMap);
	}

	public int projectProcessCheckUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) update("EMAU00D01.projectProcessCheckUpdate", paramMap);
	}

	public int projectProcessCheckInsert(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) insert("EMAU00D01.projectProcessCheckInsert", paramMap);
	}

	public int projectProcessCheckDayUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) update("EMAU00D01.projectProcessCheckDayUpdate", paramMap);
	}

	public int projectProcessCheckDayInsert(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) insert("EMAU00D01.projectProcessCheckDayInsert", paramMap);
	}

	public HashMap<String, Object> todoAramHasData(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("EMAU00D01.todoAramHasData", paramMap);
	}

	public int todoAramUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) update("EMAU00D01.todoAramUpdate", paramMap);
	}

	public int todoAramInsert(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) insert("EMAU00D01.todoAramInsert", paramMap);
	}

	public List<EmauProjectVO> searchProjectList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmauProjectVO>) list("EMAU00D01.searchProjectList", paramMap);
	}

	public int mainProcessMoveUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) update("EMAU00D01.mainProcessMoveUpdate", paramMap);
	}

	public int subProcessMoveUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (int) update("EMAU00D01.subProcessMoveUpdate", paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int selectFetch(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) select("EMAU00D01.selectFetch", paramMap);
	}

	public HashMap<String, Object> processIsUse(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("EMAU00D01.processIsUse", paramMap);
	}

	public int projectProcessMappingDelete(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		try {
			return (int) delete("EMAU00D01.projectProcessMappingDelete", paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
		
	}



}
