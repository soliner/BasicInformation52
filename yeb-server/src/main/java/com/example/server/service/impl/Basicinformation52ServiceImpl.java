package com.example.server.service.impl;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.server.entity.Basicinformation52;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.entity.vo.RespPageBean;
import com.example.server.mapper.BasicInformation52Mapper;
import com.example.server.service.IBasicinformation52Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wang
 * @since 2023-04-02
 */
@Service
public class Basicinformation52ServiceImpl extends ServiceImpl<BasicInformation52Mapper, Basicinformation52> implements IBasicinformation52Service {


    @Autowired
    private BasicInformation52Mapper basicInformation52Mapper;

    public RespPageBean getBasicInformation52sByPage(Integer currentPage, Integer size, Basicinformation52 basicinformation52) {
        //开启分页
        Page<Basicinformation52> page = new Page<>(currentPage, size);
        IPage<Basicinformation52> employeeWithSalary = basicInformation52Mapper.getBasicInformation52sByPage(page,basicinformation52);
        RespPageBean rpb = new RespPageBean();
        rpb.setTotal(employeeWithSalary.getTotal());
        rpb.setData(employeeWithSalary.getRecords());
        return rpb;
    }

    @Override
    public RespBean addBasicInformation52(Basicinformation52 basicinformation52) {
        if(basicInformation52Mapper.insert(basicinformation52) == 1){
            //Basicinformation52 bi = basicInformation52Mapper.getBasicInformation52(basicinformation52.getId());
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.ADD_FILED);
    }
}
