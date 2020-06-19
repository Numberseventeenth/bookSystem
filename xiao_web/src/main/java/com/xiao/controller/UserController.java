package com.xiao.controller;


import com.github.pagehelper.PageInfo;
import com.xiao.domain.Role;
import com.xiao.domain.UserInfo;
import com.xiao.service.IRoleService;
import com.xiao.service.IUserService;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
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

import javax.annotation.security.RolesAllowed;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleService roleService;



    /**
     * 业务：用户注册成功后返回到登录页面
     * 定位到登录页面
     * @return
     */
    @RequestMapping("/loginPage.do")
    public ModelAndView loginPage(){
        ModelAndView mv = new ModelAndView();
        mv.addObject("status","注册成功");
        mv.setViewName("../login");
        return mv;
    }

    /**
     * 业务：添加用户之前查询
     * 查询所有角色
     * @return
     * @throws Exception
     */
    @RequestMapping("/findRole.do")
    public ModelAndView findRole()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll();
        mv.addObject("roleList",roleList);
        mv.setViewName("user-add");
        return mv;
    }

    /**
     * 分页查询全部用户
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    @RolesAllowed("ADMIN")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,
            defaultValue = "1") Integer page,@RequestParam(value = "size",required = true,
            defaultValue = "10")Integer size) throws Exception {
        ModelAndView mv =  new ModelAndView();
        List<UserInfo> list = userService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(list);
//        System.out.println("进入userController.....");
//        for(UserInfo user : list){
//            System.out.println(user.toString());
//        }
        List<Role> roles = roleService.findAll();
        System.out.println("---------------------------");
        for(Role r : roles){
            System.out.println(r);
        }
        mv.addObject("roles",roles);
        mv.setViewName("user-list");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

    /**
     * 新增用户
     * @param userInfo
     * @param flag
     * @return
     * @throws Exception
     */
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo, @Param("flag")int flag)throws Exception{
        System.out.println("....................");
        System.out.println(flag);
        System.out.println(userInfo.getRoleId());
        UserInfo is = userService.queryByName(userInfo.getUsername());
        if(is == null){
            userService.save(userInfo);
        }else{
            //注册失败
        }
        if(flag == 1){
            //跳转到登录页面
            return "redirect:loginPage.do";
        }
        return "redirect:findAll.do";
    }

    /**
     * 用户详情页
     * 根据用户id查询
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById.do")
    @RolesAllowed("ADMIN")
    public ModelAndView findById(String id)throws Exception{
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        Date oldDate = userInfo.getCreateTime();
        Date nowDate = new Date();
        long diff = nowDate.getTime() - oldDate.getTime();
        long day = diff / (1000 * 60 * 60 * 24);
        mv.addObject("days",day);
        mv.addObject("user",userInfo);
        mv.addObject("flag","0");
        mv.setViewName("user-show");
        return mv;
    }

    /**
     * 根据用户id查询该用户拥有的角色
     * @param userId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name="id",required = true) String userId) throws Exception {
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(userId);
        List<Role> otherRoles = userService.findOtherRole(userId);
        mv.addObject("user",userInfo);
        mv.addObject("roleList",otherRoles);
        mv.setViewName("user-role-add");
        return mv;
    }

    /**
     * 用户添加角色
     * @param userId
     * @param roleIds
     * @return
     */
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name="userId",required = true) String userId,
                              @RequestParam(name = "ids",required = true) String[] roleIds){
        userService.addRoleToUser(userId,roleIds);
        return "redirect:findAll.do";
    }

    /**
     * 修改用户信息
     * @param userInfo
     * @param pictureFile
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateUser.do")
    public String updateUser(UserInfo userInfo,MultipartFile pictureFile,
                             @RequestParam("flag")String flag) throws Exception {
//        MultipartFile pictureFile = null;
//        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
//        if (isMultipart) {
//            MultipartHttpServletRequest multipartRequest = WebUtils.getNativeRequest(request, MultipartHttpServletRequest.class);
//            pictureFile = multipartRequest.getFile("file");
//            System.out.println(pictureFile.getOriginalFilename());
//            String newName = UUID.randomUUID().toString();
//            String oldName = pictureFile.getOriginalFilename();
//            String sux = oldName.substring(oldName.lastIndexOf("."));
//            File file = new File("E:\\bookAd\\user\\" + newName + sux);
//            pictureFile.transferTo(file);
//            userInfo.setImg(newName + sux);
//        }
        System.out.println("-----------------------------");
        System.out.println(flag);
        System.out.println(userInfo.getStatus());
        System.out.println(pictureFile);
        System.out.println(pictureFile.getOriginalFilename());
        userInfo.setImg(userInfo.getImg());
        if (StringUtils.isNotBlank(pictureFile.getOriginalFilename())){
            String newName = UUID.randomUUID().toString();
            String oldName = pictureFile.getOriginalFilename();
            System.out.println(oldName);
            String sux = oldName.substring(oldName.lastIndexOf("."));
            System.out.println(sux);
            File file = new File("E:\\bookAd\\user\\" + newName + sux);
            pictureFile.transferTo(file);
            userInfo.setImg(newName + sux);
        }

        userService.updateUser(userInfo);
//        return "redirect:findAll.do";
        if(flag.equals("1")){
            return "forward:queryOne.do";
        }
        return "forward:findById.do";
    }

    /**
     * option查询用户
     * @param queryId
     * @return
     */
    @RequestMapping("/selectUser.do")
    public ModelAndView selectUser(@RequestParam(name = "queryId")String queryId){
        //1-管理员
        //2-超级管理员
        //3-普通用户
//        <option value="4">开启状态</option>
//        <option value="5">关闭状态</option>
        System.out.println("---------------------------");
        System.out.println(queryId);
        ModelAndView mv = new ModelAndView();
        List<UserInfo> users = userService.selectUser(queryId);
        mv.addObject("users",users);
        mv.setViewName("user-list-select");
        return mv;
    }

    /**
     * 模糊查询
     * 根据用户名字、电话、email查询
     * @param queryValue
     * @return
     */
    @RequestMapping("/queryUserNameAndPhoneAndEmail.do")
    public ModelAndView queryUserNameAndPhoneAndEmail(String queryValue){
        ModelAndView mv = new ModelAndView();
        List<UserInfo> users = userService.queryUserNameAndPhoneAndEmail(queryValue.trim());
        mv.addObject("users",users);
        mv.setViewName("user-query-list");
        return mv;
    }

    /**
     * 业务：reNew续借业务
     * 根据用户查询用户和借书记录
     * @param queryValue 用户名字和手机号码
     * @return
     */
    @RequestMapping("/queryUserAndBorrows.do")
    public ModelAndView queryUserAndBorrows(String queryValue){
        System.out.println("---------------------------" + queryValue);
        ModelAndView mv = new ModelAndView();
        List<UserInfo> users = userService.queryUserAndBorrows(queryValue);
        mv.addObject("users",users);
        mv.setViewName("users-borrow-list");
        return mv;
    }

    /**
     * 业务：用户页面续借图书
     * @return
     */
    @RequestMapping("/myQueryUserAndBorrow.do")
    public ModelAndView myQueryUserAndBorrow(){
        ModelAndView mv = new ModelAndView();
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User)context.getAuthentication().getPrincipal();
        String username = user.getUsername();
        List<UserInfo> users = userService.queryUserAndBorrows(username);
        mv.addObject("users",users);
        mv.setViewName("my-borrow-renew-page-list");
        return mv;
    }



    /**
     * 业务：个人资料
     * 从security中获取用户
     */
    @RequestMapping("/queryOne.do")
    public ModelAndView queryOne(){
        String flag = "1";
        ModelAndView mv = new ModelAndView();
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User)context.getAuthentication().getPrincipal();
        String username = user.getUsername();
        System.out.println("--------------" + username);
        UserInfo userInfo = userService.queryByName(username);
//        UserInfo userInfo = userUtils.ByUser();
        System.out.println(userInfo.toString());
        Date oldDate = userInfo.getCreateTime();
        Date nowDate = new Date();
        long diff = nowDate.getTime() - oldDate.getTime();
        long day = diff / (1000 * 60 * 60 * 24);
        mv.addObject("days",day);
        mv.addObject("user",userInfo);
        mv.addObject("flag",flag);
        mv.setViewName("user-show");
        return mv;
    }

    /**
     * 业务：用户取书
     * 根据用户名（邮箱，电话）查询用户以及该用户预借未取走的图书
     * @param queryValue
     * @return
     */
    @RequestMapping("/queryUserAndAdvanceBook.do")
    public ModelAndView queryUserAndAdvanceBook(@RequestParam("queryValue")String queryValue){
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userInfos = userService.queryUserAndAdvanceBook(queryValue);
        mv.addObject("users",userInfos);
        mv.setViewName("users-advance-list");
        return mv;
    }


    /**
     * 业务：注册用户名提示
     * @return 0:没有 1-有
     */
    @RequestMapping("/queryUsername.do")
    @ResponseBody
    public int queryUsername(@RequestParam("username")String username){
        UserInfo userInfo = userService.queryByName(username);
        if(userInfo != null){
            return 1;
        }
        return 0;
    }



}
