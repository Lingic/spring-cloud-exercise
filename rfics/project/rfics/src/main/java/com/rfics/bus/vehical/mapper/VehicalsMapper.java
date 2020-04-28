package com.rfics.bus.vehical.mapper;

import com.rfics.bus.organ.entity.Organs;
import com.rfics.bus.vehical.entity.Vehicals;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VehicalsMapper {

    // 添加记录，按主键
    int insert(Vehicals vehicals);
    // 删除记录，按主键
    int delete(int vehNo);
    // 修改记录，按主键
    int update(Vehicals vehicals);
    // 查询所有记录
    List<Vehicals> getAll();
    // 查询一条记录，按主键
    Vehicals getOne(int vehNo);
    // 按条件查询记录
    List<Vehicals> getByCriteria(Vehicals vehicals);
}
