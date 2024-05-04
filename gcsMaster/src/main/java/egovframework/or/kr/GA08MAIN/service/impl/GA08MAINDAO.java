package egovframework.or.kr.GA08MAIN.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA08MAIN.service.GA08MAINVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA08MAINDAO")
public class GA08MAINDAO extends EgovAbstractDAO {

	public List<GA08MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		try {
			return (List<GA08MAINVO>) select("GA08MAIN.selectTest", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

}
