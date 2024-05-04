package egovframework.or.kr.GA03MAIN.service.impl;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import egovframework.or.kr.GA03MAIN.service.DeviceVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("GA034MAINDAO")
public class GA034MAINDAO extends EgovAbstractDAO{ 
	
	public int GA034MainInsert(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) insert("GA034MAIN.GA034MainInsert", paramMap);
	}

 
	public int GA034MainUpdate(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) update("GA034MAIN.GA034MainUpdate", paramMap);
	}
	
	public int gA034MainYNUpdate(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return (int) update("GA034MAIN.gA034MainYNUpdate", paramMap);
	} 


	@SuppressWarnings("unchecked")
	public HashMap<String, Object> GA034MainDetail(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub 
		try {
			return (HashMap<String, Object>) select("GA034MAIN.GA034MainDetail", paramMap);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null ;
		}
	}


	public int GA034MainDelete(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (int) delete("GA034MAIN.GA034MainDelete", paramMap);
	}


	public int GA03MainDelete(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return  (int) delete("GA034MAIN.GA03MainDelete", paramMap);
	}
 

}
