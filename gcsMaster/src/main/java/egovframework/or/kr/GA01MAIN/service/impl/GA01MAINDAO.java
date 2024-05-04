package egovframework.or.kr.GA01MAIN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.LoginVO;
import egovframework.or.kr.EMAU00A.service.DashboardVO;
import egovframework.or.kr.GA01MAIN.service.GA01MAINVO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA01MAINDAO")
public class GA01MAINDAO extends EgovAbstractDAO {

	public List<GA01MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<GA01MAINVO>) select("GA01MAIN.selectTest", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<GA01MAINVO> selectDrone(Map<String, Object> param) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		try {
			return (List<GA01MAINVO>) list("GA01MAIN.selectDrone", param); 
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int insertDroneLog(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("EMAU00J01.insertDroneLog", paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public List<GA01MAINVO> selectDroneList(GA01MAINVO vo) throws Exception{
		// TODO Auto-generated method stub
		return (List<GA01MAINVO>) list("GA01MAIN.selectDroneList", vo);
	}

	public List<GA01MAINVO> selectDronePathList(GA01MAINVO vo) {
		// TODO Auto-generated method stub
		return (List<GA01MAINVO>) list("GA01MAIN.selectDronePathList", vo);
	}
 

	public void deleteLogin(LoginVO vo) {
		// TODO Auto-generated method stub
		delete("GA01MAIN.deleteLogin", vo);
	}

}
