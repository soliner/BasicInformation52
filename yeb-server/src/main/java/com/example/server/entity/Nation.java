package com.example.server.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author wang
 * @since 2022-03-28
 */
@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false, of = "name")
@RequiredArgsConstructor
@TableName("t_nation")
@ApiModel(value = "Nation对象", description = "")
public class Nation implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("民族")
    @Excel(name = "民族")
    @NonNull
    private String name;


}
