package com.rfics.bus.rolemenu.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class RolesMenusMap {

    @Getter
    @Setter
    private int roleMenuNo;

    @Getter
    @Setter
    private int roleNo;

    @Getter
    @Setter
    private int menuNo;

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
