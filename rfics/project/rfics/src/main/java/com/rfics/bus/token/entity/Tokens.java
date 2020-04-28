package com.rfics.bus.token.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class Tokens {

    @Getter
    @Setter
    private int tokenNo;

    @Getter
    @Setter
    private String token;

    @Getter
    @Setter
    private String loginUser;

    @Getter
    @Setter
    private String checkFlag;

    @Getter
    @Setter
    private Date createTime;

    @Getter
    @Setter
    private Date updateTime;

    @Getter
    @Setter
    private String remark;
}
