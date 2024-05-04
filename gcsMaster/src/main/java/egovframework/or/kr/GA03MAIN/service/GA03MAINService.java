package egovframework.or.kr.GA03MAIN.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.FileVO;
import egovframework.let.cop.bbs.service.BoardMaster;
import egovframework.or.kr.EMAU00E.service.BusinessPjInf;
import egovframework.or.kr.EMAU00J01.service.EMAU00J01VO;

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
public interface GA03MAINService { 
	
	/**
	 * waypoint edit
	 * @param BoardMaster
	 * 
	 * @param boardMaster
	 * @exception Exception Exception
	 */ 
	GA03MAINVO selectWaypoint(GA03MAINVO vo) throws Exception;
	
	/**
	 * waypoint list
	 * @param BoardMaster
	 * 
	 * @param boardMaster
	 * @exception Exception Exception
	 */ 
	List<GA03MAINVO> selectWaypointList(GA03MAINVO vo) throws Exception;
	
	public int selectWaypointListCnt(GA03MAINVO vo) throws Exception;
	
 
	/**
	 * waypoint edit
	 * @param BoardMaster
	 * 
	 * @param boardMaster
	 * @exception Exception Exception
	 */ 
	//public String insertWaypoint(GA03MAINVO gA03MAINVO) throws Exception;
	int insertWaypoint(HashMap<String, Object> paramMap) throws Exception;

	void updateWaypoint(HashMap<String, Object> paramMap) throws Exception;

	int insertDrone(HashMap<String, Object> paramMap) throws Exception;

	int insertSwarmWaypoint(HashMap<String, Object> paramMap)throws Exception;
 
	GA03MAINVO selectDroneSwarmPk(GA03MAINVO paramPk)throws Exception;

	int insertDroneSwarmPk(HashMap<String, Object> tmStr2)throws Exception;

	List<GA03MAINVO> selectWaypointSwarmList(GA03MAINVO vo)throws Exception;

	int selectWaypointSwarmListCnt(GA03MAINVO vo)throws Exception;

	GA03MAINVO selectDroneSwarmPkList(GA03MAINVO vo)throws Exception;

	void updateDroneSwarmPk(HashMap<String, Object> paramMap) throws Exception;

	List<DeviceVO> selectDroneList(DeviceVO vo)throws Exception;

	int selectDroneListCnt(DeviceVO vo)throws Exception;

	List<GA03MAINVO> selectWaypointList2(GA03MAINVO vo)throws Exception;

	int selectWaypointListCnt2(GA03MAINVO vo)throws Exception;

	GA03MAINVO selectWaypoint2(GA03MAINVO vo)throws Exception;

	
	
}
