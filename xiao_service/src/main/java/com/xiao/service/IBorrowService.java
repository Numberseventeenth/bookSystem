package com.xiao.service;

import com.xiao.domain.Borrow;

import java.util.List;

public interface IBorrowService {
    void borrow(Borrow borrow);

    void back(Integer m_id, String book_isbn,String b_ruin,String b_lose,String b_compensate,
              String b_ruin_int, String b_ruin_level);

    List<Borrow> findAll(Integer page, Integer size);

    List<Borrow> query(String value);

    void updateRenew(String user_id,String bookIsbn,String b_renew);

    List<Borrow> findByUserId(String mid);

}
