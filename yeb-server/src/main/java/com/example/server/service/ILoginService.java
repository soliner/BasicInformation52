package com.example.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.server.entity.Admin;
import com.example.server.entity.vo.AdminLogin;
import com.example.server.entity.vo.RespBean;

import javax.servlet.http.HttpServletRequest;

public interface ILoginService extends IService<Admin> {

    /**
     * 登陆之后返回token
     *
     * @param request
     * @return
     */
    RespBean login(AdminLogin adminLogin, HttpServletRequest request);
}
