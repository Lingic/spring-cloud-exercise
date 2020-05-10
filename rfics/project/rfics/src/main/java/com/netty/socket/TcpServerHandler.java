package com.netty.socket;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import lombok.extern.slf4j.Slf4j;
//import util.LogCore;

@Slf4j
public class TcpServerHandler extends SimpleChannelInboundHandler<Object> {
 
	@Override
	protected void channelRead0(ChannelHandlerContext ctx, Object msg) throws Exception {
		//LogCore.BASE.info("SERVER接收到消息:" + msg);
		log.info("SERVER接收到消息:" + msg);
		System.out.println("SERVER接收到消息:" + msg);
		ctx.channel().writeAndFlush("server accepted msg:" + msg);
	}
 
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		//LogCore.BASE.warn("exceptionCaught!", cause);
		log.warn("exceptionCaught!", cause);
		System.out.println("exceptionCaught!" + cause);
		ctx.close();
	}
}
