package com.example.server.controller;

import com.example.server.entity.Admin;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.service.IAdminService;
import com.example.server.utils.FastDFSUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * 个人中心
 */
@RestController
public class AdminInfoController {

    @Autowired
    private IAdminService adminService;

    @ApiOperation(value = "更新当前用户信息")
    @PutMapping(value = "/admin/info")
    public RespBean updateAdmin(@RequestBody Admin admin, Authentication authentication) {
        if (adminService.updateById(admin)) {
            SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(admin, null, authentication.getAuthorities()));
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @ApiOperation(value = "更新密码")
    @PutMapping(value = "/admin/pass")
    public RespBean updateAdminPass(@RequestBody Map<String, Object> info) {
        String oldPass = (String) info.get("oldPass");
        String pass = (String) info.get("pass");
        Integer adminId = (Integer) info.get("adminId");
        return adminService.updateAdminPass(oldPass, pass, adminId);
    }

    @ApiOperation("更新用户头像")
    @PostMapping(value = "/admin/userFace")
    public RespBean updateAdminUserFace(MultipartFile file, Integer id, Authentication authentication) {
        String[] fileName = FastDFSUtils.upload(file);
        String url = FastDFSUtils.getTrackerUrl() + fileName[0] + "/" + fileName[1];
        return adminService.updateAdminUserFace(url, id, authentication);
    }
}
