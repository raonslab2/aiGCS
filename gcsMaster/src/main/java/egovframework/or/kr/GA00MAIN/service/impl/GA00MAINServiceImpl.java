package egovframework.or.kr.GA00MAIN.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.or.kr.EMAU00J01.service.EMAU00J01Service;
import egovframework.or.kr.EMAU00J01.service.impl.EMAU00J01DAO;
import egovframework.or.kr.GA00MAIN.service.GA00MAINService;
import egovframework.or.kr.GA00MAIN.service.GA00MAINVO;
import egovframework.or.kr.GA01MAIN.service.GA01MAINService;
import egovframework.or.kr.GA01MAIN.service.GA01MAINVO;
import egovframework.or.kr.GA01MAIN.service.impl.GA01MAINDAO;
import egovframework.or.kr.GA03MAIN.service.GA03MAINVO;
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

@Service("GA00MAINService")
public class GA00MAINServiceImpl extends EgovAbstractServiceImpl implements GA00MAINService{

	@Resource(name = "GA00MAINDAO")
	private GA00MAINDAO gA00MAINDAO;
	
	@Override
	public List<GA00MAINVO> selectDeviceType(GA00MAINVO vo) {
		// TODO Auto-generated method stub
		return gA00MAINDAO.selectDeviceType(vo);
	}
 
}
