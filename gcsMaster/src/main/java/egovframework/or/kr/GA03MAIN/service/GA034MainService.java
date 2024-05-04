package egovframework.or.kr.GA03MAIN.service;

import java.util.HashMap;
import java.util.List;

/**
 * 기체관리
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
public interface GA034MainService { 
	
	public int GA034MainInsert(HashMap<String, Object> paramMap) throws Exception;
	public int GA034MainUpdate(HashMap<String, Object> paramMap) throws Exception; 
	public int gA034MainYNUpdate(HashMap<String, Object> paramMap) throws Exception; 
	public HashMap<String, Object> GA034MainDetail(HashMap<String, Object> paramMap) throws Exception;
	public int GA034MainDelete(HashMap<String, Object> paramMap);
	public int GA03MainDelete(HashMap<String, Object> paramMap); 
}
