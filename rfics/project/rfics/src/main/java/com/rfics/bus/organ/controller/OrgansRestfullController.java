package com.rfics.bus.organ.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rfics.bus.organ.entity.Organs;
import com.rfics.bus.organ.mapper.OrgansMapper;
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
public class OrgansRestfullController {

    @Autowired
    private OrgansMapper organsMapper;

    @PostMapping(value = "/api/organs", produces = "application/json;charset=UTF-8")
    public ResponseMessage insertOrgans(@RequestBody Organs organs) {
        Date now = new Date();
        if (StringUtils.isEmpty(organs.getCreateTime())) {
            organs.setCreateTime(now);
        }
        if (StringUtils.isEmpty(organs.getUpdateTime())) {
            organs.setUpdateTime(now);
        }

        ResponseMessage message = new ResponseMessage();

        try {
            organsMapper.insert(organs);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (DataAccessException e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111111");
            message.setResultError("insert organs failure.");
        }

        Map<String, Object> map = new HashMap<>();
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @DeleteMapping(value = "/api/organs")
    public ResponseMessage deleteOrgansById(@RequestParam int organNo) {
        ResponseMessage message = new ResponseMessage();

        try {
            organsMapper.delete(organNo);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111112");
            message.setResultError("delete organs failure.");
        }

        Map<String, Object> map = new HashMap<>();
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @PutMapping(value = "/api/organs", produces = "application/json;charset=UTF-8")
    public ResponseMessage updateOrgansById(@RequestBody Organs organs) {
        ResponseMessage message = new ResponseMessage();

        try {
            organsMapper.update(organs);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111113");
            message.setResultError("update organs failure.");
        }

        Map<String, Object> map = new HashMap<>();
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @GetMapping(value = "/api/organs")
    public ResponseMessage getOrgansById(@RequestParam int organNo) {
        ResponseMessage message = new ResponseMessage();

        Organs organs = null;
        try {
            organs = organsMapper.getOne(organNo);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111115");
            message.setResultError("query organs by id failure.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("organs", organs);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @RequestMapping(value = "/api/organsByCriteria", produces = "application/json;charset=UTF-8")
    // @PostMapping(value = "/getOrgansByCriteria", produces = "application/json;charset=UTF-8")
    public ResponseMessage getOrgansByCriteria(@RequestBody Organs organs) {
        ResponseMessage message = new ResponseMessage();

        PageInfo<Organs> pageInfo = null;
        try {
            //pageNum: 表示第几页；pageSize: 表示一页展示的数据
            PageHelper.startPage(organs.getPageNum(), organs.getPageSize());
            List<Organs> list = organsMapper.getByCriteria(organs);
            pageInfo = new PageInfo<>(list, organs.getPageNum());

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111114");
            message.setResultError("query organs failure.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("pageInfo", pageInfo);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @RequestMapping(value = "/api/getOrgansLevel", produces = "application/json;charset=UTF-8")
    // @PostMapping(value = "/getOrgansByCriteria", produces = "application/json;charset=UTF-8")
    public ResponseMessage getOrgansLevel(@RequestBody Organs organs) {
        ResponseMessage message = new ResponseMessage();

        List<Organs> list = null;
        try {
            list = organsMapper.getByCriteria(organs);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111115");
            message.setResultError("query organs failure.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }


    //private
    /*List<Organs> list1 = new ArrayList<>();
            if (!CollectionUtils.isEmpty(list)) {
                Iterator<Organs> iter = list.iterator();
                while (iter.hasNext()) {
                    Organs organs1 = iter.next();

                    if (organs1.getParentNo() == -1) {
                        list1.add(organs1);
                    } else {

                    }
                }
            }*/
}
