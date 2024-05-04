package egovframework.or.kr.EMAU00C.service;

public class CommonVO {
	 
	/**
	 * serialVersion UID
	 */
	private static final long serialVersionUID = -6744703112021062401L; 
	
    private String vuDiCode  = "";
    
    private String vuDiTitle = "";
    
	private String comKey = "";
    
    private String comValue = "";
    
    public String getComKey() {
		return comKey;
	}

	public void setComKey(String comKey) {
		this.comKey = comKey;
	}

	public String getComValue() {
		return comValue;
	}

	public void setComValue(String comValue) {
		this.comValue = comValue;
	} 
    
    public String getVuDiCode() {
		return vuDiCode;
	}

	public void setVuDiCode(String vuDiCode) {
		this.vuDiCode = vuDiCode;
	}

	public String getVuDiTitle() {
		return vuDiTitle;
	}

	public void setVuDiTitle(String vuDiTitle) {
		this.vuDiTitle = vuDiTitle;
	} 
}
