package com.example.server.controller;

import com.example.server.entity.vo.RespBean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HelloController {

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public RespBean test() {
        return RespBean.success("Hello!");
    }

    @RequestMapping(value = "/test3", method = RequestMethod.GET)
    public RespBean test2() {
        return RespBean.success("Hello test2!");
    }

    @RequestMapping(value = "/test4", method = RequestMethod.GET)
    public RespBean test3() {
        return RespBean.success("Hello test3!");
    }
}
