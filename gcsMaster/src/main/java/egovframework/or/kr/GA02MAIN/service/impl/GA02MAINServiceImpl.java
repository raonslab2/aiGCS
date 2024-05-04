package egovframework.or.kr.GA02MAIN.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.EMAU00J01.service.EMAU00J01Service;
import egovframework.or.kr.EMAU00J01.service.impl.EMAU00J01DAO;
import egovframework.or.kr.GA01MAIN.service.GA01MAINService;
import egovframework.or.kr.GA01MAIN.service.GA01MAINVO;
import egovframework.or.kr.GA02MAIN.service.GA02MAINService;
import egovframework.or.kr.GA02MAIN.service.GA02MAINVO;
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

@Service("GA02MAINService")
public class GA02MAINServiceImpl extends EgovAbstractServiceImpl implements GA02MAINService{

	@Resource(name = "GA02MAINDAO")
	private GA02MAINDAO gA02MAINDAO;
	
	@Override
	public List<GA02MAINVO> selectTest(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return gA02MAINDAO.selectTest(param);
	}

}
