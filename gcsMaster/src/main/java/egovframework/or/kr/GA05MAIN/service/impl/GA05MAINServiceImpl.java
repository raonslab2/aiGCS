package egovframework.or.kr.GA05MAIN.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.GA04MAIN.service.GA04MAINService;
import egovframework.or.kr.GA04MAIN.service.GA04MAINVO;
import egovframework.or.kr.GA05MAIN.service.GA05MAINService;
import egovframework.or.kr.GA05MAIN.service.GA05MAINVO;
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

@Service("GA05MAINService")
public class GA05MAINServiceImpl extends EgovAbstractServiceImpl implements GA05MAINService{

	@Resource(name = "GA05MAINDAO")
	private GA05MAINDAO gA05MAINDAO;
	
	@Override
	public List<GA05MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return gA05MAINDAO.selectTest(param);
	}

}
