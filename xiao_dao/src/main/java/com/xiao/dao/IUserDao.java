package com.xiao.dao;

import com.xiao.domain.Role;
import com.xiao.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IUserDao {

    @Select("select * from users where username=#{username}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = List.class,
                    many = @Many(select = "com.xiao.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findByUserName(String username)throws Exception;

    @Select("select * from users ORDER BY createTime DESC")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = List.class,
                    many = @Many(select = "com.xiao.dao.IRoleDao.findRoleByUserId"))
    })
    List<UserInfo> findAll()throws Exception;

    @Insert("insert into users(email,username,password,phoneNum,status,createTime)values(#{email},#{username},#{password},#{phoneNum},#{status},#{createTime})")
    void save(UserInfo userInfo);

    @Select("select * from users where id=#{id}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userrole",column = "userrole"),
            @Result(property = "img",column = "img"),
            @Result(property = "roles",column = "id",javaType = List.class,
                    many = @Many(select = "com.xiao.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findById(String id)throws Exception;

    @Select("select * from role where id not in(select roleId from users_role where userId=#{userId})")
    List<Role> findOtherRoles(String userId);

    @Insert("insert into users_role(userId,roleId)values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userId, @Param("roleId") String roleId);

//    @Update("update users,users_role set(username=#{username},email=#{email},phoneNum=#{phoneNum},status=#{status},roleid=#{roleId}) where users.id=users_role.userid and id=#{id}")
//    void updateUser(UserInfo userInfo);

    @Update("update users set username=#{username},email=#{email},phoneNum=#{phoneNum},status=#{status},img=#{img} where id=#{id}")
    void updateUser(UserInfo userInfo);

    @Update("update users_role set roleid=#{roleId} where userid=#{id}")
    void updateUserRole(UserInfo userInfo);

    @Select("select * from users where status=#{queryId}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userrole",column = "userrole"),
            @Result(property = "img",column = "img"),
            @Result(property = "roles",column = "id",javaType = List.class,
                    many = @Many(select = "com.xiao.dao.IRoleDao.findRoleByUserId"))
    })
    List<UserInfo> selectUserByStatus(String queryId);

    @Select("select * from users where id in (select userid from users_role where roleid=#{queryId})")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userrole",column = "userrole"),
            @Result(property = "img",column = "img"),
            @Result(property = "roles",column = "id",javaType = List.class,
                    many = @Many(select = "com.xiao.dao.IRoleDao.findRoleByUserId"))
    })
    List<UserInfo> selectUserByRole(String queryId);

    @Select("select * from users where username like #{queryValue} or phonenum like #{queryValue} or email like #{queryValue}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userrole",column = "userrole"),
            @Result(property = "img",column = "img"),
            @Result(property = "roles",column = "id",javaType = List.class,
                    many = @Many(select = "com.xiao.dao.IRoleDao.findRoleByUserId"))
    })
    List<UserInfo> queryUserNameAndPhoneAndEmail(String queryValue);
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userrole",column = "userrole"),
            @Result(property = "img",column = "img"),
            @Result(property = "borrows",column = "id",javaType = List.class,
                    many = @Many(select = "com.xiao.dao.IBorrowDao.queryByMid"))
    })
    @Select("select * from users where username=#{value} or phonenum=#{value} or email=#{value}")
    List<UserInfo> queryUserAndBorrows(String value);


    @Select("select * from users where username=#{value} or phonenum=#{value} or email=#{value}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userrole",column = "userrole"),
            @Result(property = "img",column = "img"),
            @Result(property = "advances",column = "id",javaType = List.class,
                    many = @Many(select = "com.xiao.dao.IAdvanceDao.findByUserId"))
    })
    List<UserInfo> queryUserAndAdvanceBook(String queryValue);
}
