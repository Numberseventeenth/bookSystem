package com.xiao.controller;

import com.github.pagehelper.PageInfo;
import com.xiao.domain.Advance;
import com.xiao.domain.Book;
import com.xiao.domain.Category;
import com.xiao.domain.UserInfo;
import com.xiao.service.BookService;
import com.xiao.service.IAdvanceService;
import com.xiao.service.ICategoryService;
import com.xiao.service.IUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IAdvanceService advanceService;



    /**
     * 业务：图书表单购入
     * 全部图书类别
     * @return
     * @throws Exception
     */
    @RequestMapping("/findCategory.do")
    public ModelAndView findCategory()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Category> categoryList = bookService.findCategory();
        System.out.println(categoryList);
        mv.addObject("categoryList",categoryList);
        mv.setViewName("book-add");
        return mv;
    }

    /**
     *
     * @return
     */
    @RequestMapping("/find")
    public List<Category> findAll(){
        List<Category> categoryList = bookService.findCategory();
        return categoryList;
    }

    /**
     * 保存图书
     * @param book
     * @return 返回到全部图书
     * @throws Exception
     */
    @RequestMapping("/save.do")
    public String save(Book book)throws Exception{
        bookService.save(book);
        return "redirect:findAll.do";
    }

    /**
     *分页查询图书信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,
            defaultValue = "1") Integer page,@RequestParam(value = "size",required = true,
            defaultValue = "20")Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Book> books = bookService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(books);
        System.out.println(books);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("book-page-list");
        return mv;
    }

    /**
     * 根据isbn查询图书
     * @param isbn
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById")
    public ModelAndView findById(@RequestParam(name = "id",required = true)String isbn)throws Exception{
        ModelAndView mv = new ModelAndView();
        Book book = bookService.findById(isbn);
        mv.addObject("book",book);
        mv.setViewName("book-show");
        return mv;
    }

    /**
     * 业务：图书添加上
     * 返回json数据的查询
     * @param isbn
     * @return
     */
    @RequestMapping("/findByIdJSON.do")
    @ResponseBody
    public int findByIdJSON(@RequestParam(name = "id",required = true)String isbn){
        Book book = bookService.findById(isbn);
        if(book == null){
            return 0;
        }else{
            return 1;
        }
    }

    /**
     * 业务：修改图书信息之前的查询
     * 根据图书ISBN查询图书信息
     * @param isbn
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateById.do")
    public ModelAndView updateById(@RequestParam(name = "book_isbn",required = true)String isbn)throws Exception{
        ModelAndView mv = new ModelAndView();
        Book book = bookService.findById(isbn);
        List<Category> categoryList = bookService.findCategory();
        mv.addObject("categoryList",categoryList);
        mv.addObject("book",book);
        mv.setViewName("book-update");
        return mv;
    }

//    @RequestMapping("/update.do")
//    public ModelAndView update(Book book)throws Exception{
//        System.out.println(book);
//        ModelAndView mv = new ModelAndView();
//        bookService.update(book);
//        Book newBook = bookService.findById(book.getBook_isbn());
//        mv.addObject("newBook",newBook);
//        mv.setViewName("book-update");
//        return mv;
//    }

    /**
     * 修改图书信息
     * @param book
     * @param pictureFile
     * @return
     * @throws Exception
     */
    @RequestMapping("/update.do")
    public String update(Book book, MultipartFile pictureFile)throws Exception{
        //添加图片
        System.out.println("-----------------------------");
        System.out.println(pictureFile);
        System.out.println(pictureFile.getOriginalFilename());
        if (StringUtils.isNotBlank(pictureFile.getOriginalFilename())){
            String newName = UUID.randomUUID().toString();
            String oldName = pictureFile.getOriginalFilename();
            System.out.println(oldName);
            String sux = oldName.substring(oldName.lastIndexOf("."));
            System.out.println(sux);
            File file = new File("E:\\bookAd\\book\\" + newName + sux);
            pictureFile.transferTo(file);
            book.setBook_img(newName + sux);
        }
        System.out.println(book);
        bookService.update(book);
        return "forward:updateById.do";
    }

    /**
     * 业务：在图书信息页面搜索
     * 模糊查询图书
     * @param queryValue
     * @return
     */
    @RequestMapping("/query.do")
    public ModelAndView query(String queryValue){
        System.out.println("============================"+queryValue);
        ModelAndView mv = new ModelAndView();
        List<Book> books = bookService.query(queryValue.trim());
        mv.addObject("books",books);
        mv.setViewName("book-query-list");
        return mv;
    }

    /**
     * 根据图书isbn和名字查询
     * @param book
     * @return
     */
    @RequestMapping("/queryBookByNameAndIsbn.do")
    public ModelAndView queryBookByNameAndIsbn(String book){
        ModelAndView mv = new ModelAndView();
        List<Book> books = bookService.queryBookByNameAndIsbn(book.trim());
        mv.addObject("books",books);
        mv.setViewName("book-query-list");
        return mv;
    }

    /**
     * 修改图书下架 1-成功下架  0-修改失败
     * @param id
     * @return
     */
    @RequestMapping("/outById.do")
    @ResponseBody
    public int upfateOutById(@RequestParam("id")String id,
                             @RequestParam("out")String out){
        System.out.println("======================"+id);
        System.out.println("======================"+out);
        if(out.equals("1")){
            //下架
            out = "0";
            bookService.updateOutById(id,out);
            //成功下架
            return 1;
        }else if(out.equals("0")){
            //上架
            out = "1";
            bookService.updateOutById(id,out);
            //成功上架
            return 2;
        }
        return 0;
    }

    /**
     * 查找下架图书
     * @return
     */
    @RequestMapping("/queryBookByOut.do")
    public ModelAndView queryBookByOut(){
        ModelAndView mv = new ModelAndView();
        List<Book> books = bookService.queryBookByOut();
        for(Book b:books){
            System.out.println(b.toString());
        }
        mv.addObject("books",books);
        mv.setViewName("book-query-list");
        return mv;
    }

    /**
     * 图书类别业务
     * 查询全部图书类别
     * @return
     */
    @RequestMapping("findAllCategory.do")
    public ModelAndView findAllCategory(){
        ModelAndView mv = new ModelAndView();
        List<Category> categorys = bookService.findCategory();
        mv.addObject("categorys",categorys);
        mv.setViewName("category-page-list");
        return mv;
    }

    /**
     * 删除图书类别
     * @param c_id
     * @return
     */
    @RequestMapping("deleteCategoryById.do")
    @ResponseBody
    public int deleteCategoryById(@RequestParam("id")String c_id){
        System.out.println("----------------------" + c_id);
        try {
            //图书已经使用了该类别-->把该图书的类别全部改为0(没有类别)
            bookService.updateCIdByBook(c_id);
            //删除该类别
            bookService.deleteCategoryById(c_id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 新增图书类别
     * @param category
     * @return
     */
    @RequestMapping("saveCategory.do")
    public String saveCategory(Category category){
        categoryService.saveCategory(category);
        return "redirect:findAllCategory.do";
    }

    /**
     * 业务：普通用户(预借)
     * 预借图书
     * @param book_isbn
     * @return 0-失败 1-成功
     */
    @RequestMapping("/advanceBook.do")
    @ResponseBody
    public int advanceBook(@RequestParam("book_isbn") String book_isbn){
        //查询借阅用户信息
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User)context.getAuthentication().getPrincipal();
        String username = user.getUsername();
        System.out.println("--------------" + username);
        UserInfo userInfo = userService.queryByName(username);
        String userid = userInfo.getId();
//        String userid = userUtils.byUserId();
        try {
            advanceService.insertAdvance(userid,book_isbn);
            //预借表已插入
            //1.管理员根据时间处理预借图书（在借阅表中插入数据）
            //2.图书-1
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
        return 1;
    }



}
