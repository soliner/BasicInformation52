package com.example.server.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.server.entity.Basicinformation52;
import org.apache.ibatis.annotations.Param;


public interface BasicInformation52Mapper extends BaseMapper<Basicinformation52> {

    IPage<Basicinformation52> getBasicInformation52sByPage(Page<Basicinformation52> page,  @Param("basicinformation52") Basicinformation52 basicinformation52);

    Basicinformation52 getBasicInformation52(String id);
}
