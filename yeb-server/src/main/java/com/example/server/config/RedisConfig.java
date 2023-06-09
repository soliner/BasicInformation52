package com.example.server.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {

    @Bean
     public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory connectionFactory) {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();
//        key的序列化
        redisTemplate.setKeySerializer(new StringRedisSerializer());
//        value序列化
        redisTemplate.setValueSerializer(new GenericJackson2JsonRedisSerializer());
//        hash类型key的序列化
        redisTemplate.setHashKeySerializer(new StringRedisSerializer());
//        hash类型value的序列化
        redisTemplate.setHashValueSerializer(new GenericJackson2JsonRedisSerializer());

        //注入连接工厂
        redisTemplate.setConnectionFactory(connectionFactory);
        return redisTemplate;
    }

//    @Bean
//    public DefaultRedisScript<Long> script() {
//        DefaultRedisScript<Long> redisScript = new DefaultRedisScript<>();
//        //lock.lua脚本位置和application.yml同级
//        redisScript.setLocation(new ClassPathResource("stock.lua"));
//        redisScript.setResultType(Long.class);
//        return redisScript;
//    }
}
