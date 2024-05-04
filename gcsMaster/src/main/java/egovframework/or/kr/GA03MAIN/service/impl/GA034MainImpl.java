package egovframework.or.kr.GA03MAIN.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.GA03MAIN.service.DeviceVO;
import egovframework.or.kr.GA03MAIN.service.GA034MainService;
import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRService;
import egovframework.or.kr.GA03MAIN.service.GA03MAINAIRVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * gcs 화면
 * 
 * @author 공통서비스 개발팀 손창주
 * @since 2021.11.01
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.11.01  손창주          최초 생성 
 *
 *      </pre>
 */

@Service("GA034MainService")
public class GA034MainImpl extends EgovAbstractServiceImpl implements GA034MainService{

	@Resource(name = "GA034MAINDAO")
	private GA034MAINDAO gA034MAINDAO;

	@Override
	public int GA034MainInsert(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return gA034MAINDAO.GA034MainInsert(paramMap);
	}

	@Override
	public int GA034MainUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return gA034MAINDAO.GA034MainUpdate(paramMap);
	}
	
	@Override
	public int gA034MainYNUpdate(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return gA034MAINDAO.gA034MainYNUpdate(paramMap);
	}

	@Override
	public HashMap<String, Object> GA034MainDetail(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return gA034MAINDAO.GA034MainDetail(paramMap); 
	}

	@Override
	public int GA034MainDelete(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return gA034MAINDAO.GA034MainDelete(paramMap);
	}
	
	@Override
	public int GA03MainDelete(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return gA034MAINDAO.GA03MainDelete(paramMap);
	}


 

}
