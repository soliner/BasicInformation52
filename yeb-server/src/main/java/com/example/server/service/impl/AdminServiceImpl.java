package com.example.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.server.config.security.SecurityConfig;
import com.example.server.entity.Admin;
import com.example.server.entity.Role;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.mapper.AdminMapper;
import com.example.server.mapper.RoleMapper;
import com.example.server.service.IAdminService;
import com.example.server.utils.AdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wang
 * @since 2022-03-24
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public Admin getAdminByUsername(String username) {
        return adminMapper.selectOne(new QueryWrapper<Admin>()
                .eq("username", username)
                .eq("enabled", true)
        );
    }

    @Override
    public List<Role> getRoles(Integer adminId) {
        return roleMapper.getRoles(adminId);
    }

    @Override
    public List<Admin> getAllAdmins(String keyWords) {
        return adminMapper.getAllAdmins(AdminUtil.getCurrentAdmin().getId(), keyWords);
    }

    @Override
    public RespBean updateAdminPass(String oldPass, String pass, Integer adminId) {
        Integer result = -1;
        Admin admin = adminMapper.selectById(adminId);
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        if (bCryptPasswordEncoder.matches(oldPass, admin.getPassword())) {
            admin.setPassword(bCryptPasswordEncoder.encode(pass));
            result = adminMapper.updateById(admin);
        }
        if (1 == result) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @Override
    public RespBean updateAdminUserFace(String url, Integer id, Authentication authentication) {
        Admin admin = adminMapper.selectById(id);
        admin.setUserFace(url);
        int result = adminMapper.updateById(admin);
        if (1 == result) {
//            Admin principal = (Admin) authentication.getPrincipal();
//            principal.setUserFace(url);
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(admin, null, authentication.getAuthorities()));
            return RespBean.success(url);
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }
}
