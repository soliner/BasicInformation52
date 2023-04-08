package com.example.server.task;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.server.entity.Employee;
import com.example.server.entity.MailConstants;
import com.example.server.entity.MailLog;
import com.example.server.service.IEmployeeService;
import com.example.server.service.IMailLogService;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 邮件发送服务定时任务
 */
@Component
public class MailTask {

    @Autowired
    private IMailLogService mailLogService;
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private RabbitTemplate rabbitTemplate;

    /**
     * 邮件发送定时任务
     * 10s发送一次
     */
    @Scheduled(cron = "0/10 * * * * ?")
    public void mailTask() {
        //查出来没超时且状态还是发送中的消息
        List<MailLog> list = mailLogService.list(new QueryWrapper<MailLog>()
                .eq("status", 0)
                .lt("tryTime", LocalDateTime.now())
        );
        //循环重新发送
        list.forEach(ml -> {
            //如果重试到达或超过MAX_TRY_COUNT次,更新状态为投递失败,不再重试
            if (MailConstants.MAX_TRY_COUNT <= ml.getCount()) {
                mailLogService.update(new UpdateWrapper<MailLog>()
                        .set("status", 2)
                        .eq("msgId", ml.getMsgId())
                );
            } else {
                mailLogService.update(new UpdateWrapper<MailLog>()
                        .set("count", ml.getCount() + 1)
                        .set("updateTime", LocalDateTime.now())
                        .set("tryTime", LocalDateTime.now().plusMinutes(MailConstants.MSG_TIME_OUT))
                        .eq("msgId", ml.getMsgId())
                );
                //重新获取员工信息
                Employee employee = employeeService.getEmployee(ml.getEid()).get(0);
                //重新发送消息
                rabbitTemplate.convertAndSend(MailConstants.MAIL_EXCHANGE_NAME, MailConstants.MAIL_ROUTING_KEY_NAME, employee, new CorrelationData(ml.getMsgId()));
            }
        });
    }
}
