package com.example.server.service;

import com.example.server.entity.RoleMenu;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.server.entity.vo.RespBean;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wang
 * @since 2022-03-25
 */
public interface IRoleMenuService extends IService<RoleMenu> {

    /**
     * 更新角色菜单
     *
     * @param rId
     * @param menuIds
     * @return
     */
    RespBean updateMenuRoles(Integer rId, Integer[] menuIds);
}
