package egovframework.or.kr.EMAU00H.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00F.service.impl.EMAU00F01DAO;
import egovframework.or.kr.EMAU00H.EMAU00H1VO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 일반 로그인을 처리하는 비즈니스 구현 클래스
 * 
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *      </pre>
 */
@Service("EMAU00H1Service")
public class EMAU00H1ServiceImpl extends EgovAbstractServiceImpl implements EMAU00H1Service {
	@Resource(name = "EMAU00H1DAO")
	private EMAU00H1DAO eMAU00H1DAO;
	
	@Override
	public List<EmmbgroupVO> SearchSubOption2(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.searchSubOption2(param);
	}

	@Override
	public List<EMAU00H1VO> requestData(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.requestData(param);
	}

	@Override
	public int businessRequest(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.businessRequest(param);
	}

	@Override
	public List<EMAU00H1VO> requestInfo0(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.requestInfo0(param);
	}

	@Override
	public int requestMove(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.requestMove(param);
	}

	@Override
	public int deleteRequest(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.deleteRequest(param);
	}

	@Override
	public List<EMAU00H1VO> requestRelay(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.requestRelay(param);
	}

	@Override
	public List<EMAU00H1VO> searchTlink(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.searchTlink(param);
	}

	@Override
	public List<EMAU00H1VO> searchTlink2(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.searchTlink2(param);
	}

	@Override
	public List<EMAU00H1VO> searchMbCode(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.searchMbCode(param);
	}

	@Override
	public List<EMAU00H1VO> detailView(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.detailView(param);
	}

	@Override
	public int tlWorkOld(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.tlWorkOld(param);
	}

	@Override
	public List<EMAU00H1VO> checkChangeManager(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.checkChangeManager(param);
	}

	@Override
	public int addComment(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.addComment(param);
	}

	@Override
	public List<EMAU00H1VO> selectComment(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.selectComment(param);
	}

	@Override
	public List<EMAU00H1VO> addCommentDetail(int lastInsertId) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.addCommentDetail(lastInsertId);
	}

	@Override
	public List<EMAU00H1VO> commentView(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.commentView(param);
	}

	@Override
	public List<EMAU00H1VO> tlinkAlarmSend(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.tlinkAlarmSend(param);
	}

	@Override
	public List<EMAU00H1VO> allListView(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.allListView(param);
	}

	@Override
	public int uploadFile(EMAU00H1VO vo) throws Exception {
		// TODO Auto-generated method stub
		return eMAU00H1DAO.uploadFile(vo);
	}

}
