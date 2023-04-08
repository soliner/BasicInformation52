package com.example.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.server.entity.Admin;
import com.example.server.entity.Role;
import com.example.server.entity.vo.RespBean;
import org.springframework.security.core.Authentication;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author wang
 * @since 2022-03-24
 */
public interface IAdminService extends IService<Admin> {


    /**
     * 根据用户名获取用户
     *
     * @param username
     * @return
     */
    Admin getAdminByUsername(String username);

    /**
     * 根据用户ID查询角色列表
     *
     * @param adminId
     * @return
     */
    List<Role> getRoles(Integer adminId);

    /**
     * 获取所有操作员
     *
     * @param keyWords
     * @return
     */
    List<Admin> getAllAdmins(String keyWords);

    /**
     * 更新用户密码
     *
     * @param oldPass
     * @param pass
     * @param adminId
     * @return
     */
    RespBean updateAdminPass(String oldPass, String pass, Integer adminId);

    /**
     * 更新用户头像
     * @param url
     * @param id
     * @param authentication
     * @return
     */
    RespBean updateAdminUserFace(String url, Integer id, Authentication authentication);
}
