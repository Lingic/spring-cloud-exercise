package com.rfics.bus.organ.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
public class Organs {

    @Getter
    @Setter
    private int organNo;

    @Getter
    @Setter
    private String organName;

    @Getter
    @Setter
    private int parentNo;

    @Getter
    @Setter
    private String organDesc;

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
