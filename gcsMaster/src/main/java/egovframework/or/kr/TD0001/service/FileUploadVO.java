package egovframework.or.kr.TD0001.service;
 
import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2022.03.08    민병안          최초 생성
 *
 *  @author 개발팀 박지욱
 *  @since 2022.03.08
 *  @version 1.0
 *  @see
 *  
 */


public class FileUploadVO implements Serializable{ 
	
	private static final long serialVersionUID = -9219604963667233010L;
 
    
    private String originalFilename = "";
    private String savedFilePath = "";
    private String flTable = "";
    private int flFilePk=0;
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getSavedFilePath() {
		return savedFilePath;
	}
	public void setSavedFilePath(String savedFilePath) {
		this.savedFilePath = savedFilePath;
	}
	public String getFlTable() {
		return flTable;
	}
	public void setFlTable(String flTable) {
		this.flTable = flTable;
	}
	public int getFlFilePk() {
		return flFilePk;
	}
	public void setFlFilePk(int flFilePk) {
		this.flFilePk = flFilePk;
	}
    
    
      
}
