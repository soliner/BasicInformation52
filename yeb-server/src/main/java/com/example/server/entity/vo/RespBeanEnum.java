package com.example.server.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

/**
 * 公共返回对象枚举
 */

@Getter
@ToString
@AllArgsConstructor
public enum RespBeanEnum {

    /**
     * 通用
     */
    SUCCESS(200, "SUCCESS"),
    ERROR(500, "服务端异常"),
    /**
     * 登录模块
     */
    USER_NOT_FOUND_ERROR(400201, "用户不存在"),
    LOGIN_ERROR(500210, "用户名或密码错误"),
    MOBILE_ERROR(500211, "手机号码格式错误"),
    BIND_ERROR(500212, "参数校验异常"),
    UPDATE_PASSWORD_ERROR(500213, "修改密码失败"),
    NOT_LOGIN(500214, "用户未登录"),
    NOT_ENABLED(500215, "账户被禁用"),
    AUTHORITY_DENIED(500216, "权限不足"),
    TOKEN_EXPIRED(500217, "TOKEN过期,请重新登陆"),

    /**
     * 秒杀模块
     */
    EMPTY_STOCK(500500, "库存不足"),
    REPEAT_ERROR(500501, "商品单人限购一件"),
    ORDER_NOT_FOUND(500502, "未找到订单"),
    REQUEST_ILLEGAL(500503, "非法请求"),
    CAPTCHA_ERROR(500504, "验证码校验错误,请重新获取验证码"),
    ACCECC_LIMIT_REACHED(500505, "访问过于频繁,请稍后再试"),
    /**
     * 订单模块
     */
    ORDER_NOT_EXIT(500300, "订单不存在"),
    /**
     * CRUD
     */
    ADD_FILED(500100, "添加失败"),
    UPDATE_FILED(500101, "修改失败"),
    DELETE_FILED(500102, "删除失败"),
    IMPORT_FILED(500103, "导入失败"),
    SEQ_INSERT_FILED(500105, "失败,因索引不可重复"),
    DELETE_HAVE_FOR_FILED(500104, "该条数据有关联数据,无法修改或删除");
    private final Integer code;

    private final String message;
}
