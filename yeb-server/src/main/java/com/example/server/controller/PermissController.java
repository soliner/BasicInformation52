package com.example.server.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.server.entity.Menu;
import com.example.server.entity.Role;
import com.example.server.entity.RoleMenu;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.service.IMenuService;
import com.example.server.service.IRoleMenuService;
import com.example.server.service.IRoleService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 权限组
 */
@RestController
@RequestMapping(value = "/system/basic/permiss")
public class PermissController {

    @Autowired
    private IRoleService roleService;
    @Autowired
    private IMenuService menuService;
    @Autowired
    private IRoleMenuService roleMenuService;


    @ApiOperation(value = "获取所有角色信息")
    @GetMapping("/getAllRoles")
    public RespBean getAllRoles() {
        return RespBean.success(roleService.list());
    }

    @ApiOperation(value = "添加角色信息")
    @PostMapping("/")
    public RespBean addRole(@RequestBody Role role) {
//        role.setCreateDate(LocalDateTime.now());
        if (!role.getName().startsWith("ROLE_")) {
            role.setName("ROLE_" + role.getName());
        }
        boolean saved = roleService.save(role);
        if (saved) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.ADD_FILED);
    }

    @ApiOperation(value = "修改角色信息")
    @PutMapping("/")
    public RespBean editRole(@RequestBody Role role) {
        boolean updated = roleService.updateById(role);
        if (updated) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @ApiOperation(value = "删除角色信息")
    @DeleteMapping("/{id}")
    public RespBean deleteRole(@PathVariable Integer id) {
        boolean removed = roleService.removeById(id);
        if (removed) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }

    @ApiOperation(value = "批量删除")
    @DeleteMapping("/")
    public RespBean deRolesByIds(Integer[] ids) {
        boolean removed = roleService.removeBatchByIds(Arrays.asList(ids));
        if (removed) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }

    @ApiOperation("查询所有菜单")
    @GetMapping("/menus")
    public RespBean getMenus() {
        List<Menu> menuList = menuService.getAllMenus();
        return RespBean.success(menuList);
    }

    @ApiOperation("根据角色ID查询菜单ID")
    @GetMapping("/mid/{rId}")
    public RespBean getMidByRid(@PathVariable Integer rId) {
        List<Integer> menuIdList = roleMenuService.list(new QueryWrapper<RoleMenu>()
                .eq("roleId", rId)
        ).stream().map(RoleMenu::getMenuId).collect(Collectors.toList());
        return RespBean.success(menuIdList);
    }

    @ApiOperation("更新角色菜单")
    @PutMapping("/updateMenuRoles")
    public RespBean updateMenuRoles(Integer rId, Integer[] menuIds) {
        return roleMenuService.updateMenuRoles(rId, menuIds);
    }
}
