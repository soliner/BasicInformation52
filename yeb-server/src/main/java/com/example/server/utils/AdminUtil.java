package com.example.server.utils;

import com.example.server.entity.Admin;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 跟操作员相关的工具类
 */
public class AdminUtil {

    public static Admin getCurrentAdmin() {
        return (Admin) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
