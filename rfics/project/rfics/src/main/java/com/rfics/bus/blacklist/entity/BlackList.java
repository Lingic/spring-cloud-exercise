package com.rfics.bus.blacklist.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class BlackList {

    @Getter
    @Setter
    private int blackListNo;

    @Getter
    @Setter
    private int vehNo;

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
