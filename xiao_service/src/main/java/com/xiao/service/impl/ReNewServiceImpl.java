package com.xiao.service.impl;

import com.xiao.dao.IReNewDao;
import com.xiao.domain.ReNew;
import com.xiao.service.IReNewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReNewServiceImpl implements IReNewService {

    @Autowired
    private IReNewDao reNewDao;

    @Override
    public void insert(String userid, String book_isbn, String renew) {
        reNewDao.insert(userid,book_isbn,renew);
    }

    @Override
    public List<ReNew> findByUserId(String userid) {
        return reNewDao.findByUserId(userid);
    }

    @Override
    public List<ReNew> findByStatus2() {
        return reNewDao.findByStatus2();
    }

    @Override
    public void update(String userid, String book_isbn, Integer status) {
        reNewDao.update(userid,book_isbn,status);
    }

    @Override
    public int countStatus2() {
        return reNewDao.countStatus2();
    }
}
