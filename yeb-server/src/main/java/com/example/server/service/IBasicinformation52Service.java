package com.example.server.service;

import com.example.server.entity.Basicinformation52;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespPageBean;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wang
 * @since 2023-04-02
 */
public interface IBasicinformation52Service extends IService<Basicinformation52> {
    RespPageBean getBasicInformation52sByPage(Integer currentPage, Integer size, Basicinformation52 basicinformation52);
    RespBean addBasicInformation52(Basicinformation52 basicinformation52);
}
