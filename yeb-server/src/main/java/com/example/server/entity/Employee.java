package com.example.server.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDate;

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
@TableName("t_employee")
@ApiModel(value = "Employee对象", description = "")
public class Employee implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @Excel(name = "姓名")
    private String name;

    @Excel(name = "性别")
    private String gender;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    @Excel(name = "生日", width = 20, format = "yyyy-MM-dd")
    private LocalDate birthday;

    @ApiModelProperty("身份证号")
    @Excel(name = "省份证号", width = 30)
    private String idCard;

    @ApiModelProperty("婚姻状况")
    @Excel(name = "婚姻状况")
    private String wedlock;

    @ApiModelProperty("民族")
    private Integer nationId;

    @ApiModelProperty("籍贯")
    @Excel(name = "籍贯")
    private String nativePlace;

    @ApiModelProperty("政治面貌")
    private Integer politicId;


    @Excel(name = "邮箱", width = 30)
    private String email;

    @Excel(name = "手机号", width = 15)
    private String phone;

    @Excel(name = "联系地址", width = 40)
    private String address;

    @ApiModelProperty("部门ID")
    private Integer departmentId;

    @ApiModelProperty("职称ID")
    private Integer jobLevelId;

    @ApiModelProperty("职位ID")
    private Integer posId;

    @ApiModelProperty("聘用形式")
    @Excel(name = "聘用形式")
    private String engageForm;

    @ApiModelProperty("学历")
    @Excel(name = "学历")
    private String tiptopDegree;

    @ApiModelProperty("所属专业")
    @Excel(name = "所属专业")
    private String specialty;

    @ApiModelProperty("毕业学校")
    @Excel(name = "毕业学校")
    private String school;

    @ApiModelProperty("入职日期")
    @Excel(name = "入职日期", width = 20, format = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    private LocalDate beginDate;

    @ApiModelProperty("在职状态")
    @Excel(name = "在职状态")
    private String workState;

    @ApiModelProperty("工号")
    @Excel(name = "工号")
    private Integer workId;

    @ApiModelProperty("合同期限")
    @Excel(name = "合同期限", suffix = "年")
    private Double contractTerm;

    @ApiModelProperty("转正日期")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    @Excel(name = "转正日期", width = 20, format = "yyyy-MM-dd")
    private LocalDate conversionTime;

    @ApiModelProperty("离职日期")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    @Excel(name = "离职日期", width = 20, format = "yyyy-MM-dd")
    private LocalDate notWorkDate;

    @ApiModelProperty("合同开始日期")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    @Excel(name = "合同开始日期", width = 20, format = "yyyy-MM-dd")
    private LocalDate beginContract;

    @ApiModelProperty("合同终止日期")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    @Excel(name = "合同终止日期", width = 20, format = "yyyy-MM-dd")
    private LocalDate endContract;

    @ApiModelProperty("工龄")
    @Excel(name = "工龄")
    private String workAge;

    @ApiModelProperty("工资账套ID")
    private Integer salaryId;

    @ApiModelProperty("民族")
    @TableField(exist = false)
    @ExcelEntity(name = "民族")
    private Nation nation;

    @ApiModelProperty("政治面貌")
    @ExcelEntity(name = "政治面貌")
    @TableField(exist = false)
    private PoliticsStatus politicsStatus;

    @ApiModelProperty("部门")
    @ExcelEntity(name = "部门")
    @TableField(exist = false)
    private Department department;

    @ApiModelProperty("职称")
    @ExcelEntity(name = "职称")
    @TableField(exist = false)
    private Joblevel joblevel;

    @ApiModelProperty("职位")
    @ExcelEntity(name = "职位")
    @TableField(exist = false)
    private Position position;

    @ApiModelProperty("工资账套")
    @TableField(exist = false)
    private Salary salary;

}
