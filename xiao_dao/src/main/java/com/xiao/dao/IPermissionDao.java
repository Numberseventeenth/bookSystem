package com.xiao.dao;

import com.xiao.domain.Permission;
import com.xiao.domain.Role;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IPermissionDao {

    @Select("select * from permission where id in(select permissionId from role_permission where roleId=#{id})")
    List<Permission> findPermissionByRoleId(String id)throws Exception;

    @Select("select * from permission")
    List<Permission> findAll()throws Exception;

    @Insert("insert into permission(permissionName,url)values(#{permissionName},#{url})")
    void save(Permission permission);

    @Select("SELECT * FROM role WHERE id IN (SELECT roleid FROM role_permission WHERE permissionid=#{permissionId})")
    List<Role> findPermissionByUser(String permissionId);

    @Delete("delete from role_permission where permissionid=#{permissionId}")
    void delete(String permissionId);

    @Delete("delete from permission where id=#{permissionId}")
    void deletePermission(String permissionId);
}
