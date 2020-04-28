package com.rfics.bus.organ.mapper;

import com.rfics.bus.organ.entity.Organs;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.List;

@Mapper
public interface OrgansMapper {

    // 添加记录，按主键
    int insert(Organs organs) throws DataAccessException;
    // 删除记录，按主键
    int delete(int organNo) throws DataAccessException;
    // 修改记录，按主键
    int update(Organs organs) throws DataAccessException;
    // 查询所有记录
    List<Organs> getAll();
    // 查询一条记录，按主键
    Organs getOne(int organNo) throws DataAccessException;
    // 查询所有记录总数
    int getCount();
    // 按条件查询记录
    List<Organs> getByCriteria(Organs organs) throws DataAccessException;
}
