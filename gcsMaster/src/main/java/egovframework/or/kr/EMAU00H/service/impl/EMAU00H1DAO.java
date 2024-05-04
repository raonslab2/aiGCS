package egovframework.or.kr.EMAU00H.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import egovframework.or.kr.EMAU00F.service.EmmbgroupVO;
import egovframework.or.kr.EMAU00H.EMAU00H1VO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

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
@Repository("EMAU00H1DAO")
public class EMAU00H1DAO extends EgovAbstractDAO {

	public List<EmmbgroupVO> searchSubOption2(Map<String, Object> param) throws Exception {
		try {
			return (List<EmmbgroupVO>) list("EMAU00H1.searchSubOption2", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> requestData(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.requestData", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int businessRequest(Map<String, Object> param) {
		try {
			return (int) insert("EMAU00H1.businessRequest", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public List<EMAU00H1VO> requestInfo0(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.requestInfo0", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int requestMove(Map<String, Object> param) throws Exception {
		try {
			return update("EMAU00H1.requestMove", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int deleteRequest(Map<String, Object> param) {
		try {
			return delete("EMAU00H1.deleteRequest", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public List<EMAU00H1VO> requestRelay(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.requestRelay", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> searchTlink(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.searchTlink", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> searchTlink2(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.searchTlink2", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> searchMbCode(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.searchMbCode", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> detailView(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.detailView", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int tlWorkOld(Map<String, Object> param) throws Exception {
		try {
			return update("EMAU00H1.tlWorkOld", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public List<EMAU00H1VO> checkChangeManager(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.checkChangeManager", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int addComment(Map<String, Object> param) {
		try {
			return (int) insert("EMAU00H1.addComment", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public List<EMAU00H1VO> selectComment(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.selectComment", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> addCommentDetail(int lastInsertId) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.addCommentDetail", lastInsertId);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> commentView(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.commentView", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> tlinkAlarmSend(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) insert("EMAU00H1.tlinkAlarmSend", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> uploadFile(MultipartFile[] uploadFile) {
		try {
			return (List<EMAU00H1VO>) insert("EMAU00H1.uploadFile", uploadFile);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<EMAU00H1VO> allListView(Map<String, Object> param) {
		try {
			return (List<EMAU00H1VO>) list("EMAU00H1.allListView", param);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int uploadFile(EMAU00H1VO vo) {
		try {
			return (int) insert("EMAU00H1.uploadFile", vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return 0;
		}
	}
}
