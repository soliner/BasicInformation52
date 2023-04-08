package com.example.server.service;

import com.example.server.entity.Department;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.server.entity.vo.RespBean;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wang
 * @since 2022-03-27
 */
public interface IDepartmentService extends IService<Department> {

    /**
     * 获取所有部门
     * @return
     */
    List<Department> getAllDepartments();

    RespBean addDep(Department department);

    RespBean delDep(Integer id);
}
