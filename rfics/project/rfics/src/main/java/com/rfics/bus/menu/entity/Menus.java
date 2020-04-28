package com.rfics.bus.menu.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class Menus {

    @Getter
    @Setter
    private int menuNo;

    @Getter
    @Setter
    private String menuName;

    @Getter
    @Setter
    private String menuHref;

    @Getter
    @Setter
    private int parentNo;

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
