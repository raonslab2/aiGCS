package egovframework.or.kr.EMAU00H.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00H.EMAU00H1VO;

/**
 * 일반 로그인을 처리하는 비즈니스 구현 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */

public interface EMAU00H1Service {

	List<EmmbgroupVO> SearchSubOption2(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> requestData(Map<String, Object> param) throws Exception;

	int businessRequest(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> requestInfo0(Map<String, Object> param) throws Exception;

	int requestMove(Map<String, Object> param) throws Exception;

	int deleteRequest(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> requestRelay(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> searchTlink(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> searchTlink2(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> searchMbCode(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> detailView(Map<String, Object> param) throws Exception;

	int tlWorkOld(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> checkChangeManager(Map<String, Object> param) throws Exception;

	int addComment(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> selectComment(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> addCommentDetail(int lastInsertId) throws Exception;

	List<EMAU00H1VO> commentView(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> tlinkAlarmSend(Map<String, Object> param) throws Exception;

	List<EMAU00H1VO> allListView(Map<String, Object> param) throws Exception;

	int uploadFile(EMAU00H1VO vo) throws Exception;
}
