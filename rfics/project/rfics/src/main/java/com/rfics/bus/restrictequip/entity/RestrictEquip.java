package com.rfics.bus.restrictequip.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class RestrictEquip {

    @Getter
    @Setter
    private int restrictNo;

    @Getter
    @Setter
    private String restrictName;

    @Getter
    @Setter
    private String restrictStationNo;

    @Getter
    @Setter
    private String restrictStationName;

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
