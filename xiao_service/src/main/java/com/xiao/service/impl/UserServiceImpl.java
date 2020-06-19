package com.xiao.service.impl;


import com.github.pagehelper.PageHelper;
import com.xiao.dao.IUserDao;
import com.xiao.domain.Role;
import com.xiao.domain.UserInfo;
import com.xiao.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    //第十七版 123
    //测试用户36 321
    //测试用户37 123
    //borrow 000
    //测试用户313 000

    @Autowired
    private IUserDao userDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUserName(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        User user = new User(userInfo.getUsername(),"{noop}" + userInfo.getPassword(),getAuthority(userInfo.getRoles()));
        User user = new User(userInfo.getUsername(), userInfo.getPassword(),userInfo.getStatus()==0?false:true, true,true,true,getAuthority(userInfo.getRoles()));
        return user;


    }

    //集合中装入的是权限集合
    private List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));

        }
        return list;
    }

    public List<UserInfo> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return userDao.findAll();
    }

    public void save(UserInfo userInfo) throws Exception {
        userInfo.setCreateTime(new Date());

        //加密处理
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.save(userInfo);
        //先后顺序很重要
        UserInfo user = userDao.findByUserName(userInfo.getUsername());
        //给用户加角色
        userDao.addRoleToUser(user.getId(),String.valueOf(userInfo.getRoleId()));
    }

    public UserInfo findById(String id) throws Exception {
        return userDao.findById(id);
    }

    public List<Role> findOtherRole(String userId) {
        return userDao.findOtherRoles(userId);
    }

    public void addRoleToUser(String userId, String[] roleIds) {
        for (String roleId : roleIds) {
            userDao.addRoleToUser(userId,roleId);
        }
    }

    /**
     * 修改用户信息和用户角色
     * @param userInfo
     */
    @Override
    public void updateUser(UserInfo userInfo) {
        userDao.updateUser(userInfo);
        userDao.updateUserRole(userInfo);
    }

    @Override
    public List<UserInfo> findAll() throws Exception {
        return userDao.findAll();
    }

    @Override
    public List<UserInfo> selectUser(String queryId) {
        //1-管理员
        //2-超级管理员
        //3-普通用户
        //4-开启状态
        //5-关闭状态
        System.out.println("service里面的========="+queryId);
        List<UserInfo> users = null;
        if(queryId.equals("1") || queryId.equals("2") || queryId.equals("3")){
            //查询角色
            users = userDao.selectUserByRole(queryId);
            System.out.println("=========================");
            for (UserInfo user:users){
                System.out.println(user);
            }
        }else if(queryId.equals("4") || queryId.equals("5")){
            //查询status状态
            if(queryId.equals("4")){
                queryId = "1";
            }else if(queryId.equals("5")){
                queryId = "0";
            }
            users = userDao.selectUserByStatus(queryId);
        }
        return users;
    }

    @Override
    public List<UserInfo> queryUserNameAndPhoneAndEmail(String queryValue) {
        List<UserInfo> users = userDao.queryUserNameAndPhoneAndEmail("%" + queryValue + "%");
        return users;
    }

    @Override
    public List<UserInfo> queryUserAndBorrows(String value) {
        return userDao.queryUserAndBorrows(value);
    }

    @Override
    public UserInfo queryByName(String username) {
        try {
            return userDao.findByUserName(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<UserInfo> queryUserAndAdvanceBook(String queryValue) {
        return userDao.queryUserAndAdvanceBook(queryValue);
    }

}
