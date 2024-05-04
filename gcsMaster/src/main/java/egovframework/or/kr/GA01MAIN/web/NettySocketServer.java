package egovframework.or.kr.GA01MAIN.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.or.kr.GA01MAIN.service.GA01MAINService;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;

public class NettySocketServer {
    private int port;
    private GA01MAINService gA01MAINService;
    private static final Logger LOGGER = LoggerFactory.getLogger(NettySocketServer.class);
    public NettySocketServer(int port,GA01MAINService gA01MAINService) {
        this.port = port;
        this.gA01MAINService = gA01MAINService;
    }
    
	

    public void run() {
    	
        EventLoopGroup bossGroup = new NioEventLoopGroup(1);
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        try {
            ServerBootstrap b = new ServerBootstrap();
            b.group(bossGroup, workerGroup)
             .channel(NioServerSocketChannel.class)
             .handler(new LoggingHandler(LogLevel.INFO))
             .childHandler(new WebSocketServerInitializer());

            Channel ch = b.bind(port).sync().channel();

            System.out.println("Open http://127.0.0.1:" + port + '/');
            /*
            new Thread(new Runnable() {

                @Override
                public void run() {
                    try { 
                        Thread.sleep(5000); 
                        System.out.println("Open client start");
                         new NettySocketClient(gA01MAINService,5010).run();
                    }catch (Exception e) {
                        e.printStackTrace();
                    }
                }

            }).start();
            */

            ch.closeFuture().sync();
        } catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
            bossGroup.shutdownGracefully();
            workerGroup.shutdownGracefully();
        } 
    }
}