package egovframework.or.kr.GA06MAIN.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA04MAIN.service.GA04MAINVO;
import egovframework.or.kr.GA05MAIN.service.GA05MAINVO;
import egovframework.or.kr.GA06MAIN.service.GA06MAINVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA06MAINDAO")
public class GA06MAINDAO extends EgovAbstractDAO {

	public List<GA06MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<GA06MAINVO>) select("GA06MAIN.selectTest", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

}
