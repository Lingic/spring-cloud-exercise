package com.rfics;

import io.netty.bootstrap.ServerBootstrap;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class RficsApplication {

	public static void main(String[] args) {
		SpringApplication.run(RficsApplication.class, args);
	}

	public static void init() {
		ServerBootstrap bootstrap = new ServerBootstrap();
		//bootstrap.group(b)
	}
}
