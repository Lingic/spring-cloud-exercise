package com.rfics.bus.writelist.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class WriteList {

    @Getter
    @Setter
    private int writeListNo;

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
