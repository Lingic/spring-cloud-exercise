package com.rfics.bus.checkstation.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class CheckStation {

    @Getter
    @Setter
    private int checkStationNo;

    @Getter
    @Setter
    private String checkStationName;

    @Getter
    @Setter
    private String belongRegion;

    @Getter
    @Setter
    private String belongTrafficLine;

    @Getter
    @Setter
    private String checkFlag;

    @Getter
    @Setter
    private Date createTime;

    @Getter
    @Setter
    private Date updateTime;
}
