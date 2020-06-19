package com.xiao.controller;

import com.github.pagehelper.PageInfo;
import com.xiao.domain.Book;
import com.xiao.domain.Borrow;
import com.xiao.domain.ReNew;
import com.xiao.domain.UserInfo;
import com.xiao.service.BookService;
import com.xiao.service.IBorrowService;
import com.xiao.service.IReNewService;
import com.xiao.service.IUserService;
import com.xiao.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/borrow")
@Transactional
public class BorrowController {

    @Autowired
    private IBorrowService borrowService;
    @Autowired
    private BookService bookService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IReNewService reNewService;




    /**
     * 借阅书籍 status=1
     * 归还书籍 status=0
     * @param user_id
     * @param book_isbn
     * @param status
     * @return  1:成功   0：失败
     */
    @RequestMapping("/borrow.do")
    @ResponseBody
    public int borrow(@RequestParam(name = "user_id",required = true)Integer user_id,
                         @RequestParam(name = "book_isbn",required = true)String book_isbn,
                         @RequestParam(name = "submitStatus",required = true)Integer status,
                         @RequestParam(name = "b_ruin_int",required = true)String b_ruin_int,
                         @RequestParam("b_ruin")String b_ruin,
                         @RequestParam("b_compensate")String b_compensate,
                         @RequestParam("b_ruin_level")String b_ruin_level,
                         @RequestParam("b_lose")String b_lose){
        System.out.println("===================================");




        if(status == 1){
            //当借阅图书为0时，借出失败
            Book byId = bookService.findById(book_isbn);
            int book_count = byId.getBook_count();
            int book_borrow = byId.getBook_borrow();
            int residue  = book_count - book_borrow;
            if(residue <= 0){
                //借出失败
                return 0;
            }
            //借阅
            Borrow borrow = new Borrow();
            borrow.setM_id(user_id);
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
        }
        if(status == 0){
            System.out.println(user_id);
            System.out.println(book_isbn);
            System.out.println(status);
            //归还
            //2.修改图书状态码

            //b_ruin_int 是否损坏 0-无损坏 1-有损坏 默认0
            //b_ruin 损坏记录 string   可以没有
            //b_compensate  赔偿金额记录string   可以没有
            //b_ruin_level  损坏程度  默认0
//                <option value="0">0%</option>
//                <option value="1">1%-30%</option>
//                <option value="2">30%-70%</option>
//                <option value="3">70%-100%</option>
            //b_lose   是否丢失  0-没有丢失（默认）  1-丢失
            if(b_ruin != null){
                System.out.println(b_ruin);
            }
            if(b_compensate != null){
                System.out.println(b_compensate);
            }
            System.out.println(b_ruin_int);
            System.out.println(b_ruin_level);
            System.out.println(b_lose);
            borrowService.back(user_id,book_isbn,b_ruin,b_lose,b_compensate,b_ruin_int,b_ruin_level);

            //归还之后book_borrow-1
            //和修改图书信息冲突
            /*Book book = bookService.findById(book_isbn);
            book.setBook_borrow(book.getBook_borrow()-1);
            bookService.update(book);*/
            //判断图书是否丢失
            bookService.updateBack(book_isbn,b_lose);

            System.out.println("已归还");
        }
        //返回1表示借阅和归还成功
        return 1;
    }

    /**
     * 分页查询全部借阅信息
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,
            defaultValue = "1") Integer page,@RequestParam(value = "size",required = true,
            defaultValue = "4")Integer size,
                                @RequestParam("flag")String flag){
        ModelAndView mv = new ModelAndView();
        List<Borrow> borrows = borrowService.findAll(page,size);
        for(Borrow b : borrows){
            System.out.println("=========================");
            System.out.println(b);
        }
        PageInfo pageInfo = new PageInfo(borrows);
        mv.addObject("flag",flag);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("borrow-page-list");
        return mv;
    }

    /**
     * 模糊查询借阅信息
     * @param queryValue
     * @return
     */
    @RequestMapping("/query.do")
    public ModelAndView query(@RequestParam("queryValue")String queryValue){
        ModelAndView mv = new ModelAndView();
        List<Borrow> borrows = borrowService.query(queryValue);
        mv.addObject("borrows",borrows);
        mv.setViewName("borrow-query-list");
        return mv;
    }


    /**
     * 续借图书
     * @param user_id
     * @param bookIds
     * @param b_renew
     * @return
     */
    @RequestMapping("/renew.do")
    @ResponseBody
    public int renew(@RequestParam(name = "user_id",required = true)String user_id,
                     @RequestParam(name = "book",required = true)String bookIds,
                     @RequestParam(name = "b_renew",required = true)String b_renew){
//        System.out.println("---------------------"+user_id);
//        System.out.println("---------------------"+b_renew);
//        System.out.println(bookIds);
        //先转换bookIds为集合
        String[] bookIsbns = bookIds.split(",");
        try {
            for (String bookIsbn : bookIsbns) {
                System.out.println(bookIsbn);
                //修改续借天数(b_renew)和图书应该归还时间(b_end)，b_day+续借的天数，
                //一个一个修改
                borrowService.updateRenew(user_id,bookIsbn,b_renew);
                //成功返回1
            }
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 业务：我的续借图书（待审核）
     * @return 0-失败 1-成功
     */
    @RequestMapping("/myReNew.do")
    @ResponseBody
    public int myNew(@RequestParam(name = "userid",required = true)String userid,
                     @RequestParam(name = "book",required = true)String bookIds,
                     @RequestParam(name = "renew",required = true)String renew){
        String[] bookIsbns = bookIds.split(",");
        try {
            for (String book_isbn : bookIsbns) {
                //插入我的预续借中
                reNewService.insert(userid,book_isbn,renew);
            }
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 查询我的续借图书列表
     * @return
     */
    @RequestMapping("/myNewList.do")
    public ModelAndView myNewList(){
        ModelAndView mv = new ModelAndView();
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User)context.getAuthentication().getPrincipal();
        UserInfo userInfo = userService.queryByName(user.getUsername());
        String userid = userInfo.getId();
        List<ReNew> renews = reNewService.findByUserId(userid);
        mv.addObject("renews",renews);
        mv.setViewName("renew-page-list");
        return mv;
    }

    /**
     * 管理员操作：查询审核的续借图书
     * @return
     */
    @RequestMapping("/myReNewList.do")
    public ModelAndView myReNewList(){
        ModelAndView mv = new ModelAndView();
        List<ReNew> renews = reNewService.findByStatus2();
        System.out.println("------------------------------");
        for (ReNew renew : renews) {
            System.out.println(renew.toString());
        }
        mv.addObject("renews",renews);
        mv.setViewName("renew-page-list-admin");
        return mv;
    }

    /**
     * 管理员审核续借图书
     * @param userid
     * @param book_isbn
     * @param status 0-失败 1-成功
     * @return
     */
    @RequestMapping("/checkReNew.do")
    @ResponseBody
    public int checkReNew(@RequestParam(value = "userid",required = true)String userid,
                          @RequestParam(value = "book_isbn",required = true)String book_isbn,
                          @RequestParam(value = "status",required = true)Integer status,
                          @RequestParam(value = "renew")String renew){
        //status：0-通过，1-失败
        //修改renew表中的status值和operate_time的值
        try {
            reNewService.update(userid,book_isbn,status);
            if(status == 0){
                //审核成功
                //添加到borrow中
                borrowService.updateRenew(userid,book_isbn,renew);
                return 1;
            }else if(status == 1){
                //审核失败，借阅失败
                return 2;
            }
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
        return 0;
    }


    /**
     * 查询我的借阅图书信息
     * @return
     */
    @RequestMapping("/myBorrowList.do")
    public ModelAndView myBorrowList(@RequestParam("flag")String flag){
        ModelAndView mv = new ModelAndView();
        //查询借阅用户信息
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User)context.getAuthentication().getPrincipal();
        String username = user.getUsername();
        System.out.println("--------------" + username);
        UserInfo userInfo = userService.queryByName(username);
        String userid = userInfo.getId();
//        String userid = userUtils.byUserId();
        List<Borrow> borrowList = borrowService.findByUserId(userid);
        mv.addObject("borrowList",borrowList);
        mv.addObject("flag",flag);
        mv.setViewName("borrow-page-list");
        return mv;
    }

}
