package com.xiao.service;

import com.xiao.domain.ReNew;

import java.util.List;

public interface IReNewService {

    void insert(String userid,String book_isbn,String renew);

    List<ReNew> findByUserId(String userid);

    List<ReNew> findByStatus2();

    void update(String userid,String book_isbn,Integer status);

    int countStatus2();
}
