package com.netty.socket;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import lombok.extern.slf4j.Slf4j;
//import util.LogCore;

@Slf4j
public class TcpClientHandler extends SimpleChannelInboundHandler<Object> {
 
	@Override
	protected void channelRead0(ChannelHandlerContext ctx, Object msg) throws Exception {
		//LogCore.BASE.info("client接收到服务器返回的消息:" + msg);
		log.info("client接收到服务器返回的消息:" + msg);
		System.out.println("client接收到服务器返回的消息:" + msg);
	}
}
