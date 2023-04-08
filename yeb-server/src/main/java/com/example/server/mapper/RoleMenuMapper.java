package com.example.server.mapper;

import com.example.server.entity.RoleMenu;
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
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {

    /**
     * 批量插入角色菜单
     * @param rId
     * @param menuIds
     * @return 受影响的行数
     */
    Integer insertRoleMenus(@Param("rId") Integer rId, @Param("menuIds") Integer[] menuIds);
}
