package com.example.server.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.server.entity.Admin;
import com.example.server.entity.Menu;
import com.example.server.entity.vo.RespBean;
import com.example.server.mapper.MenuMapper;
import com.example.server.service.IMenuService;
import com.example.server.utils.AdminUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
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
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {


    @Autowired
    private MenuMapper menuMapper;
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public RespBean getMenuByAdminId() {
        Integer adminId = AdminUtil.getCurrentAdmin().getId();
        //从redis获取菜单数据
        ValueOperations valueOperations = redisTemplate.opsForValue();
        List<Menu> menuList = (List<Menu>) valueOperations.get("menu_" + adminId);
        //如果redis没有
        if (CollectionUtils.isEmpty(menuList)) {
            //去数据库获取
            menuList = menuMapper.getMenuByAdminId(adminId);
            //然后再放到redis中
            redisTemplate.opsForValue().set("menu_" + adminId, menuList);
        }
        return RespBean.success(menuList);
    }

    @Override
    public List<Menu> getMenusWithRole() {
        List<Menu> menuList = menuMapper.getMenusWithRole();
        return menuList;
    }

    @Override
    public List<Menu> getAllMenus() {
        return menuMapper.getAllMenus();
    }
}
