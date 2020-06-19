package com.xiao.service.impl;

import com.github.pagehelper.PageHelper;
import com.xiao.dao.IBookDao;
import com.xiao.dao.IBorrowDao;
import com.xiao.domain.Borrow;
import com.xiao.service.IBorrowService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class BorrowServiceImpl implements IBorrowService {

    @Autowired
    private IBorrowDao borrowDao;


    @Override
    public void borrow(Borrow borrow) {

        borrowDao.borrow(borrow);

    }


//    @Param("m_id") Integer m_id,
//    @Param("book_isbn") String book_isbn,
//    @Param("b_ruin")String b_ruin,
//    @Param("b_lose")String b_lose,
//    @Param("b_compensate")String b_compensate,
//    @Param("b_ruin_int")String b_ruin_int,
//    @Param("b_ruin_level")String b_ruin_level
    @Override
    public void back(Integer m_id, String book_isbn,String b_ruin,String b_lose,String b_compensate,
                     String b_ruin_int, String b_ruin_level) {
        borrowDao.back(m_id,book_isbn,b_ruin,b_lose,b_compensate,b_ruin_int,b_ruin_level);
    }

    @Override
    public List<Borrow> findAll(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        return borrowDao.findAll();
    }

    @Override
    public List<Borrow> query(String value) {
        List<Borrow> borrows = borrowDao.query("%" + value + "%");
        return borrows;
    }

    @Override
    public void updateRenew(String user_id, String bookIsbn, String b_renew) {
        //修改续借天数(b_renew)和图书应该归还时间(b_end)，b_day+续借的天数，
        //修改b_end，在原来的基础上增加天数
        borrowDao.updateRenew(user_id,bookIsbn,b_renew);
    }

    @Override
    public List<Borrow> findByUserId(String mid) {
        return borrowDao.queryByMid(mid);
    }
}
