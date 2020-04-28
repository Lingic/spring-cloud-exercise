package com.rfics.bus.user.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class Users {

    @Getter
    @Setter
    private int userNo;

    @Getter
    @Setter
    private String userName;

    @Getter
    @Setter
    private String loginUser;

    @Getter
    @Setter
    private String loginPwd;

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

    @Getter
    @Setter
    private int organNo;

    @Getter
    @Setter
    private int roleNo;

    // 表示第几页
    @Getter
    @Setter
    @Builder.Default
    private int pageNum = 1;

    // 表示一页展示的数据
    @Getter
    @Setter
    @Builder.Default
    private int pageSize = 10;
}
