package egovframework.or.kr.GA03MAIN.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA03MAINAIRDAO")
public class GA03MAINAIRDAO extends EgovAbstractDAO {
 
	@SuppressWarnings("unchecked")
	public List<GA03MAINAIRVO> selectAirList(GA03MAINAIRVO vo) {
		// TODO Auto-generated method stub
		return (List<GA03MAINAIRVO>) list("GA03MAINAIR.selectAirList", vo);
	}
	
	 
	@SuppressWarnings("unchecked")
	public List<GA03MAINAIRVO> selectAirList2(GA03MAINAIRVO vo) {
		// TODO Auto-generated method stub
		return (List<GA03MAINAIRVO>) list("GA03MAINAIR.selectAirList2", vo);
	}

	public int selectAirListCnt(GA03MAINAIRVO vo) {
		// TODO Auto-generated method stub
		return (int) select("GA03MAINAIR.selectAirListCnt", vo);
	}


	public List<GA03MAINAIRVO> getDroneList(GA03MAINAIRVO vo) {
		// TODO Auto-generated method stub
		return (List<GA03MAINAIRVO>) list("GA03MAINAIR.getDroneList", vo);
	}


	public List<GA03MAINAIRVO> getDroneMission(GA03MAINAIRVO vo) {
		// TODO Auto-generated method stub
		return (List<GA03MAINAIRVO>) list("GA03MAINAIR.getDroneMission", vo);
	}


	public List<GA03MAINAIRVO> getDroneAction(GA03MAINAIRVO vo) {
		// TODO Auto-generated method stub
		return (List<GA03MAINAIRVO>) list("GA03MAINAIR.getDroneAction", vo);
	}
 
}
