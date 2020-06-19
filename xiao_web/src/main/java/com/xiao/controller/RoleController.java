package com.xiao.controller;


import com.xiao.domain.Permission;
import com.xiao.domain.Role;
import com.xiao.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    /**
     * 查询全部角色信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll();
        mv.addObject("roleList",roleList);
        mv.setViewName("role-list");
        return mv;
    }

    /**
     * 增加角色
     * @param role
     * @return
     */
    @RequestMapping("/save.do")
    public String save(Role role){
        roleService.save(role);
        return "redirect:findAll.do";
    }

    /**
     * 根据角色id查询该角色所有权限
     * @param roleId
     * @return
     */
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id",required = true) String roleId){
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(roleId);
        List<Permission> otherPermission = roleService.findOtherPermission(roleId);
        mv.addObject("role",role);
        //System.out.println(role.getId());
        mv.addObject("permissionList",otherPermission);
        mv.setViewName("role-permission-add");
        return mv;
    }

    /**
     * 业务：给角色添加资源权限
     * 添加权限
     * @param roleId
     * @param permissionIds
     * @return
     */
    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name = "roleId",required = true)String roleId,
                                    @RequestParam(name = "ids",required = true)String[] permissionIds){
        roleService.addPermissionToRole(roleId,permissionIds);
        System.out.println(roleId);
        for (String permissionId : permissionIds) {
            System.out.println(permissionId);
        }
        return "redirect:findAll.do";
    }

    /**
     * 业务：角色详情页
     * 根据角色id查询角色信息
     * @param id
     * @return
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id){
        ModelAndView mv = new ModelAndView();
        List<Permission> permissions = roleService.findPermissionByRoleId(id);
        for(Permission p : permissions){
            System.out.println(p);
        }
        mv.addObject("permissions",permissions);
        mv.setViewName("role-show");
        return mv;
    }

    /**
     * 删除角色
     * @param id
     * @return
     */
    @RequestMapping("/deleteRole.do")
    @ResponseBody
    public int deleteRole(String id){
        System.out.println("---------------------"+id);
        int i = roleService.deleteRole(id);
        System.out.println("返回删除角色result" + i);
        return i;
    }

}
