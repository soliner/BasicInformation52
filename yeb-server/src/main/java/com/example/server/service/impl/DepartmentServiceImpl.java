package com.example.server.service.impl;

import com.example.server.entity.Department;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.mapper.DepartmentMapper;
import com.example.server.service.IDepartmentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wang
 * @since 2022-03-27
 */
@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements IDepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> getAllDepartments() {
        return departmentMapper.getAllDepartments(-1);
    }

    @Override
    public RespBean addDep(Department department) {
        department.setEnabled(true);
        departmentMapper.addDep(department);
        if (1 == department.getResult()) {
            return RespBean.success(department);
        }
        return RespBean.error(RespBeanEnum.ADD_FILED);
    }

    @Override
    public RespBean delDep(Integer id) {
        Department department = new Department();
        department.setId(id);
        departmentMapper.delDep(department);
        Integer result = department.getResult();
        if (result == -2) {
            return RespBean.error(RespBeanEnum.DELETE_FILED, "该部门下还有部门!");
        } else if (result == -1) {
            return RespBean.error(RespBeanEnum.DELETE_FILED, "该部门下还有员工!");
        } else if (result == 1) {
            department.setResult(result);
            return RespBean.success(department);
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }
}
