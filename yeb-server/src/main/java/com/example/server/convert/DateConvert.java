package com.example.server.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * 日期转换
 */
@Component
public class DateConvert implements Converter<String, LocalDate> {

    @Override
    public LocalDate convert(String source) {
        try {
            if (StringUtils.hasText(source)) {
                //这里限制了传入的时间格式
                //如:
                // 2022-3-28是错的
                // 2022-03-28是对的
                // 一个字都不能省
                return LocalDate.parse(source, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
