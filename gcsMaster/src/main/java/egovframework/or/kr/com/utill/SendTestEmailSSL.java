package egovframework.or.kr.com.utill;

public class SendTestEmailSSL {

    public static void main(String[] args) {
    	
    	MailVO mailVO = new MailVO();
    	mailVO.setSendMail("tipasepm@gmail.com");
    	
    	mailVO.setReceiveMail("minbyungan@gmail.com");
    	mailVO.setTitle("[TIPA] 회원 비밀번호 재설정 인증번호 발송");
    	
    	String sendTxt ="요청하신 이메일 인증 번호는,\r\n" + 
    			"\r\n" + 
    			" 요청하신 이메일 인증번호는 182057 입니다.\r\n" + 
    			"\r\n" + 
    			" 인증번호 입력시 정상적으로 이메일이 인증되며, 비밀번호를 변경하셔야 합니다.\r\n" + 
    			"\r\n" + 
    			" 정보보호에 각별히 유념하여 주시기 바랍니다.";
    	mailVO.setTxt(sendTxt);
    	
    	
    	
    	boolean result = CommUtil.sendMail(mailVO);
    	
    	System.out.println("send result "+result);
    } 
}