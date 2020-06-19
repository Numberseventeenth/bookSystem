package com.xiao.service;


import com.xiao.domain.Permission;
import com.xiao.domain.Role;

import java.util.List;

public interface IPermissionService {

    List<Permission> findAll()throws Exception;

    void save(Permission permission);

    int deletePermission(String permissionId);

    List<Role> findById(String permissionId);
}
