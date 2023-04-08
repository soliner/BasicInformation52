package com.example.server.controller;

import com.example.server.entity.Salary;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.service.ISalaryService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author wang
 * @since 2022-03-29
 */
@RestController
@RequestMapping("/salary/sob")
public class SalaryController {


    @Autowired
    private ISalaryService salaryService;

    @ApiOperation("获取所有工资账套")
    @GetMapping("/")
    public RespBean getAllSalary() {
        List<Salary> list = salaryService.list();
        return RespBean.success(list);
    }


    @ApiOperation(value = "添加工资账套信息")
    @PostMapping("/")
    public RespBean addSalary(@RequestBody Salary salary) {
        salary.setCreateDate(LocalDateTime.now());
        boolean saved = salaryService.save(salary);
        if (saved) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.ADD_FILED);
    }

    @ApiOperation(value = "修改工资账套信息")
    @PutMapping("/")
    public RespBean editSalary(@RequestBody Salary salary) {
        boolean updated = salaryService.updateById(salary);
        if (updated) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @ApiOperation(value = "删除工资账套信息")
    @DeleteMapping("/{id}")
    public RespBean deleteSalary(@PathVariable Integer id) {
        boolean removed = salaryService.removeById(id);
        if (removed) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }

    @ApiOperation(value = "批量删除")
    @DeleteMapping("/")
    public RespBean deSalarysByIds(Integer[] ids) {
        boolean removed = salaryService.removeBatchByIds(Arrays.asList(ids));
        if (removed) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }
}
