package com.xiao.controller;


import com.xiao.domain.Permission;
import com.xiao.domain.Role;
import com.xiao.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    /**
     * 查询全部资源权限
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Permission> list = permissionService.findAll();
        mv.addObject("permissionList",list);
        mv.setViewName("permission-list");
        return mv;
    }

    /**
     * 增加资源权限
     * @param permission
     * @return
     * @throws Exception
     */
    @RequestMapping("/save.do")
    public String save(Permission permission)throws Exception{
        permissionService.save(permission);
        return "redirect:findAll.do";
    }

    /**
     * 删除权限
     * @param id
     * @return
     */
    @RequestMapping("/deletePermission.do")
    @ResponseBody
    public int deletePermission(String id){
        System.out.println("进入controller中，进行删除操作。。。。。。。。。。。");
        int result = permissionService.deletePermission(id);
        return result;
    }

    /**
     * 权限详情：查询哪些角色用到了此权限
     * @param id
     * @return
     */
    @RequestMapping("/findById.do")
    public ModelAndView findPermissionById(String id){
        ModelAndView mv = new ModelAndView();
        List<Role> roles = permissionService.findById(id);
        mv.addObject("roles",roles);
        mv.setViewName("permission-show");
        return mv;
    }
}
