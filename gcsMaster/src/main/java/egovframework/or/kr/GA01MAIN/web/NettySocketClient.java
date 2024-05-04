package egovframework.or.kr.GA01MAIN.web;

import java.net.URI;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.or.kr.EMAU00A.service.DashboardVO;
import egovframework.or.kr.GA01MAIN.service.GA01MAINService;
import egovframework.or.kr.GA01MAIN.service.GA01MAINVO;
import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.http.DefaultHttpHeaders;
import io.netty.handler.codec.http.HttpClientCodec;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketClientHandshakerFactory;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketVersion;
import io.netty.handler.codec.http.websocketx.extensions.compression.WebSocketClientCompressionHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class NettySocketClient {
    private int port; 
    private GA01MAINService gA01MAINService;
    public NettySocketClient(GA01MAINService gA01MAINService,int port) {
    	this.gA01MAINService = gA01MAINService;
        this.port = port;
    }
    private static final Logger LOGGER = LoggerFactory.getLogger(NettySocketClient.class);
    public void run() throws Exception {
    	//String URL = System.getProperty("url", "ws://127.0.0.1:5010/websocket");
    	String URL = System.getProperty("url", "ws://127.0.0.1:5010/websocket");
    	
    	URI uri = new URI(URL);
        String scheme = uri.getScheme() == null? "ws" : uri.getScheme();
        final String host = uri.getHost() == null? "127.0.0.1" : uri.getHost();
        if (uri.getPort() == -1) {
            if ("ws".equalsIgnoreCase(scheme)) {
                port = 80;
            } else if ("wss".equalsIgnoreCase(scheme)) {
                port = 443;
            } else {
                port = -1;
            }
        } else {
            port = uri.getPort();
        }
        
        if (!"ws".equalsIgnoreCase(scheme) && !"wss".equalsIgnoreCase(scheme)) {
            System.err.println("Only WS(S) is supported.");
            return;
        }
        
        EventLoopGroup group = new NioEventLoopGroup();
        try {
            // Connect with V13 (RFC 6455 aka HyBi-17). You can change it to V08 or V00.
            // If you change it to V00, ping is not supported and remember to change
            // HttpResponseDecoder to WebSocketHttpResponseDecoder in the pipeline.
            final WebSocketClientHandler handler =
                    new WebSocketClientHandler(
                            WebSocketClientHandshakerFactory.newHandshaker(
                                    uri, WebSocketVersion.V13, null, true, new DefaultHttpHeaders()));

            Bootstrap b = new Bootstrap();
            b.group(group)
             .channel(NioSocketChannel.class)
             .handler(new ChannelInitializer<SocketChannel>() {
                 @Override
                 protected void initChannel(SocketChannel ch) {
                     ChannelPipeline p = ch.pipeline();
                     p.addLast(
                             new HttpClientCodec(),
                             new HttpObjectAggregator(8192),
                             WebSocketClientCompressionHandler.INSTANCE,
                             handler);
                 }
             });

            Channel ch = b.connect(uri.getHost(), port).sync().channel();
            handler.handshakeFuture().sync();
            
    
            
            //BufferedReader console = new BufferedReader(new InputStreamReader(System.in));
     
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("DATA_GUBUN", "DRONE_STATE");
			jsonObject.put("DATA_REQUEST", "DRONE_STATE");
			
			JSONObject jsonObj1;
			Map<String, Object> param = null;
			List<GA01MAINVO> list = null;
            while (true) {
                //String msg = console.readLine();
            	list = gA01MAINService.selectDrone(param);
              	 int si = 0;
              	 JSONArray jsonArr1 = new JSONArray(); 
            	for(GA01MAINVO gA01MAINVO : list) {
            		
      				jsonObj1 = new JSONObject();
   	   				jsonObj1.put("dl_idx", si);
   	   				jsonObj1.put("dl_id", gA01MAINVO.getDlId());
   	   				jsonObj1.put("dl_name", gA01MAINVO.getDlName());
   	   				jsonObj1.put("st_satelite_num", gA01MAINVO.getStSateliteNum());
   	   				jsonObj1.put("st_bat_voltage", gA01MAINVO.getStBatVoltage());
   	   				jsonObj1.put("st_bat_level", gA01MAINVO.getStBatLevel());
   	   				jsonObj1.put("st_speed", gA01MAINVO.getStSpeed());
   	   				jsonObj1.put("st_x", gA01MAINVO.getStXa());
   	   				jsonObj1.put("st_y", gA01MAINVO.getStYa());
   	   				jsonObj1.put("st_atitude", gA01MAINVO.getStAtitude());
   	   				 
   	   				jsonArr1.add(jsonObj1); 
   	   				
   	   				si++;
            	}
            	
  	   			 if(jsonArr1!=null && jsonArr1.size()>0) {
    	 	   			jsonObject.put("DATA_STATE", jsonArr1);
    		   			
    	            	String msg = jsonObject.toString();
    	                WebSocketFrame frame = new TextWebSocketFrame(msg);
    	                ch.writeAndFlush(frame);
    	   			 }
            	 

                Thread.sleep(2000);
            } 
        } finally {
            group.shutdownGracefully();
            
        }
    }
}