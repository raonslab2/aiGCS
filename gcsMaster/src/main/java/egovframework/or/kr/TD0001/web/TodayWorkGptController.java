package egovframework.or.kr.TD0001.web;

import javax.annotation.Resource;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.or.kr.TD0001.service.TodayWork100Service;
import egovframework.or.kr.TD0001.service.UserService;

/**
 * GCS 관제 시스템
 * 
 * @author 실행환경 개발팀 SSD SCJ
 * @since 2024.02.10
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.02.10  min            First Create
 *
 *      </pre>
 */

@Controller
@SessionAttributes(types = ComDefaultVO.class)
public class TodayWorkGptController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(TodayWorkGptController.class);
	
	/**
	 * GA03MAINService
	 */
	@Resource(name = "TodayWork100Service")
    private TodayWork100Service todayWork100Service;
	
	/**
	 * UserService
	 */
	@Resource(name = "UserService")
    private UserService userService;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	  
    public static void main(String[] args) {
        HttpClient httpClient = HttpClients.createDefault();

        try {
            HttpPost request = new HttpPost("https://api.openai.com/v1/chat/completions");
            request.setHeader("Content-Type", "application/json");
            request.setHeader("Authorization", "Bearer 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"); // Replace YOUR_API_KEY with your actual API key

            //String requestData = "{\"prompt\": \"Once upon a time\", \"max_tokens\": 50}"; 
            String requestData = "{\r\n"
            		+ "  \"model\": \"gpt-3.5-turbo-0125\",\r\n"
            		+ "  \"messages\": [\r\n"
            		+ "    {\r\n"
            		+ "      \"role\": \"user\",\r\n"
            		+ "      \"content\": \"너 나이가 몇이니.?.\"\r\n"
            		+ "    }\r\n"
            		+ "  ]\r\n"
            		+ "}" ;
       
            StringEntity entity = new StringEntity(requestData);
            request.setEntity(entity);

            HttpResponse response = httpClient.execute(request);
            String responseBody = EntityUtils.toString(response.getEntity());

            System.out.println(responseBody);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
}
