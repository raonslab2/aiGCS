/*
 * Copyright 2012 The Netty Project
 *
 * The Netty Project licenses this file to you under the Apache License,
 * version 2.0 (the "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at:
 *
 *   https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */
package egovframework.or.kr.GA01MAIN.web;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelId;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.DefaultFullHttpResponse;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.HttpResponseStatus;
import io.netty.handler.codec.http.HttpUtil;
import io.netty.handler.codec.http.HttpVersion;
import io.netty.handler.codec.http.websocketx.CloseWebSocketFrame;
import io.netty.handler.codec.http.websocketx.PingWebSocketFrame;
import io.netty.handler.codec.http.websocketx.PongWebSocketFrame;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketServerHandshaker;
import io.netty.handler.codec.http.websocketx.WebSocketServerHandshakerFactory;
import io.netty.util.AttributeKey;
import io.netty.util.CharsetUtil; 
 
import java.net.InetSocketAddress;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Echoes uppercase content of text frames.
 */
public class WebSocketFrameHandler extends SimpleChannelInboundHandler<WebSocketFrame> {
	private static final Logger logger = Logger.getLogger(WebSocketServerHandshaker.class.getName());
	private WebSocketServerHandshaker handshaker;
	
	//gcs
	private static HashMap<Channel,String> gcsMap = new HashMap<Channel,String>();
	
	//drone
	private static HashMap<String,Channel> droneMap = new HashMap<String,Channel>();
	 

	/**
	 * Channel channel action is active When the client actively connects to the
	 * server link, this channel is active. That is, the client and the server have
	 * established a communication channel and can transmit data
	 */
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		// Add to 
		Global.group.add(ctx.channel());
		gcsMap.remove(ctx.channel());
		System.out.println("The connection between the client and the server is opened:"
				+ ctx.channel().remoteAddress().toString());
	}

	/**
	 * channel Inactive When the client actively disconnects from the server, this
	 * channel is inactive. In other words, the client and server have closed the
	 * communication channel and cannot transmit data
	 */
	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		// Remove
		Global.group.remove(ctx.channel()); 
		System.out.println("The connection between the client and the server is closed:"
				+ ctx.channel().remoteAddress().toString());
	}

	/**
	 * Receive messages sent by the client channel channel Read In short, it reads
	 * data from the channel, that is, the server receives the data sent by the
	 * client. But this data is of type ByteBuf when it is not decoded
	 */
	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		// Traditional HTTP access
		if (msg instanceof FullHttpRequest) {
			handleHttpRequest(ctx, ((FullHttpRequest) msg));
			// WebSocket access
		} else if (msg instanceof WebSocketFrame) {
			//System.out.println(handshaker.uri());
			if ("anzhuo".equals(ctx.channel().attr(AttributeKey.valueOf("type")).get())) {
				handlerWebSocketFrame(ctx, (WebSocketFrame) msg);
			} else {
				handlerWebSocketFrame2(ctx, (WebSocketFrame) msg);
			}
		}
	}

	/**
	 * Channel channel Read Read Complete is completed After the channel read is
	 * completed, it will be notified in this method, and the corresponding refresh
	 * operation can be done ctx.flush()
	 */
	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
		ctx.flush();
	}

	private void handlerWebSocketFrame(ChannelHandlerContext ctx, WebSocketFrame frame) {
		// To determine whether to close the link
		if (frame instanceof CloseWebSocketFrame) {
			System.out.println(1);
			handshaker.close(ctx.channel(), (CloseWebSocketFrame) frame.retain());
			return;
		}
		// Determine whether to ping the message
		if (frame instanceof PingWebSocketFrame) {
			ctx.channel().write(new PongWebSocketFrame(frame.content().retain()));
			return;
		}
		// This example only supports text messages, not binary messages
		if (!(frame instanceof TextWebSocketFrame)) {
			System.out.println("This example only supports text messages, not binary messages");
			throw new UnsupportedOperationException(
					String.format("%s frame types not supported", frame.getClass().getName()));
		}
		// Reply message
		String request = ((TextWebSocketFrame) frame).text();
		System.out.println("The server receives:" + request);
		// if (logger.isLoggable(Level.FINE)) {
		// logger.fine(String.format("%s received %s", ctx.channel(), request));
		// }
		TextWebSocketFrame tws = new TextWebSocketFrame(request);
		// Group posting
		Global.group.writeAndFlush(tws);
		// Back [Who sent it to whom]
		// ctx.channel().writeAndFlush(tws);
	}

	private void handlerWebSocketFrame2(ChannelHandlerContext ctx, WebSocketFrame frame) {
		// To determine whether to close the link
		if (frame instanceof CloseWebSocketFrame) {
			handshaker.close(ctx.channel(), (CloseWebSocketFrame) frame.retain());
			return;
		}
		// Determine whether to ping the message
		if (frame instanceof PingWebSocketFrame) {
			ctx.channel().write(new PongWebSocketFrame(frame.content().retain()));
			return;
		}
		// This example only supports text messages, not binary messages
		if (!(frame instanceof TextWebSocketFrame)) {
			System.out.println("This example only supports text messages, not binary messages");
			
			throw new UnsupportedOperationException(
					String.format("%s frame types not supported", frame.getClass().getName()));
		}
		// Reply message
		String request = ((TextWebSocketFrame) frame).text(); 
		
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(request);
			String DATA_REQUEST =  (String)jsonObj.get("DATA_REQUEST"); 
			if(DATA_REQUEST!=null && DATA_REQUEST.equals("OPEN")) {
				gcsMap.put(ctx.channel(), "GCS");
			}else if(DATA_REQUEST!=null && DATA_REQUEST.equals("DRONE_STATE")) {
				//1초마다 넘어오는 데이터
				; 
			}else {
				/*
				DBConnection2 con = new DBConnection2();
				String ip = ((InetSocketAddress)ctx.channel().remoteAddress()).getAddress().getHostAddress();
				con.insertData(ip, request);
				con.close();
				*/
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println(request);
			//e.printStackTrace();
		}
		
		System.out.println("The server receives:" + request);

 
		
		// if (logger.isLoggable(Level.FINE)) {
		// logger.fine(String.format("%s received %s", ctx.channel(), request));
		// }
		TextWebSocketFrame tws = new TextWebSocketFrame(request);
		// Group posting
		 Global.group.writeAndFlush(tws);
		// Back [Who sent it to whom]
		// ctx.channel().writeAndFlush(tws);
		
		//gcs
	    
	    /*
		Iterator it = gcsMap.entrySet().iterator();
		Channel tempChannel;
	    while (it.hasNext()) {
	        Map.Entry<Channel,String> entry = (Map.Entry)it.next();
	        System.out.println(entry.getKey() + " = " + entry.getValue());
	        tempChannel = entry.getKey();
	        tempChannel.writeAndFlush(tws);
	 
	    }
	    */
	   
	 
		
	}

	private void handleHttpRequest(ChannelHandlerContext ctx, FullHttpRequest req) {
		// If HTTP decoding fails, return HHTP exception
		if (!req.decoderResult().isSuccess() || (!"websocket".equals(req.headers().get("Upgrade")))) {
			sendHttpResponse(ctx, req,
					new DefaultFullHttpResponse(HttpVersion.HTTP_1_1, HttpResponseStatus.BAD_REQUEST));
			return;
		}
		// Get URL post parameters
		String uri = req.uri();

		// Construct a handshake response and return, test on this machine
		WebSocketServerHandshakerFactory wsFactory = new WebSocketServerHandshakerFactory(
				"ws://localhost:8081/websocket", null, false);
		handshaker = wsFactory.newHandshaker(req);
		if (handshaker == null) {
			WebSocketServerHandshakerFactory.sendUnsupportedVersionResponse(ctx.channel());
		} else {
			handshaker.handshake(ctx.channel(), req);
		}
	}

	private static void sendHttpResponse(ChannelHandlerContext ctx, FullHttpRequest req, DefaultFullHttpResponse res) {
		// Return the response to the client
		if (res.status().code() != 200) {
			ByteBuf buf = Unpooled.copiedBuffer(res.status().toString(), CharsetUtil.UTF_8);
			assert buf.refCnt() == 1; 
			buf.retain();
			assert buf.refCnt() == 2;
			
			res.content().writeBytes(buf);
			
			boolean destroyed = buf.release();
			assert !destroyed;
			assert buf.refCnt() == 1;

		}
		// If it is not Keep-Alive, close the connection
		ChannelFuture f = ctx.channel().writeAndFlush(res);
		if (!HttpUtil.isKeepAlive(req) || res.status().code() != 200) {
			f.addListener(ChannelFutureListener.CLOSE);
		}
	}

	/**
	 * exception Caught Caught catch the exception, when an exception occurs, you
	 * can do some corresponding processing, such as printing the log, closing the
	 * link
	 */
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		cause.printStackTrace();
		ctx.close();
	}

	@Override
	protected void channelRead0(ChannelHandlerContext ctx, WebSocketFrame frame) throws Exception {
		// ping and pong frames already handled

		if (frame instanceof TextWebSocketFrame) {
			// Send the uppercase string back.
			String request = ((TextWebSocketFrame) frame).text();
			ctx.channel().writeAndFlush(new TextWebSocketFrame(request.toUpperCase(Locale.US)));
		} else {
			String message = "unsupported frame type: " + frame.getClass().getName();
			throw new UnsupportedOperationException(message);
		}
	}

}
