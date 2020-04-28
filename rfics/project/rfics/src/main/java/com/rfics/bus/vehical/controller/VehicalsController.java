package com.rfics.bus.vehical.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rfics.bus.vehical.entity.Vehicals;
import com.rfics.bus.vehical.mapper.VehicalsMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@Slf4j
@RestController
@RequestMapping(value = "/vehicals")
public class VehicalsController {

    @Autowired
    private VehicalsMapper vehicalsMapper;

    @RequestMapping(value = "/insert")
    public int insert(){
        Date now = new Date();
        Vehicals vehicals = new Vehicals();
        vehicals.setCheckFlag("0");
        vehicals.setCreateTime(now);
        vehicals.setUpdateTime(now);
        vehicals.setRemark("车辆");
        return vehicalsMapper.insert(vehicals);
    }

    @RequestMapping(value = "/delete")
    public int delete(@RequestParam int vehNo) {
        return vehicalsMapper.delete(vehNo);
    }

    @RequestMapping(value = "/update")
    public int update(@RequestParam int vehNo) {
        Vehicals vehicals = new Vehicals();
        vehicals.setVehNo(vehNo);
        vehicals.setTruckNo("湘A 88888");
        vehicals.setUpdateTime(new Date());
        return vehicalsMapper.update(vehicals);
    }

    @RequestMapping(value = "/getAll")
    public PageInfo<Vehicals> getAll(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        //pageNum: 表示第几页；pageSize: 表示一页展示的数据
        PageHelper.startPage(pageNum, pageSize);
        List<Vehicals> list = vehicalsMapper.getAll();
        PageInfo<Vehicals> pageInfo = new PageInfo<>(list, pageNum);
        return pageInfo;
    }

    @RequestMapping(value = "/getOne")
    public Vehicals getOne(@RequestParam int vehNo) {
        return vehicalsMapper.getOne(vehNo);
    }

    @RequestMapping(value = "/getByCriteria")
    public PageInfo<Vehicals> getByCriteria(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                          @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        Vehicals vehicals = new Vehicals();
        vehicals.setTruckNo("88");

        //pageNum: 表示第几页；pageSize: 表示一页展示的数据
        PageHelper.startPage(pageNum, pageSize);
        List<Vehicals> list = vehicalsMapper.getByCriteria(vehicals);
        PageInfo<Vehicals> pageInfo = new PageInfo<>(list, pageNum);
        return pageInfo;
    }
}
