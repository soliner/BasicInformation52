package com.example.server.controller;

import com.example.server.entity.vo.RespBean;
import com.example.server.service.IMenuService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author wang
 * @since 2022-03-25
 */
@RestController
@RequestMapping("/system/cfg")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @ApiOperation(value = "通过用户ID查询菜单列表")
    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public RespBean menu() {
        return menuService.getMenuByAdminId();
    }

}
