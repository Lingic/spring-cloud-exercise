package com.rfics.bus.checkstationrestrect.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class CheckStationRestrectMap {

    @Getter
    @Setter
    private int checkStationNo;

    @Getter
    @Setter
    private int restrictNo;

    @Getter
    @Setter
    private int checkStationRestrictNo;

    @Getter
    @Setter
    private String direction;

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
