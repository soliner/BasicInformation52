package com.example.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.server.entity.AdminRole;
import com.example.server.entity.RoleMenu;
import com.example.server.entity.vo.RespBean;
import com.example.server.mapper.AdminRoleMapper;
import com.example.server.service.IRoleMenuService;
import com.example.server.mapper.RoleMenuMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wang
 * @since 2022-03-25
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements IRoleMenuService {
    @Autowired
    private RoleMenuMapper roleMenuMapper;
    @Autowired
    private AdminRoleMapper adminRoleMapper;
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    @Transactional
    public RespBean updateMenuRoles(Integer rId, Integer[] menuIds) {
        roleMenuMapper.delete(new QueryWrapper<RoleMenu>()
                .eq("roleId", rId)
        );
        if (null == menuIds || 0 == menuIds.length) {
            return RespBean.success();
        }
        Integer rows = roleMenuMapper.insertRoleMenus(rId, menuIds);
        //更新成功以后,更新一下redis
        //根据角色ID,查询adminId,再根据adminId更新redis
        List<AdminRole> adminRoles = adminRoleMapper.selectList(
                new QueryWrapper<AdminRole>()
                        .eq("roleId", rId)
        );
        for (AdminRole ar : adminRoles) {
            //把角色相关的admin的菜单都初始化了
            redisTemplate.opsForValue().set("menu_" + ar.getAdminId(), new ArrayList<>());
        }
        return RespBean.success(rows);
    }
}
