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
import org.springframework.web.bind.annotation.*;

import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@CrossOrigin
@RestController
@RequestMapping(value = "/organs")
public class OrgansController {

    @Autowired
    private OrgansMapper organsMapper;

    @RequestMapping(value = "/insert")
    public int insert(){
        SecureRandom random = new SecureRandom();
        Date now = new Date();
        Organs organs = new Organs();
        organs.setOrganNo(random.nextInt(999999));
        organs.setOrganName("株洲市碌口区公路局");
        organs.setOrganDesc("");
        organs.setCheckFlag("");
        organs.setCreateTime(now);
        organs.setUpdateTime(now);
        organs.setRemark("");
        System.out.println(organs.toString());
        log.info(organs.toString());
        return organsMapper.insert(organs);
    }

    @RequestMapping(value = "/delete")
    public int delete() {
        System.out.println("delete");
        log.info("delete");
        return organsMapper.delete(3);
    }

    @RequestMapping(value = "/update", produces = "application/json;charset=UTF-8")
    public int update() {
        Organs organs = new Organs();
        organs.setOrganNo(5);
        organs.setOrganName("株洲市芦淞区公路局");
        organs.setOrganDesc("株洲市芦淞区公路局");
        organs.setCheckFlag("0");
        organs.setUpdateTime(new Date());
        organs.setRemark("株洲市芦淞区公路局");
        System.out.println(organs.toString());
        log.info(organs.toString());
        return organsMapper.update(organs);
    }

    @RequestMapping(value = "/getAll")
    public List<Organs> getAll() {
        log.info(organsMapper.getAll().toString());
        return organsMapper.getAll();
    }

    @RequestMapping(value = "/getListPage")
    public List<Organs> getListPage(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                      @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        //pageNum: 表示第几页；pageSize: 表示一页展示的数据
        PageHelper.startPage(pageNum, pageSize);
        List<Organs> list = organsMapper.getAll();
        PageInfo<Organs> pageInfo = new PageInfo<>(list, pageNum);
        log.info(pageInfo.toString());
        log.info(list.toString());
        return list;
    }

    @RequestMapping(value = "/getListPage2")
    public PageInfo<Organs> getListPage2(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                      @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        //PageHelper.clearPage();
        PageInfo<Organs> pageInfo = PageHelper.startPage(pageNum, pageSize).doSelectPageInfo(() -> organsMapper.getAll());
        //PageHelper.offsetPage();
        return pageInfo;
    }

    @RequestMapping(value = "/getListPage3")
    public PageInfo<Organs> getListPage3(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                    @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        //pageNum: 表示第几页；pageSize: 表示一页展示的数据
        PageHelper.startPage(pageNum, pageSize);
        List<Organs> list = organsMapper.getAll();
        PageInfo<Organs> pageInfo = new PageInfo<>(list, pageNum);
        //log.info(pageInfo.toString());
        //log.info(list.toString());
        return pageInfo;
    }

    @RequestMapping(value = "/getOne")
    public Organs getOne() {
        System.out.println("getOne");
        log.info("getOne");
        return organsMapper.getOne(5);
    }

    @RequestMapping(value = "/getCount")
    public int getCount() {
        System.out.println("getCount");
        log.info("getCount");
        return organsMapper.getCount();
    }

    @RequestMapping(value = "/getByCriteria")
    public PageInfo<Organs> getByCriteria(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        Organs organs = new Organs();
        organs.setOrganName("碌口区");

        //pageNum: 表示第几页；pageSize: 表示一页展示的数据
        PageHelper.startPage(pageNum, pageSize);
        List<Organs> list = organsMapper.getByCriteria(organs);
        PageInfo<Organs> pageInfo = new PageInfo<>(list, pageNum);
        return pageInfo;
    }

    // ----------=========================================================-----------

    @PostMapping(value = "/insertOrgans", produces = "application/json;charset=UTF-8")
    public ResponseMessage insertOrgans(@RequestBody Organs organs) {
        ResponseMessage message = new ResponseMessage();

        Date now = new Date();
        if (organs.getCreateTime() == null || organs.getCreateTime().equals("")) {
            organs.setCreateTime(now);
        }
        if (organs.getUpdateTime() == null || organs.getUpdateTime().equals("")) {
            organs.setUpdateTime(now);
        }

        int i = 0;
        try {
            i = organsMapper.insert(organs);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (DataAccessException e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111111");
            message.setResultError("insert organs failure.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("organ", organs);
        map.put("insertResult", i);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @RequestMapping(value = "/deleteOrgansById")
    public ResponseMessage deleteOrgansById(@RequestParam int organNo) {
        ResponseMessage message = new ResponseMessage();

        int i = 0;
        try {
            i = organsMapper.delete(organNo);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111112");
            message.setResultError("delete organs failure.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("organNo", organNo);
        map.put("deleteResult", i);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @RequestMapping(value = "/updateOrgansById")
    public ResponseMessage updateOrgansById(@RequestBody Organs organs) {
        ResponseMessage message = new ResponseMessage();

        int i = 0;
        try {
            i = organsMapper.update(organs);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111113");
            message.setResultError("update organs failure.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("organs", organs);
        map.put("updateResult", i);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @RequestMapping(value = "/getOrgansByCriteria", produces = "application/json;charset=UTF-8")
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
        map.put("organs", organs);
        map.put("pageInfo", pageInfo);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }

    @RequestMapping(value = "/getOrgansById")
    public ResponseMessage getOrgansById(@RequestParam int organNo) {
        ResponseMessage message = new ResponseMessage();

        Organs organsResult = null;
        try {
            organsResult = organsMapper.getOne(organNo);

            message.setResultCode(ContantMode.SUCCESS);
            message.setResultError(ContantMode.SUCCESS_TEXT);
        } catch (Exception e) {
            log.info(ContantMode.ERROR, e);

            message.setResultCode("111115");
            message.setResultError("query organs by id failure.");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("organNo", organNo);
        map.put("organsResult", organsResult);
        message.setResultMap(map);
        log.info(message.toString());
        return message;
    }
}
