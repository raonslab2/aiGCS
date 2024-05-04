package egovframework.or.kr.GA07MAIN.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA07MAIN.service.GA07MAINVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA07MAINDAO")
public class GA07MAINDAO extends EgovAbstractDAO {

	public List<GA07MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<GA07MAINVO>) select("GA07MAIN.selectTest", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

}
