package com.xiao.controller;


import com.github.pagehelper.PageInfo;
import com.xiao.domain.SysLog;
import com.xiao.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/sysLog")
public class SysLogController {

    @Autowired
    private ISysLogService sysLogService;

    /**
     * 分页查询全部日志
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView sysLog(@RequestParam(name = "page",required = true,
            defaultValue = "1") Integer page,@RequestParam(value = "size",required = true,
            defaultValue = "4")Integer size){
        ModelAndView mv = new ModelAndView();
        List<SysLog> list = sysLogService.findAll(page,size);
        System.out.println("-------------------------");
        for(SysLog sysLog : list){
            System.out.println(sysLog.toString());
        }
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("syslog-list");
        return mv;
    }
}
