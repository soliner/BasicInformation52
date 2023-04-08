package com.plugin.generator;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.TemplateConfig;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

public class Generator {
    //  数据库配置
    private static final DataSourceConfig.Builder DATA_SOURCE_CONFIG = new DataSourceConfig
            .Builder(
            "jdbc:mysql://localhost:3306/yeb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai"
            , "root"
            , "123"
    );

    //  全局配置
    private static GlobalConfig.Builder globalConfig() {
        return new GlobalConfig.Builder()
                .outputDir("/src/main/java")
                .author("wang")
                .enableSwagger()
                .enableKotlin()
                .dateType(DateType.TIME_PACK)
                .commentDate("yyyy-MM-dd");
    }

    //    包配置
    private PackageConfig.Builder packageConfig() {
        return new PackageConfig.Builder()
                .parent("com.plugin.generator")
                .entity("entity")
                .service("service")
                .serviceImpl("service.impl")
                .mapper("mapper")
                .controller("controller");
    }

    //    模板配置
    private TemplateConfig.Builder templateConfig() {
        return new TemplateConfig.Builder();
    }


    public static void main(String[] args) {
        String projectPath = System.getProperty("user.dir");
        FastAutoGenerator.create(DATA_SOURCE_CONFIG)
                .globalConfig((builder) -> {
                    builder.author("wang")
                            .enableSwagger()
                            .outputDir(projectPath + "/generator/src/main/java");
                })
                .packageConfig((builder) -> {
                    builder.parent("com.plugin.generator");
                })
                .strategyConfig((scanner, builder) -> {
                    builder.addInclude(scanner.apply("请输入表名,多个表用,隔开"))
                            .addTablePrefix("t_")
                            .entityBuilder()
                            .enableLombok()
                            .mapperBuilder()
                            .enableBaseColumnList()
                            .enableBaseResultMap()
                            .controllerBuilder()
                            .enableRestStyle();
                })
                .templateEngine(new FreemarkerTemplateEngine())
                .execute();
    }
}
