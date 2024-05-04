package egovframework.or.kr.GA04MAIN.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.GA04MAIN.service.GA04MAINService;
import egovframework.or.kr.GA04MAIN.service.GA04MAINVO;
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

@Service("GA04MAINService")
public class GA04MAINServiceImpl extends EgovAbstractServiceImpl implements GA04MAINService{

	@Resource(name = "GA04MAINDAO")
	private GA04MAINDAO gA04MAINDAO;
	
	@Override
	public List<GA04MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return gA04MAINDAO.selectTest(param);
	}

}
