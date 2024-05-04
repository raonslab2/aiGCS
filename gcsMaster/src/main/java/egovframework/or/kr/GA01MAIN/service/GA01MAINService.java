package egovframework.or.kr.GA01MAIN.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00J01.service.EMAU00J01VO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINVO;

/**
 * gcs 화면
 * @author 공통서비스 개발팀 손창주
 * @since 2021.11.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.11.01  손창주          최초 생성 
 *
 *  </pre>
 */
public interface GA01MAINService {
	
	
	List<GA01MAINVO> selectTest(Map<String, Object> param);
	
	int insertDroneLog(HashMap<String, Object> paramMap) throws Exception;
	List<GA01MAINVO> selectDrone(Map<String, Object> param) throws Exception;

	List<GA01MAINVO> selectDroneList(GA01MAINVO vo)throws Exception;

	List<GA01MAINVO> selectDronePathList(GA01MAINVO vo) throws Exception;

	void deleteLogin(LoginVO vo)throws Exception;
}
