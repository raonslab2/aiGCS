package egovframework.or.kr.EMAU00C.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.AvailableVO;
import egovframework.or.kr.EMAU00C.service.CommonVO;
import egovframework.or.kr.EMAU00C.service.EMAU00C01Service;
import egovframework.or.kr.EMAU00C.service.EMAU00C01VO;
import egovframework.or.kr.EMAU00C.service.EmPaDiVO;
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00G.service.EMAU00G01VO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

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
@Service("EMAU00C01Service")
public class EMAU00C01ServiceImpl extends EgovAbstractServiceImpl implements EMAU00C01Service {

	@Resource(name = "EMAU00C01DAO")
	private EMAU00C01DAO eMAU00C01DAO;

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
		LoginVO loginVO = eMAU00C01DAO.actionLogin(vo);

		// 3. 결과를 리턴한다.
		if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
			return loginVO;
		} else {
			loginVO = new LoginVO();
		}

		return loginVO;
	}
	
	/**
	 * 분과구성 현황
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */

	@Override
	public List<AvailableVO> selectAvailableList(AvailableVO availableVO) throws Exception {
		// TODO Auto-generated method stub 
		return eMAU00C01DAO.selectAvailableList(availableVO);
		
	}

	/**
	 * 평가구분 현황
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	@Override
	public List<EmPaDiVO> searchEmPjVuCode(String searchCode) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchEmPjVuCode(searchCode);
	}
	
	@Override
	public List<EmmbgroupVO> autocomplete(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.autocomplete(param);
	}

	
	/**
	 * 가용자원 > 검색서비스 ( 사업명 )
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<AvailableVO> searchBusinessList(AvailableVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchBusinessList(vo);
	}
	/**
	 * 가용자원 > 검색서비스 ( 사업 추가기능 )
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<AvailableVO> searchAddList(AvailableVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchAddList(vo);
	}
	
	/**
	 * 가용자원 > 분과구성 현황 등록 > 검색서비스 (추가기능)
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public List<AvailableVO> searchBusinessAllList(AvailableVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchBusinessAllList(vo);
	}
	
	/**
	 * 가용자원 >  사업명 불러오기
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public HashMap<String, Object> selectBusinessList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectBusinessList(param);
	}
	
	/**
	 * 가용자원 > 분과구성 등록
	 * @param param Map
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */
	@Override
	public int insertDivision(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.insertDivision(param);
	}


	@Override
	public List<EmpjVO> autocomplete2(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.autocomplete2(param);
	}

	@Override
	public List<EmpjVO> autocomplete3(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.autocomplete3(param);
	}

	@Override
	public List<EMAU00C01VO> selectAreaList2(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectAreaList2(vo);
	}

	@Override
	public List<EMAU00C01VO> selectAreaCateList(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectAreaCateList(vo);
	}

	@Override
	public List<EMAU00C01VO> addEvaluation(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.addEvaluation(param);
	}

	@Override
	public HashMap<String, Object> hasDataConfirm(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.hasDataConfirm(param);
	}


	@Override
	public List<EmpjVO> autocomplete4(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.autocomplete4(param);
	}

	@Override
	public List<EMAU00C01VO> insertUser(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.insertUser(param);
	}

	@Override
	public List<EMAU00C01VO> selectPjUsertList(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectPjUsertList(vo);
	}

	@Override
	public List<EMAU00C01VO> selectAreaDetailList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectAreaDetailList(param);
	}

	@Override
	public List<EMAU00C01VO> selectAreaList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectAreaList(param);
	}

	@Override
	public List<EMAU00C01VO> selectUserList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectUserList(param);
	}

	@Override
	public List<EMAU00C01VO> selectWeekUserList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectWeekUserList(param);
	}
	
	/**
	 * 가용자원 - 셀렉트박스 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	@Override
	public List<AvailableVO> searchOption(AvailableVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchOption(vo);
	}

	@Override
	public List<EMAU00C01VO> clickArea(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.clickArea(param);
	}
	/**
	 * 간사 할당 프로젝트
	 * @param vo CommonVO
	 * @return LoginVO
	 * @exception Exception
	 */
	/*
	 * @Override public List<CommonVO> searchUserPjList(String searchCode) throws
	 * Exception { // TODO Auto-generated method stub return
	 * eMAU00C01DAO.searchUserPjList(searchCode); }
	 */

	@Override
	public int insertArea(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.insertArea(param);
	}
	
	/**
	 * 가용자원 > 분과구성 현황 분과위원회  
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	@Override
	public List<AvailableVO> divisionList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.divisionList(param);
	}

	@Override
	public List<EMAU00C01VO> searchGrmName(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchGrmName(param);
	}
	
	/**
	 * 가용자원 > 분과구성 현황 평가장 검색 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	@Override
	public List<AvailableVO> searchAreaList(AvailableVO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchAreaList(vo);
	}
	
	/**
	 * 가용자원 > 분과구성 현황 담당간사 검색 
	 * 
	 * @return  정보 Map [key : 항목명]
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	@Override
	public List<AvailableVO> searchMemberList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchMemberList(paramMap);
	}
	/**
	 * 가용자원 > 분과구성 현황 수정  
	 * 
	 * @return  int
	 *
	 * @param vo AvailableVO
	 * @exception Exception Exception
	 */
	@Override
	public int updateDivision(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.updateDivision(param);
	}

	@Override
	public List<EMAU00C01VO> possibleStatus(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.possibleStatus(param);
	}

	@Override
	public List<EMAU00C01VO> businessInfo(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.businessInfo(param);
	}

	@Override
	public int workRequest(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.workRequest(paramMap);
	}

	@Override
	public int confirmUpdate(int id) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.confirmUpdate(id);
	}

	@Override
	public List<EMAU00C01VO> grmInfo(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.grmInfo(vo);
	}

	@Override
	public List<EMAU00C01VO> memberInfo(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.memberInfo(vo);
	}

	@Override
	public int isDataArea(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.isDataArea(paramMap);
	}

	@Override
	public int updateArea(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.updateArea(paramMap);
	}

	@Override
	public int deleteArea(int id) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.deleteArea(id);
	}

	@Override
	public List<EMAU00C01VO> areaList(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.areaList(vo);
	}

	@Override
	public List<EMAU00C01VO> selectAreaDetail(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectAreaDetail(paramMap);
	}

	@Override
	public HashMap<String, Object> paDataDetail(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.paDataDetail(paramMap);
	}

	@Override
	public List<EmPaDiVO> searchEmPjDiCode() throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchEmPjDiCode();
	}

	@Override
	public HashMap<String, Object> isCommonResource(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.isCommonResource(paramMap);
	}

	@Override
	public List<AvailableVO> placeAutocomplete(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.placeAutocomplete(paramMap);
	}

	@Override
	public List<AvailableVO> searchPlaceList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.searchPlaceList(paramMap);
	}

	@Override
	public HashMap<String, Object> placeIsUse(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.placeIsUse(paramMap);
	}

	@Override
	public int placeSave(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.placeSave(paramMap);
	}

	@Override
	public int memberSave(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.memberSave(paramMap);
	}
	
	@Override
	public int coCateInsert(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.coCateInsert(paramMap);
	}

	@Override
	public int placeDelete(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.placeDelete(paramMap);
	}

	@Override
	public List<AvailableVO> coCateDetail(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.coCateDetail(paramMap);
	}

	@Override
	public int coCateDelete(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.coCateDelete(paramMap);
	}

	@Override
	public List<EMAU00C01VO> isUsePlace(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.isUsePlace(paramMap);
	}

	@Override
	public int selectCount(AvailableVO availableVO) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectCount(availableVO);
	}

	@Override
	public int selectSearch1Count(AvailableVO availableVO) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectSearch1Count(availableVO);
	}

	@Override
	public int selectSearch2Count(AvailableVO availableVO) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectSearch2Count(availableVO);
	}

	@Override
	public int selectPjUserCount(EMAU00C01VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.selectPjUserCount(vo);
	}

	@Override
	public List<AvailableVO> excelDownloadList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00C01DAO.excelDownloadList(paramMap);
	}

}