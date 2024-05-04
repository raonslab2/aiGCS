package egovframework.or.kr.GA01MAIN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00J01.service.EMAU00J01Service;
import egovframework.or.kr.EMAU00J01.service.impl.EMAU00J01DAO;
import egovframework.or.kr.GA01MAIN.service.GA01MAINService;
import egovframework.or.kr.GA01MAIN.service.GA01MAINVO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * gcs 화면
 * 
 * @author 공통서비스 개발팀 손창주
 * @since 2021.11.01
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.11.01  손창주          최초 생성 
 *
 *      </pre>
 */

@Service("GA01MAINService")
public class GA01MAINServiceImpl extends EgovAbstractServiceImpl implements GA01MAINService{

	@Resource(name = "GA01MAINDAO")
	private GA01MAINDAO gA01MAINDAO;
	
	@Override
	public List<GA01MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return gA01MAINDAO.selectTest(param);
	}

	@Override
	public int insertDroneLog(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return gA01MAINDAO.insertDroneLog(paramMap);
	}

	@Override
	public List<GA01MAINVO> selectDrone(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return gA01MAINDAO.selectDrone(param);
	}

 
	@Override
	public List<GA01MAINVO> selectDroneList(GA01MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA01MAINDAO.selectDroneList(vo);
	}

	@Override
	public List<GA01MAINVO> selectDronePathList(GA01MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA01MAINDAO.selectDronePathList(vo);
	}

	@Override
	public void deleteLogin(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		gA01MAINDAO.deleteLogin(vo);
	}

	 

}
