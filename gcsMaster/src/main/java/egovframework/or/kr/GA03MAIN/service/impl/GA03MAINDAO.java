package egovframework.or.kr.GA03MAIN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.let.cop.bbs.service.BoardMaster;
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.GA02MAIN.service.GA02MAINVO;
import egovframework.or.kr.GA03MAIN.service.DeviceVO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA03MAINDAO")
public class GA03MAINDAO extends EgovAbstractDAO {

	
	public GA03MAINVO selectWaypoint(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (GA03MAINVO) select("GA03MAIN.selectWaypoint", vo);
	} 
	
	public List<GA03MAINVO> selectWaypointList(GA03MAINVO vo) throws Exception{
		// TODO Auto-generated method stub
		return (List<GA03MAINVO>) list("GA03MAIN.selectWaypointList", vo);
	} 
 
	public int selectWaypointListCnt(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int) select("GA03MAIN.selectWaypointListCnt", vo);
	}
	
	public int insertWaypoint(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("GA03MAIN.insertWaypoint", paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			//e.printStackTrace();
			return 0;
		}
	}

	public void updateWaypoint(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		//update("TemplateManageDAO.updateTemplateInf", tmplatInf);
		update("GA03MAIN.updateWaypoint", paramMap);
	}

	public int insertDrone(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("GA03MAIN.insertDrone", paramMap);
		} catch (Exception e) {
			// TODO: handle exception 
			return 0;
		}
	}

	public int insertSwarmWaypoint(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("GA03MAIN.insertSwarmWaypoint", paramMap);
		} catch (Exception e) {
			// TODO: handle exception 
			return 0;
		}
	}

	public GA03MAINVO selectDroneSwarmPk(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return (GA03MAINVO) select("GA03MAIN.selectDroneSwarmPk", vo);
	}

	public int insertDroneSwarmPk(HashMap<String, Object> tmStr2) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("GA03MAIN.insertDroneSwarmPk", tmStr2);
		} catch (Exception e) {
			// TODO: handle exception 
			return 0;
		}
	}

	public List<GA03MAINVO> selectWaypointSwarmList(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return (List<GA03MAINVO>) list("GA03MAIN.selectWaypointSwarmList", vo);
	}

	public int selectWaypointSwarmListCnt(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return (int) select("GA03MAIN.selectWaypointSwarmListCnt", vo);
	}

	public GA03MAINVO selectDroneSwarmPkList(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (GA03MAINVO) select("GA03MAIN.selectDroneSwarmPkList", vo);
	}

	public void updateDroneSwarmPk(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		update("GA03MAIN.updateDroneSwarmPk", paramMap);
	}

	public List<DeviceVO> selectDroneList(DeviceVO vo) {
		// TODO Auto-generated method stub
		return (List<DeviceVO>) list("GA03MAIN.selectDroneList", vo);
	}

	public int selectDroneListCnt(DeviceVO vo) {
		// TODO Auto-generated method stub
		return (int) select("GA03MAIN.selectDroneListCnt", vo);
	}

	@SuppressWarnings("unchecked")
	public List<GA03MAINVO> selectWaypointList2(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return (List<GA03MAINVO>) list("GA03MAIN.selectWaypointList2", vo);
	}

	public int selectWaypointListCnt2(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return (int) select("GA03MAIN.selectWaypointListCnt2", vo);
	}

	public GA03MAINVO selectWaypoint2(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return (GA03MAINVO) select("GA03MAIN.selectWaypoint2", vo);
	}

	@SuppressWarnings("unchecked")
	public List<GA03MAINVO> selectListPj(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return (List<GA03MAINVO>) list("GA03MAIN.selectListPj", vo);
	}

	public int selectListPjCnt(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return (int) select("GA03MAIN.selectListPjCnt", vo);
	}
 
	public int insertProjectName(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		try {
			return (int) insert("GA03MAIN.insertProjectName", paramMap);
		} catch (Exception e) {
			// TODO: handle exception 
			//e.printStackTrace();
			return 0;
		}
	} 

	public int selectWaypointCheck(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) select("GA03MAIN.selectWaypointCheck", paramMap);
	}

	public GA03MAINVO selectWaypointCheck(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return (GA03MAINVO) select("GA03MAIN.selectWaypointCheck", vo);
	}

	public void updateDroneProject(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		update("GA03MAIN.updateDroneProject", paramMap);
	}

	public GA03MAINVO selectDetailWayPoint(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (GA03MAINVO) select("GA03MAIN.selectDetailWayPoint", paramMap);
	}

	public void uploadDivProject(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		update("GA03MAIN.uploadDivProject", paramMap);
	}
 
}
