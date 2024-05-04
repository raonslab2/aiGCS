package egovframework.or.kr.GA01MAIN.web;

import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;

/**
* ClassName:Global
* Function: TODO ADD FUNCTION.
* @author fwz
*/
public class Global {
	public static ChannelGroup group = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
}