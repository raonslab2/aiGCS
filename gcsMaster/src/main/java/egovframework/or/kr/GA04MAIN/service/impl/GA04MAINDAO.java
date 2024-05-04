package egovframework.or.kr.GA04MAIN.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA04MAIN.service.GA04MAINVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA04MAINDAO")
public class GA04MAINDAO extends EgovAbstractDAO {

	public List<GA04MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<GA04MAINVO>) select("GA04MAIN.selectTest", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

}
