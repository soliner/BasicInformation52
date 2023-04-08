package com.example.server.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import com.example.server.entity.*;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import com.example.server.entity.vo.RespPageBean;
import com.example.server.service.*;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author wang
 * @since 2022-03-27
 */
@RestController
@RequestMapping("/employee/basic")
public class EmployeeController {

    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IPositionService positionService;
    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IJoblevelService joblevelService;
    @Autowired
    private INationService nationService;
    @Autowired
    private IPoliticsStatusService politicsStatusService;

    @ApiOperation("查询所有员工并分页")
    @GetMapping("/")
    public RespBean getEmployee(
            @RequestParam(defaultValue = "1") Integer currentPage,
            @RequestParam(defaultValue = "10") Integer size,
            Employee employee,
            LocalDate[] beginDateScope
    ) {
        RespPageBean rpb = employeeService.getEmployeeByPage(currentPage, size, employee, beginDateScope);
        return RespBean.success(rpb);
    }

    @ApiOperation("获取所有职称")
    @GetMapping(value = "/joblevels")
    public RespBean getAllJoblevels() {
        return RespBean.success(joblevelService.list());
    }

    @ApiOperation("获取所有民族")
    @GetMapping(value = "/nations")
    public RespBean getAllNations() {
        return RespBean.success(nationService.list());
    }


    @ApiOperation("获取所有政治面貌")
    @GetMapping(value = "/politicsStatus")
    public RespBean getAllPoliticsStatus() {
        return RespBean.success(politicsStatusService.list());
    }

    @ApiOperation("获取所有职位")
    @GetMapping(value = "/positions")
    public RespBean getAllPositions() {
        return RespBean.success(positionService.list());
    }

    @ApiOperation("获取所有部门")
    @GetMapping(value = "/departments")
    public RespBean getAllDepartments() {
        return RespBean.success(departmentService.getAllDepartments());
    }

    @ApiOperation("获取工号")
    @GetMapping(value = "/maxWorkId")
    public RespBean getMaxWorkId() {
        return RespBean.success(employeeService.getMaxWorkId());
    }

    @ApiOperation("添加员工")
    @PostMapping("/")
    public RespBean addEmployee(@RequestBody Employee employee) {
        return employeeService.addEmployee(employee);
    }

    @ApiOperation("修改员工")
    @PutMapping("/")
    public RespBean updateEmployee(@RequestBody Employee employee) {
        if (employeeService.updateById(employee)) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.UPDATE_FILED);
    }

    @ApiOperation("删除员工")
    @DeleteMapping("/{id}")
    public RespBean deleteEmployee(@PathVariable Integer id) {
        if (employeeService.removeById(id)) {
            return RespBean.success();
        }
        return RespBean.error(RespBeanEnum.DELETE_FILED);
    }

    @ApiOperation("导出员工数据")
    @GetMapping(value = "/export", produces = "application/octet-stream")
    public void exportEmployee(HttpServletResponse response) {
        List<Employee> employeeList = employeeService.getEmployee(null);
        ExportParams exportParams = new ExportParams("员工表", "Sheet1", ExcelType.HSSF);
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams, Employee.class, employeeList);
        ServletOutputStream outputStream = null;
        try {
            response.setHeader("content-type", "application/octet-stream");
            response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("员工表.xls", "UTF-8"));
            outputStream = response.getOutputStream();
            workbook.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (null != outputStream) {
                try {
                    outputStream.flush();
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @ApiOperation("导入员工数据")
    @PostMapping(value = "/import")
    public RespBean importEmployee(MultipartFile file) {
        ImportParams params = new ImportParams();
        //去掉标题行
        params.setTitleRows(1);
        List<Nation> nationList = nationService.list();
        List<PoliticsStatus> politicsStatusList = politicsStatusService.list();
        List<Department> departmentList = departmentService.list();
        List<Joblevel> joblevelList = joblevelService.list();
        List<Position> positionList = positionService.list();
        try {
            List<Employee> employeeList = ExcelImportUtil.importExcel(file.getInputStream(), Employee.class, params);
            employeeList.forEach(e -> {
                Integer nationId = nationList.get(nationList.indexOf(new Nation(e.getNation().getName()))).getId();
                e.setNationId(nationId);
                Integer politicsStatusId = politicsStatusList.get(politicsStatusList.indexOf(new PoliticsStatus(e.getPoliticsStatus().getName()))).getId();
                e.setPoliticId(politicsStatusId);
                Integer departmentId = departmentList.get(departmentList.indexOf(new Department(e.getDepartment().getName()))).getId();
                e.setDepartmentId(departmentId);
                Integer jobLevelId = joblevelList.get(joblevelList.indexOf(new Joblevel(e.getJoblevel().getName()))).getId();
                e.setJobLevelId(jobLevelId);
                Integer positionId = positionList.get(positionList.indexOf(new Position(e.getPosition().getName()))).getId();
                e.setPosId(positionId);
            });
            if (employeeService.saveBatch(employeeList)) {
                return RespBean.success();
            }
        } catch (Exception e) {
            if (e instanceof DuplicateKeyException) {
                return RespBean.error(RespBeanEnum.SEQ_INSERT_FILED);
            }
            e.printStackTrace();
        }
        return RespBean.error(RespBeanEnum.IMPORT_FILED);
    }
}
