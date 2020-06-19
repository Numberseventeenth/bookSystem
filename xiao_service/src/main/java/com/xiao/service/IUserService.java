package com.xiao.service;


import com.xiao.domain.Role;
import com.xiao.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    List<UserInfo> findAll(Integer page, Integer size)throws Exception;

    void save(UserInfo userInfo)throws Exception;

    UserInfo findById(String id)throws Exception;

    List<Role> findOtherRole(String userId);

    void addRoleToUser(String userId, String[] roleIds);

    /**
     * 修改用户信息
     */
    void updateUser(UserInfo userInfo);

    /**
     * 用户导出excel表
     * @return
     */
    List<UserInfo> findAll() throws Exception;

    List<UserInfo> selectUser(String queryId);

    List<UserInfo> queryUserNameAndPhoneAndEmail(String queryValue);

    List<UserInfo> queryUserAndBorrows(String value);

    UserInfo queryByName(String username);

    List<UserInfo> queryUserAndAdvanceBook(String queryValue);

}
