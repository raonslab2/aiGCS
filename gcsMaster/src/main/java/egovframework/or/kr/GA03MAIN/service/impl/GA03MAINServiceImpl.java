package egovframework.or.kr.GA03MAIN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00J01.service.EMAU00J01Service;
import egovframework.or.kr.EMAU00J01.service.impl.EMAU00J01DAO;
import egovframework.or.kr.GA01MAIN.service.GA01MAINService;
import egovframework.or.kr.GA01MAIN.service.GA01MAINVO;
import egovframework.or.kr.GA02MAIN.service.GA02MAINService;
import egovframework.or.kr.GA02MAIN.service.GA02MAINVO;
import egovframework.or.kr.GA03MAIN.service.DeviceVO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINService;
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

@Service("GA03MAINService")
public class GA03MAINServiceImpl extends EgovAbstractServiceImpl implements GA03MAINService{

	@Resource(name = "GA03MAINDAO")
	private GA03MAINDAO gA03MAINDAO;
	
	@Override
	public GA03MAINVO selectWaypoint(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectWaypoint(vo);
	}
	
	@Override
	public List<GA03MAINVO> selectWaypointList(GA03MAINVO vo) throws Exception{
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectWaypointList(vo);
	}

	@Override
	public int selectWaypointListCnt(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectWaypointListCnt(vo);
	}

	/**
	 * waypoint > waypoint
	 * @param param Map<String, Object>
	 * @return AvailableVO
	 *
	 * @exception Exception Exception
	 */  

	@Override
	public int insertWaypoint(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.insertWaypoint(paramMap);
	}

	@Override
	public void updateWaypoint(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		gA03MAINDAO.updateWaypoint(paramMap);
	}

	@Override
	public int insertDrone(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.insertDrone(paramMap);
	}

	@Override
	public int insertSwarmWaypoint(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.insertSwarmWaypoint(paramMap);
	}

	@Override
	public GA03MAINVO selectDroneSwarmPk(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectDroneSwarmPk(vo);
	}

	@Override
	public int insertDroneSwarmPk(HashMap<String, Object> tmStr2) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.insertDroneSwarmPk(tmStr2);
	}

	@Override
	public List<GA03MAINVO> selectWaypointSwarmList(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectWaypointSwarmList(vo);
	}

	@Override
	public int selectWaypointSwarmListCnt(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectWaypointSwarmListCnt(vo);
	}

	@Override
	public GA03MAINVO selectDroneSwarmPkList(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectDroneSwarmPkList(vo);
	}

	@Override
	public void updateDroneSwarmPk(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		gA03MAINDAO.updateDroneSwarmPk(paramMap); 
	}

	@Override
	public List<DeviceVO> selectDroneList(DeviceVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectDroneList(vo);
	}

	@Override
	public int selectDroneListCnt(DeviceVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectDroneListCnt(vo);
	}

	@Override
	public List<GA03MAINVO> selectWaypointList2(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectWaypointList2(vo);
	}

	@Override
	public int selectWaypointListCnt2(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectWaypointListCnt2(vo);
	}

	@Override
	public GA03MAINVO selectWaypoint2(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectWaypoint2(vo);
	}

	@Override
	public List<GA03MAINVO> selectListPj(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectListPj(vo);
	}

	@Override
	public int selectListPjCnt(GA03MAINVO vo) {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectListPjCnt(vo);
	} 

	@Override
	public int insertProjectName(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return gA03MAINDAO.insertProjectName(paramMap);
	}

	@Override
	public GA03MAINVO selectWaypointCheck(GA03MAINVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectWaypointCheck(vo);
	}

	@Override
	public void updateDroneProject(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		gA03MAINDAO.updateDroneProject(paramMap); 
	}

	@Override
	public GA03MAINVO selectDetailWayPoint(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINDAO.selectDetailWayPoint(paramMap); 
	}

	@Override
	public void uploadDivProject(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		gA03MAINDAO.uploadDivProject(paramMap); 
	}  
	
 

}
