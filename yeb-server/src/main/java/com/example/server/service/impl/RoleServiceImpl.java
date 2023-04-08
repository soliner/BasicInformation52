package com.example.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.server.entity.AdminRole;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.mapper.AdminRoleMapper;
import com.example.server.service.IRoleService;
import com.example.server.entity.Role;
import com.example.server.mapper.RoleMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wang
 * @since 2022-03-25
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Autowired
    private AdminRoleMapper adminRoleMapper;


    @Override
    @Transactional
    public RespBean updateAdminRoles(Integer adminId, Integer[] rids) {
        adminRoleMapper.delete(new QueryWrapper<AdminRole>()
                .eq("adminId", adminId)
        );
        Integer rows = adminRoleMapper.addAdminRoles(adminId, rids);
        if (rids.length == rows) {
            return RespBean.success(rows);
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }
}
