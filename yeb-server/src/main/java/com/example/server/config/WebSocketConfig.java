package com.example.server.config;

import com.example.server.config.security.JWTTokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Value("${jwt.tokenHeader}")
    private String tokenHeader;
    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Autowired
    private JWTTokenUtil jwtTokenUtil;
    @Autowired
    private UserDetailsService userDetailsService;

    /**
     * 添加这个Endpoint,这样可以在网页通过websocket连接上服务器
     * 也就是我们配置websocket的服务地址,并且可以指定是否使用websocketJS
     *
     * @param registry
     */
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        /**
         * 将/wsyeb/ep注册为端点,用户连接这个端点就可以进行websocket通讯,支持websocketJS
         * setAllowedOrigins允许*跨域
         * withSockJS 支持socketJS访问
         */
        registry.addEndpoint("/wsyeb/ep").setAllowedOriginPatterns("*").withSockJS();
    }

    /**
     * 没用JWT令牌时不用配置
     * 输入通道参数配置
     *
     * @param registration
     */
    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        registration.interceptors(new ChannelInterceptor() {
            @Override
            public Message<?> preSend(Message<?> message, MessageChannel channel) {
                StompHeaderAccessor accessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);
                //判断是否为连接,如果是,需要获取token,并且设置用户对象
                if (StompCommand.CONNECT.equals(accessor.getCommand())) {
                    String token = accessor.getFirstNativeHeader("Auth-Token");
                    if (StringUtils.hasText(token)) {
                        String authToken = token.substring(tokenHead.length());
                        String username = jwtTokenUtil.getUsernameFromToken(authToken);
                        //token中有username
                        if (StringUtils.hasText(username)) {
                            //登录
                            UserDetails userDetails = userDetailsService.loadUserByUsername(username);
                            //验证token是否有效
                            if (jwtTokenUtil.validateToken(authToken, userDetails)) {
                                UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                                SecurityContextHolder.getContext().setAuthentication(authenticationToken);
                                accessor.setUser(authenticationToken);
                            }
                        }
                    }
                }
                return message;
            }
        });
    }

    /**
     * 配置消息代理
     *
     * @param registry
     */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        /**
         * 配置代理域,可以配置多个,配置代理目的地前缀/queue,可以在配置域上向客户端发送消息
         */
        registry.enableSimpleBroker("/queue");
    }
}
