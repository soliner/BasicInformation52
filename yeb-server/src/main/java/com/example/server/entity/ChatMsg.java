package com.example.server.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * websocket消息类
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ChatMsg {

    private String from;

    private String to;

    private String content;

    private LocalDateTime date;

    //昵称
    private String fromNickName;
}
