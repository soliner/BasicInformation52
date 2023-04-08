package com.example.server.exception;


import com.example.server.entity.vo.GlobalException;
import com.example.server.entity.vo.RespBean;
import com.example.server.entity.vo.RespBeanEnum;
import io.jsonwebtoken.ExpiredJwtException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public RespBean exceptionHandler(Exception e) {
        if (e instanceof GlobalException) {
            GlobalException globalException = (GlobalException) e;
            return RespBean.error(globalException.getRespBeanEnum());
        } else if (e instanceof BindException) {
            BindException bindException = (BindException) e;
            RespBean respBean = RespBean.error(RespBeanEnum.BIND_ERROR);
            respBean.setMessage(respBean.getMessage() + ":" + bindException.getBindingResult().getAllErrors().get(0).getDefaultMessage());
            return respBean;
        } else if (e instanceof DataIntegrityViolationException) {
            return RespBean.error(RespBeanEnum.DELETE_HAVE_FOR_FILED);
        } else if (e instanceof ExpiredJwtException) {
            return RespBean.error(RespBeanEnum.TOKEN_EXPIRED);
        } else {
            System.out.println(e.getMessage());
            return RespBean.error(RespBeanEnum.ERROR);
        }
    }
}
