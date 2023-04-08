package com.example.server.service;

import com.example.server.entity.Employee;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespPageBean;

import java.time.LocalDate;
import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wang
 * @since 2022-03-27
 */
public interface IEmployeeService extends IService<Employee> {

    /**
     * 分页获取员工
     *
     * @param currentPage
     * @param size
     * @param employee
     * @param beginDateScope
     * @return
     */
    RespPageBean getEmployeeByPage(Integer currentPage, Integer size, Employee employee, LocalDate[] beginDateScope);

    /**
     * 获取最大工号
     *
     * @return
     */
    Integer getMaxWorkId();

    /**
     * 添加员工
     *
     * @param employee
     * @return
     */
    RespBean addEmployee(Employee employee);

    /**
     * 根据ID查询员工,不传就查所有
     *
     * @param id
     * @return
     */
    List<Employee> getEmployee(Integer id);

    /**
     * 获取所有员工工资账套
     *
     * @param currentPage
     * @param size
     * @return
     */
    RespPageBean getEmployeeWithSalary(Integer currentPage, Integer size);
}
