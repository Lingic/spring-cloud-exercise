package com.rfics.bus.user.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rfics.bus.user.entity.Users;
import com.rfics.bus.user.mapper.UsersMapper;
import com.rfics.unit.ContantMode;
import com.rfics.unit.ResponseMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@CrossOrigin
@RestController
public class UsersController {

    @Autowired
    private UsersMapper usersMapper;

    @PostMapping(value = "/api/users", produces = "application/json;charset=UTF-8")
    public ResponseMessage insertUsers(@RequestBody Users users) {
        Date now = new Date();
        if (StringUtils.isEmpty(users.getCreateTime())) {
            users.setCreateTime(now);
        }
        if (StringUtils.isEmpty(users.getUpdateTime())) {
            users.setUpdateTime(now);
        }

        ResponseMessage message = new ResponseMessage();

        try {
            usersMapper.insert(users);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (DataAccessException e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111111");
            message.setResultError("insert users failure.");
        }

        Map<String, Object> map = new HashMap<>();
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @DeleteMapping(value = "/api/users")
    public ResponseMessage deleteUsersById(@RequestParam int userNo) {
        ResponseMessage message = new ResponseMessage();

        try {
            usersMapper.delete(userNo);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111112");
            message.setResultError("delete users failure.");
        }

        Map<String, Object> map = new HashMap<>();
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @PutMapping(value = "/api/users", produces = "application/json;charset=UTF-8")
    public ResponseMessage updateOrgansById(@RequestBody Users users) {
        ResponseMessage message = new ResponseMessage();

        try {
            usersMapper.update(users);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111113");
            message.setResultError("update users failure.");
        }

        Map<String, Object> map = new HashMap<>();
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @GetMapping(value = "/api/users")
    public ResponseMessage getUsersById(@RequestParam int userNo) {
        ResponseMessage message = new ResponseMessage();

        Users users = null;
        try {
            users = usersMapper.getOne(userNo);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111115");
            message.setResultError("query users by id failure.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("users", users);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @RequestMapping(value = "/api/usersByCriteria", produces = "application/json;charset=UTF-8")
    public ResponseMessage getUsersByCriteria(@RequestBody Users users) {
        ResponseMessage message = new ResponseMessage();

        PageInfo<Users> pageInfo = null;
        try {
            //pageNum: 表示第几页；pageSize: 表示一页展示的数据
            PageHelper.startPage(users.getPageNum(), users.getPageSize());
            List<Users> list = usersMapper.getByCriteria(users);
            pageInfo = new PageInfo<>(list, users.getPageNum());

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111114");
            message.setResultError("query users failure.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("pageInfo", pageInfo);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }
}
