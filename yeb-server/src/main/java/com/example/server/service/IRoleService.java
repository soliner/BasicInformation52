package com.example.server.service;

import com.example.server.entity.Role;
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
public interface IRoleService extends IService<Role> {

    /**
     * 更新操作员角色
     *
     * @param adminId
     * @param rids
     * @return
     */

    RespBean updateAdminRoles(Integer adminId, Integer[] rids);

}
