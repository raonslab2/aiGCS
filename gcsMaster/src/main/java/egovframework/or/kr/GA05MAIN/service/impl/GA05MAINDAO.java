package egovframework.or.kr.GA05MAIN.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA04MAIN.service.GA04MAINVO;
import egovframework.or.kr.GA05MAIN.service.GA05MAINVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA05MAINDAO")
public class GA05MAINDAO extends EgovAbstractDAO {

	public List<GA05MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<GA05MAINVO>) select("GA05MAIN.selectTest", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

}
