package com.rfics.bus.user.mapper;

import com.rfics.bus.user.entity.Users;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.List;

@Mapper
public interface UsersMapper {

    // 添加记录，按主键
    int insert(Users users) throws DataAccessException;
    // 删除记录，按主键
    int delete(int userNo) throws DataAccessException;
    // 修改记录，按主键
    int update(Users users) throws DataAccessException;
    // 查询所有记录
    List<Users> getAll();
    // 查询一条记录，按主键
    Users getOne(int userNo) throws DataAccessException;
    // 按条件查询记录
    List<Users> getByCriteria(Users users) throws DataAccessException;
}
