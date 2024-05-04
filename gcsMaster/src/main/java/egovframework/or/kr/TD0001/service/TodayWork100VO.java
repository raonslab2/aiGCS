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


/**
 * @author 82105
 *
 */
public class TodayWork100VO implements Serializable{ 
	
	private static final long serialVersionUID = -9219604963667233010L;
	 
	private	int	tdNum	;
	private	String	tdClassification	;
	private	String	tdService	;
	private	String	tdSubject	;
	private	String	tdOrder	;
	private	String	tdWorker	;
	private	String	tdOrderTime	;
	private	String	tdWorkSt	;
	private	String	tdProgressStatus	;
	private	String	tdEvent	;
	private	String	createdAt	;
	private	String	updatedAt	;
	 
    private String label;
    private RectanglePoints rectanglePoints;
    
    private String twStatusName;
     
    private	int	twPk;
    private	String	twProjectId;
    private	String	twCategory1;
    private	String	twCategory2;
    private	String	twSubject;
    private	String	twStatus;
    private	String	twRequestDate;
    private	String	twRequester;
    private	String	twWorker;
    private	String	twWorker2;
    private	String	twStartDate;
    private	String	twEndDate;
    private	String	twContent;
    private	String	twUpdatetime;
    
    private	int	flPk; 
    private	String	originalFilename;
    private	String	savedFilePath;
    private	String	flTable;
    private	int	flFilePk;
    

    private	String	twStartDateExp;
    private	String	twEndDateExp;
    
    private String tcUserId;
    
    private	int	chPk;
    private	String	chUserId;
    private	String	chPaPk;
    private	String	messageType;
    private	String	chMessage;
    private	String	coUpdatetime;
     
    private String mbName;
    
    private String tcCount;
    
    
    private String tcTwPk;
 
      
     
	public String getTcTwPk() {
		return tcTwPk;
	}
	public void setTcTwPk(String tcTwPk) {
		this.tcTwPk = tcTwPk;
	}
	public String getTcUserId() {
		return tcUserId;
	}
	public void setTcUserId(String tcUserId) {
		this.tcUserId = tcUserId;
	}
	public String getTcCount() {
		return tcCount;
	}
	public void setTcCount(String tcCount) {
		this.tcCount = tcCount;
	}
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getTwWorker2() {
		return twWorker2;
	}
	public void setTwWorker2(String twWorker2) {
		this.twWorker2 = twWorker2;
	}
	public int getChPk() {
		return chPk;
	}
	public void setChPk(int chPk) {
		this.chPk = chPk;
	}
	public String getChUserId() {
		return chUserId;
	}
	public void setChUserId(String chUserId) {
		this.chUserId = chUserId;
	}
	public String getChPaPk() {
		return chPaPk;
	}
	public void setChPaPk(String chPaPk) {
		this.chPaPk = chPaPk;
	}
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	public String getChMessage() {
		return chMessage;
	}
	public void setChMessage(String chMessage) {
		this.chMessage = chMessage;
	}
	public String getCoUpdatetime() {
		return coUpdatetime;
	}
	public void setCoUpdatetime(String coUpdatetime) {
		this.coUpdatetime = coUpdatetime;
	}
	public String getTwStatusName() {
		return twStatusName;
	}
	public void setTwStatusName(String twStatusName) {
		this.twStatusName = twStatusName;
	}
	public int getFlPk() {
		return flPk;
	}
	public void setFlPk(int flPk) {
		this.flPk = flPk;
	}

	/*
     * search
     */
    private String searchTwRequestDateSt;
    private String searchTwRequestDateEd;
    private String searchTwRequester;
    private String searchTwWorker;
    private String searchTwStatus;
    
    
    
    public String getSearchTwStatus() {
		return searchTwStatus;
	}
	public void setSearchTwStatus(String searchTwStatus) {
		this.searchTwStatus = searchTwStatus;
	}

	private String searchDiv;
 
    
	public String getSearchDiv() {
		return searchDiv;
	}
	public void setSearchDiv(String searchDiv) {
		this.searchDiv = searchDiv;
	}
	public String getTwStartDateExp() {
		return twStartDateExp;
	}
	public void setTwStartDateExp(String twStartDateExp) {
		this.twStartDateExp = twStartDateExp;
	}
	public String getTwEndDateExp() {
		return twEndDateExp;
	}
	public void setTwEndDateExp(String twEndDateExp) {
		this.twEndDateExp = twEndDateExp;
	}
	public String getSearchTwWorker() {
		return searchTwWorker;
	}
	public void setSearchTwWorker(String searchTwWorker) {
		this.searchTwWorker = searchTwWorker;
	}
	public String getSearchTwRequester() {
		return searchTwRequester;
	}
	public void setSearchTwRequester(String searchTwRequester) {
		this.searchTwRequester = searchTwRequester;
	}
	public String getSearchTwRequestDateSt() {
		return searchTwRequestDateSt;
	}
	public void setSearchTwRequestDateSt(String searchTwRequestDateSt) {
		this.searchTwRequestDateSt = searchTwRequestDateSt;
	}
	public String getSearchTwRequestDateEd() {
		return searchTwRequestDateEd;
	}
	public void setSearchTwRequestDateEd(String searchTwRequestDateEd) {
		this.searchTwRequestDateEd = searchTwRequestDateEd;
	}
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

	private  List<MultipartFile> file_test; 
     
	public List<MultipartFile> getFile_test() {
		return file_test;
	}
	public void setFile_test(List<MultipartFile> file_test) {
		this.file_test = file_test;
	}
	public String getTwUpdatetime() {
		return twUpdatetime;
	}
	public void setTwUpdatetime(String twUpdatetime) {
		this.twUpdatetime = twUpdatetime;
	}
	public String getTwContent() {
		return twContent;
	}
	public void setTwContent(String twContent) {
		this.twContent = twContent;
	}
	public int getTwPk() {
		return twPk;
	}
	public void setTwPk(int twPk) {
		this.twPk = twPk;
	}
	public String getTwProjectId() {
		return twProjectId;
	}
	public void setTwProjectId(String twProjectId) {
		this.twProjectId = twProjectId;
	}
	public String getTwCategory1() {
		return twCategory1;
	}
	public void setTwCategory1(String twCategory1) {
		this.twCategory1 = twCategory1;
	}
	public String getTwCategory2() {
		return twCategory2;
	}
	public void setTwCategory2(String twCategory2) {
		this.twCategory2 = twCategory2;
	}
	public String getTwSubject() {
		return twSubject;
	}
	public void setTwSubject(String twSubject) {
		this.twSubject = twSubject;
	}
	public String getTwStatus() {
		return twStatus;
	}
	public void setTwStatus(String twStatus) {
		this.twStatus = twStatus;
	}
	public String getTwRequestDate() {
		return twRequestDate;
	}
	public void setTwRequestDate(String twRequestDate) {
		this.twRequestDate = twRequestDate;
	}
	public String getTwRequester() {
		return twRequester;
	}
	public void setTwRequester(String twRequester) {
		this.twRequester = twRequester;
	}
	public String getTwWorker() {
		return twWorker;
	}
	public void setTwWorker(String twWorker) {
		this.twWorker = twWorker;
	}
	public String getTwStartDate() {
		return twStartDate;
	}
	public void setTwStartDate(String twStartDate) {
		this.twStartDate = twStartDate;
	}
	public String getTwEndDate() {
		return twEndDate;
	}
	public void setTwEndDate(String twEndDate) {
		this.twEndDate = twEndDate;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public RectanglePoints getRectanglePoints() {
		return rectanglePoints;
	}
	public void setRectanglePoints(RectanglePoints rectanglePoints) {
		this.rectanglePoints = rectanglePoints;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}
	public int getTdNum() {
		return tdNum;
	}
	public void setTdNum(int tdNum) {
		this.tdNum = tdNum;
	}
	public String getTdClassification() {
		return tdClassification;
	}
	public void setTdClassification(String tdClassification) {
		this.tdClassification = tdClassification;
	}
	public String getTdService() {
		return tdService;
	}
	public void setTdService(String tdService) {
		this.tdService = tdService;
	}
	public String getTdSubject() {
		return tdSubject;
	}
	public void setTdSubject(String tdSubject) {
		this.tdSubject = tdSubject;
	}
	public String getTdOrder() {
		return tdOrder;
	}
	public void setTdOrder(String tdOrder) {
		this.tdOrder = tdOrder;
	}
	public String getTdWorker() {
		return tdWorker;
	}
	public void setTdWorker(String tdWorker) {
		this.tdWorker = tdWorker;
	}
	public String getTdOrderTime() {
		return tdOrderTime;
	}
	public void setTdOrderTime(String tdOrderTime) {
		this.tdOrderTime = tdOrderTime;
	}
	public String getTdWorkSt() {
		return tdWorkSt;
	}
	public void setTdWorkSt(String tdWorkSt) {
		this.tdWorkSt = tdWorkSt;
	}
	public String getTdProgressStatus() {
		return tdProgressStatus;
	}
	public void setTdProgressStatus(String tdProgressStatus) {
		this.tdProgressStatus = tdProgressStatus;
	}
	public String getTdEvent() {
		return tdEvent;
	}
	public void setTdEvent(String tdEvent) {
		this.tdEvent = tdEvent;
	}

	/*
	 * page start
	 */
	/** 정렬순서(DESC,ASC) */
    private long sortOrdr = 0L;

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 5;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

	/*
	 * page end
	 */


	public long getSortOrdr() {
		return sortOrdr;
	}
	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
	}
	public String getSearchUseYn() {
		return searchUseYn;
	}
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
    
    
      
      
}
