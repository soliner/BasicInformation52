package com.example.server.controller;

import com.example.server.entity.Position;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.service.IPositionService;
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
 * @since 2022-03-25
 */
@RestController
@RequestMapping("/system/basic/pos")
public class PositionController {

    @Autowired
    private IPositionService positionService;

    @ApiOperation(value = "获取所有职位信息")
    @GetMapping("/getAllPositions")
    public RespBean getAllPositions() {
        return RespBean.success(positionService.list());
    }

    @ApiOperation(value = "添加职位信息")
    @PostMapping("/")
    public RespBean addPosition(@RequestBody Position position) {
        position.setCreateDate(LocalDateTime.now());
        boolean saved = positionService.save(position);
        if (saved) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.ADD_FILED);
    }

    @ApiOperation(value = "修改职位信息")
    @PutMapping("/")
    public RespBean editPosition(@RequestBody Position position) {
        boolean updated = positionService.updateById(position);
        if (updated) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @ApiOperation(value = "删除职位信息")
    @DeleteMapping("/{id}")
    public RespBean deletePosition(@PathVariable Integer id) {
        boolean removed = positionService.removeById(id);
        if (removed) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }

    @ApiOperation(value = "批量删除")
    @DeleteMapping("/")
    public RespBean dePositionsByIds(Integer[] ids) {
        boolean removed = positionService.removeBatchByIds(Arrays.asList(ids));
        if (removed) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }
}
