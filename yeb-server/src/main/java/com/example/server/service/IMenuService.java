package com.example.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.server.entity.Menu;
import com.example.server.entity.vo.RespBean;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wang
 * @since 2022-03-25
 */
public interface IMenuService extends IService<Menu> {


    /**
     * 通过用户ID获取menu
     *
     * @return
     */
    RespBean getMenuByAdminId();

    /**
     * 根据角色获取菜单列表
     * @return
     */
    List<Menu> getMenusWithRole();

    /**
     * 查询所有菜单
     */
    List<Menu> getAllMenus();
}
