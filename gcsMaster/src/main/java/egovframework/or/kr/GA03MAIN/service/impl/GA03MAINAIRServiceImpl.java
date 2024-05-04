package egovframework.or.kr.GA03MAIN.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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

@Service("GA03MAINAIRService")
public class GA03MAINAIRServiceImpl extends EgovAbstractServiceImpl implements GA03MAINAIRService{

	@Resource(name = "GA03MAINAIRDAO")
	private GA03MAINAIRDAO gA03MAINAIRDAO;

	@Override
	public List<GA03MAINAIRVO> selectAirList(GA03MAINAIRVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINAIRDAO.selectAirList(vo);
	}


	@Override
	public List<GA03MAINAIRVO> selectAirList2(GA03MAINAIRVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINAIRDAO.selectAirList2(vo);
	}
	
	@Override
	public int selectAirListCnt(GA03MAINAIRVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINAIRDAO.selectAirListCnt(vo);
	}


	@Override
	public List<GA03MAINAIRVO> getDroneList(GA03MAINAIRVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINAIRDAO.getDroneList(vo);
	}


	@Override
	public List<GA03MAINAIRVO> getDroneMission(GA03MAINAIRVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINAIRDAO.getDroneMission(vo);
	}


	@Override
	public List<GA03MAINAIRVO> getDroneAction(GA03MAINAIRVO vo) throws Exception {
		// TODO Auto-generated method stub
		return gA03MAINAIRDAO.getDroneAction(vo);
	}
	 
 

}
