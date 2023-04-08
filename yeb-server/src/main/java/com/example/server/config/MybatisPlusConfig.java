package com.example.server.config;


import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MybatisPlusConfig {

    /**
     * 注意: mybatis-plus 3.4以后就用以下MybatisPlusInterceptor的方式
     * 注入所有插件,之前单独注入Bean的方式已经不能用了!
     *
     * @return
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
//        注意:
//        使用多个功能需要注意顺序关系,建议使用如下顺序
//        多租户,动态表名

//        分页,乐观锁
        mybatisPlusInterceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));

//        sql 性能规范,防止全表更新与删除

//        总结: 对 sql 进行单次改造的优先放入,不对 sql 进行改造的最后放入
        return mybatisPlusInterceptor;
    }
}
