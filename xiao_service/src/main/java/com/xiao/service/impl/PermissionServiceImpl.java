package com.xiao.service.impl;


import com.xiao.dao.IPermissionDao;
import com.xiao.domain.Permission;
import com.xiao.domain.Role;
import com.xiao.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImpl implements IPermissionService {

    @Autowired
    private IPermissionDao permissionDao;

    public List<Permission> findAll() throws Exception {
        return permissionDao.findAll();
    }

    public void save(Permission permission) {
        permissionDao.save(permission);
    }

    @Override
    public int deletePermission(String permissionId) {
        List<Role> roles = permissionDao.findPermissionByUser(permissionId);
        if(roles.size() == 0){
            System.out.println("执行删除语句");
            //可以删除,执行删除语句,删除role_permission表的记录，没有
//            permissionDao.delete(permissionId);
            //删除permission表的记录
            permissionDao.deletePermission(permissionId);
            return 0;
        }else{
            //取出角色（给出提示）
            System.out.println("删除失败");
            return 1;
        }
    }

    @Override
    public List<Role> findById(String permissionId) {
        List<Role> roles = permissionDao.findPermissionByUser(permissionId);
        return roles;
    }
}
