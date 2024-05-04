package egovframework.or.kr.GA02MAIN.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA02MAIN.service.GA02MAINVO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA02MAINDAO")
public class GA02MAINDAO extends EgovAbstractDAO {

	public List<GA02MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<GA02MAINVO>) select("GA02MAIN.selectTest", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

}
