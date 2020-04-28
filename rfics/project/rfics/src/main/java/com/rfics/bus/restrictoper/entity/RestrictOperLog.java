package com.rfics.bus.restrictoper.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class RestrictOperLog {

    @Getter
    @Setter
    private int operNo;

    @Getter
    @Setter
    private String operCommand;

    @Getter
    @Setter
    private String checkFlag;

    @Getter
    @Setter
    private String createTime;

    @Getter
    @Setter
    private String updateTime;

    @Getter
    @Setter
    private String remark;

    @Getter
    @Setter
    private int restrictNo;

    @Getter
    @Setter
    private int vehNo;

    @Getter
    @Setter
    private int userNo;

    @Getter
    @Setter
    private String operCommandDesc;
}
