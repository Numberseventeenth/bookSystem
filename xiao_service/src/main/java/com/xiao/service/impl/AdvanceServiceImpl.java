package com.xiao.service.impl;

import com.xiao.dao.IAdvanceDao;
import com.xiao.domain.Advance;
import com.xiao.service.IAdvanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdvanceServiceImpl implements IAdvanceService {

    @Autowired
    private IAdvanceDao advanceDao;

    @Override
    public void insertAdvance(String userid, String book_isbn) {
        advanceDao.insertAdvance(userid,book_isbn);
    }

    @Override
    public List<Advance> findByUserId(String userid) {
        return advanceDao.findByUserId(userid);
    }

    @Override
    public List<Advance> findByFlag() {
        return advanceDao.findByFlag();
    }

    @Override
    public int countFlag() {
        return advanceDao.countFlag();
    }

    @Override
    public void update(String userid, String book_isbn, Integer status) {
        advanceDao.update(userid,book_isbn,status);
    }

    @Override
    public void updateTake(String userid, String book_isbn) {
        advanceDao.updateTake(userid,book_isbn);
    }
}
