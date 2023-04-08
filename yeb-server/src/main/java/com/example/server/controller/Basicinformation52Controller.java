package com.example.server.controller;

import com.example.server.entity.Basicinformation52;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.entity.vo.RespPageBean;
import com.example.server.service.IBasicinformation52Service;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wang
 * @since 2023-04-02
 */
@RestController
@RequestMapping("/basicinformation52")
public class Basicinformation52Controller {
    @Autowired
    private IBasicinformation52Service basicinformation52Service;
    @ApiOperation(value = "获取所有52项基本信息")
    @GetMapping(value = "/")
    public RespBean getAllBasicinformation52s(
            @RequestParam(defaultValue = "1") Integer currentPage,
            @RequestParam(defaultValue = "10") Integer size,
            Basicinformation52 basicinformation52
    ){
        RespPageBean rpb =
                basicinformation52Service.getBasicInformation52sByPage(currentPage, size, basicinformation52);
        return RespBean.success(rpb);
    }
    @ApiOperation("添加52项基本信息")
    @PostMapping("/")
    public RespBean addBasicInformation52(@RequestBody Basicinformation52 basicinformation52) {
        return basicinformation52Service.addBasicInformation52(basicinformation52);
    }

    @ApiOperation("修改52项基本信息")
    @PutMapping("/")
    public RespBean updateBasicInformation52(@RequestBody Basicinformation52 basicinformation52) {
        if (basicinformation52Service.updateById(basicinformation52)) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @ApiOperation("删除52项基本信息")
    @DeleteMapping("/{id}")
    public RespBean deleteBasicInformation52(@PathVariable Integer id) {
        if (basicinformation52Service.removeById(id)) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }

}
