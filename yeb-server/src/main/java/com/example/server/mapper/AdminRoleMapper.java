package com.example.server.mapper;

import com.example.server.entity.AdminRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wang
 * @since 2022-03-25
 */
public interface AdminRoleMapper extends BaseMapper<AdminRole> {

    Integer addAdminRoles(@Param("adminId") Integer adminId, @Param("rids") Integer[] rids);
}
