package com.example.server.controller;

import com.example.server.entity.Joblevel;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.service.IJoblevelService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Arrays;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author wang
 * @since 2022-03-27
 */
@RestController
@RequestMapping("/system/basic/joblevel")
public class JoblevelController {


    @Autowired
    private IJoblevelService joblevelService;

    @ApiOperation(value = "获取所有职称信息")
    @GetMapping("/getAllJoblevels")
    public RespBean getAllJoblevels() {
        return RespBean.success(joblevelService.list());
    }

    @ApiOperation(value = "添加职称信息")
    @PostMapping("/")
    public RespBean addJoblevel(@RequestBody Joblevel joblevel) {
        joblevel.setCreateDate(LocalDateTime.now());
        boolean saved = joblevelService.save(joblevel);
        if (saved) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.ADD_FILED);
    }

    @ApiOperation(value = "修改职称信息")
    @PutMapping("/")
    public RespBean editJoblevel(@RequestBody Joblevel joblevel) {
        boolean updated = joblevelService.updateById(joblevel);
        if (updated) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @ApiOperation(value = "删除职称信息")
    @DeleteMapping("/{id}")
    public RespBean deleteJoblevel(@PathVariable Integer id) {
        boolean removed = joblevelService.removeById(id);
        if (removed) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }

    @ApiOperation(value = "批量删除")
    @DeleteMapping("/")
    public RespBean deJoblevelsByIds(Integer[] ids) {
        boolean removed = joblevelService.removeBatchByIds(Arrays.asList(ids));
        if (removed) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }

}
