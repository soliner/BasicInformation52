package com.example.server.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.server.config.security.JWTTokenUtil;
import com.example.server.entity.Admin;
import com.example.server.entity.vo.AdminLogin;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.mapper.AdminMapper;
import com.example.server.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Service
public class LoginServiceImpl extends ServiceImpl<AdminMapper, Admin> implements ILoginService {

    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private JWTTokenUtil jwtTokenUtil;

    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Override
    public RespBean login(AdminLogin adminLogin, HttpServletRequest request) {
        if (adminLogin == null) {
            return RespBean.error(RespBeanEnum.LOGIN_ERROR);
        }
        String username = adminLogin.getUsername();
        String password = adminLogin.getPassword();
        String code = adminLogin.getCode();
        //校验验证码
        String captcha = (String) request.getSession().getAttribute("captcha");
        if (captcha == null || !captcha.equalsIgnoreCase(code)) {
            return RespBean.error(RespBeanEnum.CAPTCHA_ERROR);
        }

        //登录
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        if (!(userDetails != null && passwordEncoder.matches(password, userDetails.getPassword()))) {
            return RespBean.error(RespBeanEnum.LOGIN_ERROR);
        }
        if (!userDetails.isEnabled()) {
            return RespBean.error(RespBeanEnum.NOT_ENABLED);
        }
        //更新security登录用户对象,如果不放可能会出现问题
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        //生成token
        String token = jwtTokenUtil.generateToken(userDetails);
        Map tokenMap = new HashMap();
        tokenMap.put("token", token);
        tokenMap.put("tokenHead", tokenHead);

        return RespBean.success(tokenMap);
    }
}
