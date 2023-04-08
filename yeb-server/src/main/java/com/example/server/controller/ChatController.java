package com.example.server.controller;

import com.example.server.entity.vo.RespBean;
import com.example.server.service.IAdminService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 在线聊天
 */
@RestController
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private IAdminService adminService;

    @ApiOperation(value = "获取所有操作员")
    @GetMapping("/")
    public RespBean getAllAdmins(String keywords) {
        return RespBean.success(adminService.getAllAdmins(keywords));
    }
}
