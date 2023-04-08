package com.example.server.config.Filter;

import com.example.server.entity.vo.RespBeanEnum;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Collection;

/**
 * 权限控制
 * 判断用户角色
 */
@Component
public class CustomUrlDecisionManager implements AccessDecisionManager {

    @Override
    public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes) throws AccessDeniedException, InsufficientAuthenticationException {
        for (ConfigAttribute attribute : configAttributes) {
            //当前URL所需的角色
            String needRole = attribute.getAttribute();
            //判断角色是否为登录即可访问的默认角色,此角色在CustomFilter中设置
            if ("ROLE_LOGIN".equals(needRole)) {
                // 判断是否登录
                if (authentication instanceof AnonymousAuthenticationToken) {
                    throw new AccessDeniedException(RespBeanEnum.NOT_LOGIN.getMessage());
                } else {
                    return;
                }
            }
            //判断用户角色是否为url所需角色
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
            for (GrantedAuthority authority : authorities) {
                if (authority.getAuthority().equals(needRole)) {
                    return;
                }
            }
        }
        throw new AccessDeniedException(RespBeanEnum.AUTHORITY_DENIED.getMessage());
    }

    @Override
    public boolean supports(ConfigAttribute attribute) {
        return false;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return false;
    }
}
