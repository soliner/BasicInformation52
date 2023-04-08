package com.example.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.server.entity.Menu;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author wang
 * @since 2022-03-25
 */
public interface MenuMapper extends BaseMapper<Menu> {

    List<Menu> getMenuByAdminId(Integer id);

    /**
     * 根据角色获取菜单
     *
     * @return
     */
    List<Menu> getMenusWithRole();

    List<Menu> getAllMenus();
}
