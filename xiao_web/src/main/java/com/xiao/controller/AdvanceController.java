package com.xiao.controller;


import com.xiao.domain.Advance;
import com.xiao.domain.Book;
import com.xiao.domain.Borrow;
import com.xiao.domain.UserInfo;
import com.xiao.service.*;
import com.xiao.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping("/advance")
public class AdvanceController {

    @Autowired
    private IAdvanceService advanceService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IBorrowService borrowService;
    @Autowired
    private BookService bookService;
    @Autowired
    private IReNewService reNewService;

    /**
     * 我的预借图书列表
     * @return
     */
    @RequestMapping("/MyadvanceList.do")
    public ModelAndView MyadvanceList(){
        ModelAndView mv = new ModelAndView();
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User)context.getAuthentication().getPrincipal();
        String username = user.getUsername();
        System.out.println("--------------" + username);
        UserInfo userInfo = userService.queryByName(username);
        String userid = userInfo.getId();
//        String userid = userUtils.byUserId();
        List<Advance> MyAdvanceList = advanceService.findByUserId(userid);
        for (Advance advance : MyAdvanceList) {
            System.out.println(advance.toString());
        }
        mv.addObject("MyAdvanceList",MyAdvanceList);

        mv.setViewName("advance-page-list");
        return mv;
    }

    /**
     * 业务：待审核预借图书
     * 查询flag为2的advance
     * @return
     */
    @RequestMapping("/advanceByFlag.do")
    public ModelAndView advanceByFlag(){
        ModelAndView mv = new ModelAndView();
        List<Advance> advanceList = advanceService.findByFlag();
        mv.addObject("advanceList",advanceList);
        mv.setViewName("advance-page-list-admin");
        return mv;
    }

    /**
     * 业务：通知管理员有多少个待审核预借图书和续借图书
     * 查询flag=2的预借
     * @return
     */
    @RequestMapping("/countFlag.do")
    @ResponseBody
    public Map<String,Integer> countFlag(){
        Map<String,Integer> message = new HashMap<>();
        int advance = advanceService.countFlag();
        int renew = reNewService.countStatus2();
        message.put("advance",advance);
        message.put("renew",renew);
        return message;
    }

    /**
     * 业务：管理员审核预借图书
     * @param userid
     * @param book_isbn
     * @param status
     * @return 0-服务器出现异常 1-审核成功，待用户取书 2-审核失败
     */
    @RequestMapping("/checkAdvance.do")
    @ResponseBody
    public int checkAdvance(@RequestParam(value = "userid",required = true)String userid,
                            @RequestParam(value = "book_isbn",required = true)String book_isbn,
                            @RequestParam(value = "status",required = true)Integer status){
        //如果点击审核通过，但是书籍数量不足，则审核失败
        Book byId = bookService.findById(book_isbn);
        int book_count = byId.getBook_count();
        int book_borrow = byId.getBook_borrow();
        int residue  = book_count - book_borrow;
        if(residue <= 0){
            //借出失败
            status = 1;
        }
        //1.都要修改flag和operateTIme(全局修改)
        try {
            advanceService.update(userid,book_isbn,status);
            if(status == 0){
                //审核通过
                //2.添加到borrow表中，用户显示待取书籍
                //当借阅图书为0时，借出失败(前面已经判断)
                //借阅
                Borrow borrow = new Borrow();
                borrow.setM_id(Integer.valueOf(userid));
                borrow.setBook_isbn(book_isbn);
                Date StartDate = new Date();
                borrow.setB_start(StartDate);

                //end = start + 30天
                String startDateStr = DateUtils.date2String(StartDate,"yyyy-MM-dd HH:mm:ss");
                System.out.println("现在的日期是:" + startDateStr);
                Calendar ca = Calendar.getInstance();
                ca.add(Calendar.DATE,30);
                Date endDate = ca.getTime();
                String endDateStr = DateUtils.date2String(endDate,"yyyy-MM-dd HH:mm:ss");
                System.out.println("增加天数以后的日期：" + endDateStr);

                borrow.setB_end(endDate);

                borrowService.borrow(borrow);

                //借阅之后库存不变
                //book_borrow-1  数借出数-1
                //和修改图书信息冲突
                /*Book book = bookService.findById(book_isbn);
                book.setBook_borrow(book.getBook_borrow()+1);
                bookService.update(book);*/
                //借出之后该图书-1
                bookService.updateBorrow(book_isbn);
                System.out.println("借出一本");
                return 1;
            }else if(status == 1){
                //审核失败
                return 2;
            }
            return 2;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 业务：用户取书籍
     * 多选书籍
     * @param userid
     * @param bookIds
     * @return
     */
    @RequestMapping("/takeBook.do")
    @ResponseBody
    public int takeBook(@RequestParam(name = "user_id",required = true)String userid,
                        @RequestParam(name = "book",required = true)String bookIds){
        String[] bookIsbns = bookIds.split(",");
        try {
            for (String bookIsbn : bookIsbns) {
                System.out.println(bookIsbn);
                //修改续借天数(b_renew)和图书应该归还时间(b_end)，b_day+续借的天数，
                //一个一个修改
                advanceService.updateTake(userid, bookIsbn);
                //成功返回1
            }
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
}
