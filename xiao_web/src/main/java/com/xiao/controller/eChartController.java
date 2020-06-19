package com.xiao.controller;

import com.xiao.domain.Borrow;
import com.xiao.domain.UserInfo;
import com.xiao.domain.borrowBookHotSort;
import com.xiao.service.IEchartService;
import com.xiao.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Transactional
@RequestMapping("/eChart")
public class eChartController {

    @Autowired
    private IEchartService echartService;
    @Autowired
    private IUserService userService;

    /**
     * 测试图标
     * @return
     */
    @RequestMapping("/test.do")
    @ResponseBody
    public Map<String,Object> test(){
        System.out.println("==========================进入eChart里");
        /*销量*/
        Integer[] salesVolume = {10,100,20,56,35,80};
        /*营业额*/
        double[] bussinessVolume = {10*10,100*8.5,20*9.5,56*9,35*9.5,80*9};
        /*横轴, 月份数据*/
        String[] months = {"1","2","3","4","5","6"};
        Map<String,Object> map = new HashMap<>();
        map.put("salesVolume",salesVolume);
        map.put("bussinessVolume",bussinessVolume);
        map.put("months",months);
        return map;
    }

    /**
     * 业务：在首页图标显示
     * 借阅信息比例
     * @return
     */
    @RequestMapping("/borrow.do")
    @ResponseBody
    public Map<String,Object> borrow(){
        Map<String,Object> map = new HashMap<>();
        //查询今日至前6天的
        //总借阅
        List<Integer> borrowNum = echartService.borrowNum();
        map.put("borrowNum",borrowNum);
        //今天借阅数量
        List<Integer> todayBorrowNum = echartService.todayBorrowNum();
        map.put("todayBorrowNum",todayBorrowNum);
        //获取今日前一周的日期
        List<String> dateNum = echartService.dateNum();
        map.put("dateNum",dateNum);
        List<Integer> backNum = echartService.BackNum();
        map.put("backNum",backNum);
        List<Integer> todayBackNum = echartService.todayBackNum();
        map.put("todayBackNum",todayBackNum);
        return map;
    }

    /**
     * 首页图表显示：我的借阅数量比例
     * @return
     */
    @RequestMapping("/myBorrow.do")
    @ResponseBody
    public Map<String,Object> MyBorrow(){
        Map<String,Object> map = new HashMap<>();
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User)context.getAuthentication().getPrincipal();
        String username = user.getUsername();
        System.out.println("--------------" + username);
        UserInfo userInfo = userService.queryByName(username);
        String userInfoId = userInfo.getId();
        //获取今日前一周的日期
        List<String> dateNum = echartService.dateNum();
        map.put("dateNum",dateNum);
        //查询今日至前6天的
        //总借阅
        List<Integer> borrowNum = echartService.myBorrowNum(userInfoId);
        map.put("borrowNum",borrowNum);
        //获取今日借阅
        List<Integer> todayMyBorrowNum = echartService.todayMyBorrowNum(userInfoId);
        map.put("todayMyBorrowNum",todayMyBorrowNum);

        return map;
    }

    /**
     * 业务：首页图书排行
     * 图书借阅排行
     * @return
     */
    @RequestMapping("/borrowBookHotSort.do")
    public ModelAndView borrowBookHotSort(){
        ModelAndView mv = new ModelAndView();
        int count = echartService.selectBorrowCount();
        List<borrowBookHotSort> bookHotSort = echartService.borrowBookHotSort();
        System.out.println("------------------------------------------");
        System.out.println(bookHotSort.toString());
        for (borrowBookHotSort sort : bookHotSort) {
            System.out.println(sort.toString());
        }
        mv.setViewName("index-book-sort");
        mv.addObject("bookHotSort",bookHotSort);
        mv.addObject("count",count);
        return mv;
    }
}
