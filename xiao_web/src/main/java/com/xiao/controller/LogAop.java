package com.xiao.controller;


import com.xiao.domain.SysLog;
import com.xiao.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * 日志信息
 */
@Component
@Aspect
public class LogAop {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ISysLogService sysLogService;

    private Date visitTime;  //开始时间
    private Class clazz;   //访问的类
    private Method method;  //访问的方法


    @Before("execution(* com.xiao.controller.*Controller.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime = new Date();
        clazz = jp.getTarget().getClass();
        String methodName = jp.getSignature().getName();  //获取访问的方法的名称
        Object[] args = jp.getArgs();//获取访问的方法的参数
        if(args == null || args.length == 0){
            method = clazz.getMethod(methodName);
        }
//        else{
//            Class[] classArgs = new Class[args.length];
//            for(int i=0;i<args.length;i++){
//                classArgs[i] = args[i].getClass();
//            }
//            clazz.getMethod(methodName,classArgs);
//        }
    }

    @After("execution(* com.xiao.controller.*Controller.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        long time = new Date().getTime() - visitTime.getTime();  //获取访问时长
        String url = "";
        //获取url
        if(clazz != null && method!= null && clazz != LogAop.class){
            RequestMapping classAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if(classAnnotation != null){
                String[] classValue = classAnnotation.value();

                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if(methodAnnotation != null){
                    String[] methodValue = methodAnnotation.value();
                    url = classValue[0]+methodValue[0];

                    //获取访问ip地址
                    String ip = request.getRemoteAddr();
                    SysLog sysLog = new SysLog();
                    //获取当前操作的用户
                    if(SecurityContextHolder.getContext() == null){
                        return;
                    }
                    SecurityContext context = SecurityContextHolder.getContext();  //从上下文中获取当前登录的用户
                    if(context.getAuthentication() == null){
                        return;
                    }
//                    if(context.getAuthentication() != null){
//                        User user = (User)context.getAuthentication().getPrincipal();
//                        String username = user.getUsername();
//                        sysLog.setUsername(username);
//                    }
//                    User user = (User)context.getAuthentication().getPrincipal();
                    User user = (User)context.getAuthentication().getPrincipal();
                    String username = user.getUsername();
                    sysLog.setUsername(username);

                    //封装到SysLog

                    sysLog.setExecutionTime(time);  //执行时长
                    sysLog.setIp(ip);
                    sysLog.setUrl(url);

                    sysLog.setMethod("[类名] " + clazz.getName() + "[方法名] " + method.getName());
                    sysLog.setVisitTime(visitTime);


                    sysLogService.save(sysLog);
                }
            }
        }

    }
}
