package egovframework.or.kr.GA00MAIN.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA00MAIN.service.GA00MAINVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA00MAINDAO")
public class GA00MAINDAO extends EgovAbstractDAO {

	public List<GA00MAINVO> selectDeviceType(GA00MAINVO vo) {
		// TODO Auto-generated method stub
		return (List<GA00MAINVO>) list("GA00MAIN.selectDeviceType", vo); 
	}
}
