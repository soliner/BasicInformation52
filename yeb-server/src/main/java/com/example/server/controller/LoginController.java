package com.example.server.controller;

import com.example.server.entity.Admin;
import com.example.server.entity.vo.AdminLogin;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.service.IAdminService;
import com.example.server.service.ILoginService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@RestController
@RequestMapping(value = "/login")
@Api(tags = "LoginController")
public class LoginController {

    @Autowired
    private IAdminService adminService;
    @Autowired
    private ILoginService loginService;

    @ApiOperation(value = "登陆之后返回token")
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public RespBean doLogin(@RequestBody AdminLogin adminLogin, HttpServletRequest request) {
        return loginService.login(adminLogin, request);
    }

    @ApiOperation(value = "获取当前登录用户信息")
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.GET)
    public RespBean getUserInfo(Principal principal) {
        if (null == principal) {
            return RespBean.error(RespBeanEnum.NOT_LOGIN);
        }
        String username = principal.getName();
        Admin admin = adminService.getAdminByUsername(username);
        admin.setPassword(null);
        admin.setRoles(adminService.getRoles(admin.getId()));
        return RespBean.success(admin);
    }

    @ApiOperation(value = "退出登录")
    @RequestMapping(value = "/doLogout", method = RequestMethod.POST)
    public RespBean doLogout() {
        return RespBean.success();
    }
}
