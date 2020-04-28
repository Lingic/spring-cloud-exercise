package com.rfics.bus.vehical.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class Vehicals {

    @Getter
    @Setter
    private int vehNo;

    @Getter
    @Setter
    private String previewCheckNo;

    @Getter
    @Setter
    private Date checkTime;

    @Getter
    @Setter
    private int checkStationNo;

    @Getter
    @Setter
    private String truckNo;

    @Getter
    @Setter
    private String axisNum;

    @Getter
    @Setter
    private String speed;

    @Getter
    @Setter
    private String totalWeight;

    @Getter
    @Setter
    private String overLimited;

    @Getter
    @Setter
    private String overRate;

    @Getter
    @Setter
    private String weightLimited;

    @Getter
    @Setter
    private String direction;

    @Getter
    @Setter
    private String length;

    @Getter
    @Setter
    private String width;

    @Getter
    @Setter
    private String height;

    @Getter
    @Setter
    private String overLength;

    @Getter
    @Setter
    private String overWidth;

    @Getter
    @Setter
    private String overHeight;

    @Getter
    @Setter
    private String orgCode;

    @Getter
    @Setter
    private String trafficDirection;

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
