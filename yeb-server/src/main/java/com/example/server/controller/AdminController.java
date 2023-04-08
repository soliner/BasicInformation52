package com.example.server.controller;

import com.example.server.entity.Admin;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.service.IAdminService;
import com.example.server.service.IRoleService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author wang
 * @since 2022-03-24
 */

@RestController
@RequestMapping("/system/admin")
public class AdminController {
    @Autowired
    private IAdminService adminService;
    @Autowired
    private IRoleService roleService;

    @ApiOperation("获取所有操作员")
    @GetMapping("/")
    public RespBean getAllAdmins(String keyWords) {
        List<Admin> adminList = adminService.getAllAdmins(keyWords);
        return RespBean.success(adminList);
    }

    @ApiOperation("更新操作员")
    @PutMapping("/")
    public RespBean updateAdmin(@RequestBody Admin admin) {
        if (adminService.updateById(admin)) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @ApiOperation("删除操作员")
    @DeleteMapping("/{id}")
    public RespBean deleteAdmin(@PathVariable Integer id) {
        if (adminService.removeById(id)) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @ApiOperation("获取所有角色")
    @GetMapping("/roles")
    public RespBean getAllRoles() {
        return RespBean.success(roleService.list());
    }

    @ApiOperation("更新操作员角色")
    @PutMapping("/updateAdminRoles")
    public RespBean updateAdminRoles(Integer adminId, Integer[] rids) {
        return roleService.updateAdminRoles(adminId, rids);
    }
}
