package egovframework.or.kr.GA07MAIN.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.GA04MAIN.service.GA04MAINService;
import egovframework.or.kr.GA04MAIN.service.GA04MAINVO;
import egovframework.or.kr.GA05MAIN.service.GA05MAINService;
import egovframework.or.kr.GA05MAIN.service.GA05MAINVO;
import egovframework.or.kr.GA06MAIN.service.GA06MAINService;
import egovframework.or.kr.GA06MAIN.service.GA06MAINVO;
import egovframework.or.kr.GA07MAIN.service.GA07MAINService;
import egovframework.or.kr.GA07MAIN.service.GA07MAINVO;
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

@Service("GA07MAINService")
public class GA07MAINServiceImpl extends EgovAbstractServiceImpl implements GA07MAINService{

	@Resource(name = "GA07MAINDAO")
	private GA07MAINDAO gA07MAINDAO;
	
	@Override
	public List<GA07MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return gA07MAINDAO.selectTest(param);
	}

}
