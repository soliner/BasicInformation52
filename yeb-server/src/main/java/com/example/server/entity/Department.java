package com.example.server.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author wang
 * @since 2022-03-27
 */
@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
@EqualsAndHashCode(callSuper = false,of = "name")
@TableName("t_department")
@ApiModel(value = "Department对象", description = "")
public class Department implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("部门名称")
    @Excel(name = "部门名称")
    @NonNull
    private String name;

    @ApiModelProperty("父ID")
    private Integer parentId;

    @ApiModelProperty("路径")
    private String depPath;

    @ApiModelProperty("启用禁用")
    private Boolean enabled;

    @ApiModelProperty("是否父级")
    private Boolean isParent;

    @ApiModelProperty("子部门")
    @TableField(exist = false)
    private List<Department> children;

    @ApiModelProperty("存储过程返回结果")
    @TableField(exist = false)
    private Integer result;

}
