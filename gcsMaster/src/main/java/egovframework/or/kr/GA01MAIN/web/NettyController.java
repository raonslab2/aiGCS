package egovframework.or.kr.GA01MAIN.web;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import egovframework.or.kr.GA01MAIN.service.GA01MAINService;

@Controller
public class NettyController {


	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "GA01MAINService")
	public GA01MAINService gA01MAINService;

    @PostConstruct
    private void start() {
        new Thread(new Runnable() {

            @Override
            public void run() {
                try {
                    //new NettySocketServer(5010,gA01MAINService).run();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }).start();
    }

    @PreDestroy
    private void destory() {

    }
}