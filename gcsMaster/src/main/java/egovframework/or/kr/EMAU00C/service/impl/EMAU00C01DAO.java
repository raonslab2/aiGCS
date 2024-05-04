package egovframework.or.kr.EMAU00C.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00C.service.CommonVO;
import egovframework.or.kr.EMAU00C.service.EMAU00C01VO;
import egovframework.or.kr.EMAU00C.service.EmPaDiVO;
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00G.service.EMAU00G01VO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

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
@Repository("EMAU00C01DAO")
public class EMAU00C01DAO extends EgovAbstractDAO {
	


	public List<EMAU00C01VO> possibleStatus(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.possibleStatus", param);
	}


	/**
	 * 일반 로그인을 처리한다
	 * 
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		return (LoginVO) select("EMAU00C01.test", vo);
	}

	/**
	 * 주어진 조건에 따른 공통코드를 불러온다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<AvailableVO> selectAvailableList(AvailableVO vo) throws Exception {
		return (List<AvailableVO>) list("EMAU00C01.selectAvailableList", vo);
	}

	public List<EmPaDiVO> searchEmPjVuCode(String searchCode) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmPaDiVO>) list("EMAU00C01.searchEmPjVuCode", searchCode);
	}

	public List<EmmbgroupVO> autocomplete(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmmbgroupVO>) list("EMAU00C01.autocomplete", param);
	}

	/**
	 * 가용자원 > 검색서비스 ( 사업명 )
	 * 
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	public List<AvailableVO> searchBusinessList(AvailableVO vo) throws Exception {
		try {
			return (List<AvailableVO>) list("EMAU00C01.searchBusinessList", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
		
	}

	/**
	 * 가용자원 > 검색서비스 ( 추가 기능 )
	 * 
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	public List<AvailableVO> searchAddList(AvailableVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<AvailableVO>) list("EMAU00C01.searchAddList", vo);
	}
	
	/**
	 * 가용자원 > 검색서비스 ( 추가 기능 )
	 * 
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	public List<AvailableVO> searchBusinessAllList(AvailableVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<AvailableVO>) list("EMAU00C01.searchBusinessAllList", vo);
	}

	/**
	 * 가용자원 > 사업명 불러오기
	 * 
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	public HashMap<String, Object> selectBusinessList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("EMAU00C01.selectBusinessList", param);
	}

	/**
	 * 가용자원 > 분과구성 등록
	 * 
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	public int insertDivision(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (int) insert("EMAU00C01.insertDivision", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}


	public List<EmpjVO> autocomplete2(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00C01.autocomplete2", param);
	}

	public List<EmpjVO> autocomplete3(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00C01.autocomplete3", param);
	}

	public List<EMAU00C01VO> selectAreaList2(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.selectAreaList2", vo);
	}

	public List<EMAU00C01VO> selectAreaCateList(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.selectAreaCateList", vo);
	}

	public List<EMAU00C01VO> addEvaluation(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) insert("EMAU00C01.addEvaluation", param);
	}


	public HashMap<String, Object> hasDataConfirm(Map<String, Object> param) {
		try {
			return (HashMap<String, Object>) select("EMAU00C01.hasDataConfirm", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EmpjVO> autocomplete4(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00C01.autocomplete4", param);
	}

	public List<EMAU00C01VO> insertUser(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.insertUser", param);
	}

	public List<EMAU00C01VO> selectPjUsertList(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.selectPjUsertList", vo);
	}

	public List<EMAU00C01VO> selectAreaDetailList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.selectAreaDetailList", param);
	}

	public List<EMAU00C01VO> selectAreaList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.selectAreaList", param);
	}

	public List<EMAU00C01VO> selectUserList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.selectUserList", param);
	}

	public List<EMAU00C01VO> selectWeekUserList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.selectWeekUserList", param);
	}
	
	/**
	 * 가용자원 - 셀렉트박스 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	public List<AvailableVO> searchOption(AvailableVO vo) throws Exception {
		// TODO Auto-generated method stub
	  return (List<AvailableVO>) list("EMAU00C01.searchOption", vo);
	}

	public List<EMAU00C01VO> clickArea(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.clickArea", param);
	}

	public int insertArea(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (int) insert("EMAU00C01.insertArea", param);
	}

	public List<EMAU00C01VO> searchGrmName(Map<String, Object> param) throws Exception {
		try {
			return (List<EMAU00C01VO>) list("EMAU00C01.searchGrmName", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	/**
	 * 가용자원 > 분과구성 현황 분과위원회  
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	public List<AvailableVO> divisionList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		try {
			return (List<AvailableVO>) list("EMAU00C01.divisionList", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null ;
		}
	}
	
	/**
	 * 가용자원 > 분과구성 현황 평가장 검색 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	public List<AvailableVO> searchAreaList(AvailableVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<AvailableVO>) list("EMAU00C01.searchAreaList", vo);
	}
	
	/**
	 * 가용자원 > 분과구성 현황 담당간사 검색 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param paramMap AvailableVO
	 * @exception Exception Exception
	 */
	public List<AvailableVO> searchMemberList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (List<AvailableVO>) list("EMAU00C01.searchMemberList", paramMap);
	}
	
	/**
	 * 가용자원 > 분과구성 현황 수정  
	 * 
	 * @return  int
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */

	public int updateDivision(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (int) update("EMAU00C01.updateDivision", param);
	}

	public List<EMAU00C01VO> businessInfo(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.businessInfo", param);
	}


	public int workRequest(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return (int) insert("EMAU00C01.workRequest", paramMap);
	}


	public int confirmUpdate(int id) {
		// TODO Auto-generated method stub
		return (int) update("EMAU00C01.confirmUpdate", id);
	}


	public List<EMAU00C01VO> grmInfo(EMAU00C01VO vo) {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.grmInfo", vo);
	}


	public List<EMAU00C01VO> memberInfo(EMAU00C01VO vo) {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.memberInfo", vo);
	}


	public int isDataArea(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (int) select("EMAU00C01.isDataArea", paramMap);
	}


	public int updateArea(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (int) update("EMAU00C01.updateArea", paramMap);
	}


	public int deleteArea(int id) {
		// TODO Auto-generated method stub
		return  (int) delete("EMAU00C01.deleteArea", id);
	}


	public List<EMAU00C01VO> areaList(EMAU00C01VO vo) {
		// TODO Auto-generated method stub
		return  (List<EMAU00C01VO>) list("EMAU00C01.areaList", vo);
	}


	public List<EMAU00C01VO> selectAreaDetail(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (List<EMAU00C01VO>) list("EMAU00C01.selectAreaDetail", paramMap);
	}


	public HashMap<String, Object> paDataDetail(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (HashMap<String, Object>) select("EMAU00C01.paDataDetail", paramMap);
	}


	public List<EmPaDiVO> searchEmPjDiCode() {
		// TODO Auto-generated method stub
		return  (List<EmPaDiVO>) list("EMAU00C01.searchEmPjDiCode");
	}


	public HashMap<String, Object> isCommonResource(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (HashMap<String, Object>) select("EMAU00C01.isCommonResource", paramMap);
	}


	public List<AvailableVO> placeAutocomplete(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (List<AvailableVO>) list("EMAU00C01.placeAutocomplete", paramMap);
	}


	public List<AvailableVO> searchPlaceList(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (List<AvailableVO>) list("EMAU00C01.searchPlaceList", paramMap);
	}


	public HashMap<String, Object> placeIsUse(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (HashMap<String, Object>) select("EMAU00C01.placeIsUse", paramMap);
	}


	public int placeSave(HashMap<String, Object> paramMap)  {
		// TODO Auto-generated method stub
		try {
			return  (int) insert("EMAU00C01.placeSave", paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
		
	}


	public int memberSave(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (int) update("EMAU00C01.memberSave", paramMap);
	}
	
	public int coCateInsert(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) insert("EMAU00C01.coCateInsert", paramMap);
	}


	public int placeDelete(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) delete("EMAU00C01.placeDelete", paramMap);
	}


	public List<AvailableVO> coCateDetail(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (List<AvailableVO>) list("EMAU00C01.coCateDetail", paramMap);
	}


	public int coCateDelete(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) delete("EMAU00C01.coCateDelete", paramMap);
	}


	public List<EMAU00C01VO> isUsePlace(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (List<EMAU00C01VO>) list("EMAU00C01.isUsePlace", paramMap);
	}


	public int selectCount(AvailableVO availableVO) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00C01.selectCount", availableVO);
	}


	public int selectSearch1Count(AvailableVO availableVO) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00C01.selectSearch1Count", availableVO);
	}


	public int selectSearch2Count(AvailableVO availableVO) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00C01.selectSearch2Count", availableVO);
	}


	public int selectPjUserCount(EMAU00C01VO vo) {
		// TODO Auto-generated method stub
		return (int) select("EMAU00C01.selectPjUserCount", vo);
	}


	public List<AvailableVO> excelDownloadList(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (List<AvailableVO>) list("EMAU00C01.excelDownloadList", paramMap);
	}


}
