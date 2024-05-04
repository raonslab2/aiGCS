package egovframework.or.kr.com.utill;

import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class CommUtil {
    public static EgovMap makeEgovMap(Map commandMap)
    {
		EgovMap tmMap = new EgovMap();
		Iterator<String> iterator = commandMap.keySet().iterator();
		while(iterator.hasNext()) {
			String key = (String) iterator.next();
			tmMap.put(key, commandMap.get(key));
		}
    	
    	return tmMap;
    }
    
    public static String getValue(EgovMap map,String key,String defVal) {
    	String val = (String)map.get(key);
    	if(val ==null || val.equals("")) {
    		return defVal;
    	}else {
    		return val;
    	} 
    }
    
    public static boolean sendMail(MailVO vo) {

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        //return new PasswordAuthentication(vo.getSendMail(), vo.getPassword());
                    	return new PasswordAuthentication(vo.getSendMail(), "rkdltmxm1");
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(vo.getSendMail()));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(vo.getReceiveMail())
            );
            message.setSubject("[TIPA] 회원 비밀번호 재설정 인증번호 발송");
            message.setText("요청하신 이메일 인증 번호는,"
                    + "\n\n 요청하신 이메일 인증번호는"+"<h1> "+" 182057"+" "+" 입니다."
                    + "\n\n 인증번호 입력시 정상적으로 이메일이 인증되며, 비밀번호를 변경하셔야 합니다."
                    + "\n\n 정보보호에 각별히 유념하여 주시기 바랍니다."
            		);

            Transport.send(message);
 

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return true;
    }
     
}

