package egovframework.or.kr.GA01MAIN.service;

public interface PushService {  
    /**  
     * Push to specified user  
     * @param userId  
     * @param msg  
     */  
    void pushMsgToOne(String userId,String msg);  
  
    /**  
     * Push to all users  
     * @param msg  
     */  
    void pushMsgToAll(String msg);  
}
