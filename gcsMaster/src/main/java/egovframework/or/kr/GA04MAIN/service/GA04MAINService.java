package egovframework.or.kr.GA04MAIN.service;

import java.util.List;
import java.util.Map;

import egovframework.or.kr.EMAU00J01.service.EMAU00J01VO;

/**
 * gcs 화면
 * @author 공통서비스 개발팀 손창주
 * @since 2021.11.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.11.01  손창주          최초 생성 
 *
 *  </pre>
 */
public interface GA04MAINService {
	
	
	List<GA04MAINVO> selectTest(Map<String, Object> param);
}
