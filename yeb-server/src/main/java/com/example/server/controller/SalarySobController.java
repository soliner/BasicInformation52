package com.example.server.controller;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.server.entity.Employee;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.entity.vo.RespPageBean;
import com.example.server.service.IEmployeeService;
import com.example.server.service.ISalaryService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/salary/sobcfg")
public class SalarySobController {

    @Autowired
    private ISalaryService salaryService;
    @Autowired
    private IEmployeeService employeeService;

    @ApiOperation(value = "获取所有工资账套")
    @GetMapping("/salaries")
    public RespBean getAllSalaries() {
        return RespBean.success(salaryService.list());
    }

    @ApiOperation("获取所有员工的工资账套")
    @GetMapping("/")
    public RespBean getEmployeeWithSalary(
            @RequestParam(defaultValue = "1") Integer currentPage,
            @RequestParam(defaultValue = "10") Integer size) {
        RespPageBean rpb = employeeService.getEmployeeWithSalary(currentPage, size);
        return RespBean.success(rpb);
    }

    @ApiOperation("更新员工账套")
    @PostMapping("/")
    public RespBean updateEmployeeSalary(Integer eId, Integer sId) {
        if (employeeService.update(new UpdateWrapper<Employee>().set("salaryId", sId).eq("id", eId))) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }
}
