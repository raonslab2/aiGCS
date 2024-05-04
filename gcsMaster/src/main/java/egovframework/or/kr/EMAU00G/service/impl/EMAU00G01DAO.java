package egovframework.or.kr.EMAU00G.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00B.service.EmpjVO;
import egovframework.or.kr.EMAU00C.service.CommonVO;
import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00G.service.EMAU00G01VO;
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
@Repository("EMAU00G01DAO")
public class EMAU00G01DAO extends EgovAbstractDAO {

	/**
	 * 사업명 검색
	 * 
	 * @param vo searchCode
	 * @return CommonVO
	 * @exception Exception
	 */

	public HashMap<String, Object> searchBusiness(Map<String, Object> param) {
		try {
			return (HashMap<String, Object>) select("EMAU00G01.searchBusiness", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public String businessDepart(LoginVO user) {
		try {
			return (String) select("EMAU00G01.businessDepart", user);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}

	}

	public List<EMAU00G01VO> searchRpaPjList1(Map<String, Object> param) {
		try {
			return (List<EMAU00G01VO>) list("EMAU00G01.searchRpaPjList1", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00G01VO> dataRequest(Map<String, Object> paramMap) {
		try {
			return (List<EMAU00G01VO>) insert("EMAU00G01.dataRequest", paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EmpjVO> autocomplete(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (List<EmpjVO>) list("EMAU00G01.autocomplete", param);
	}

	public List<EMAU00G01VO> searchRpaPjList(Map<String, Object> param) {
		try {
			return (List<EMAU00G01VO>) list("EMAU00G01.searchRpaPjList", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int insertEMAU00G01(Map<String, Object> param) {
		try {
			return (int) insert("EMAU00G01.insertEMAU00G01", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public List<EMAU00G01VO> eMAU00RPA10001(Map<String, Object> param) {
		try {
			return (List<EMAU00G01VO>) list("EMAU00G01.eMAU00RPA10001", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int eMAU00RPA10002(String seCode) {
		try {
			return (int) update("EMAU00G01.eMAU00RPA10002", seCode);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}


	public int insert2EMAU00G01(HashMap<String, Object> resultMap) {
		try {
			return (int) insert("EMAU00G01.insert2EMAU00G01", resultMap);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public HashMap<String, Object> selectEMAU00G01(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (HashMap<String, Object>) select("EMAU00G01.selectEMAU00G01", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}
}
