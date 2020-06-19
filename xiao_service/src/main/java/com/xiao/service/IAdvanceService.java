package com.xiao.service;

import com.xiao.domain.Advance;

import java.util.List;

public interface IAdvanceService {

    void insertAdvance(String userid,String book_isbn);

    List<Advance> findByUserId(String userid);

    List<Advance> findByFlag();

    int countFlag();

    void update(String userid,String book_isbn,Integer status);

    void updateTake(String userid,String book_isbn);
}
