package com.xiao.service.impl;

import com.xiao.dao.IBorrowDao;
import com.xiao.domain.Borrow;
import com.xiao.domain.borrowBookHotSort;
import com.xiao.service.IEchartService;
import com.xiao.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class EchartServiceImpl implements IEchartService {

    @Autowired
    private IBorrowDao borrowDao;

    @Override
    public List<String> dateNum(){
        List<String> dateNum = new ArrayList<>();
        String today = DateUtils.date2String(new Date(), "MM.dd");
        dateNum.add(today);
        Calendar ca = Calendar.getInstance();
        for (int i = 1; i < 7; i++) {
            ca.add(Calendar.DATE,-1);
            Date caTime = ca.getTime();
            String calTimeStr = DateUtils.date2String(caTime, "MM.dd");
            dateNum.add(calTimeStr);
        }
        return dateNum;
    }

    @Override
    public List<Integer> borrowNum() {
        //日期格式20200310
        //获取今日
        List<Integer> borrow = new ArrayList<>();
        String today = DateUtils.date2String(new Date(), "yyyyMMdd");
        Calendar ca = Calendar.getInstance();
        int todayNum = borrowDao.selectBorrowNum(today);
        borrow.add(todayNum);
        //昨日
        for (int i = 1; i < 7; i++) {
            ca.add(Calendar.DATE,-1);
            Date caTime = ca.getTime();
            today = DateUtils.date2String(caTime, "yyyyMMdd");
            int num = borrowDao.selectBorrowNum(today);
            borrow.add(num);
        }
        return borrow;
    }

    @Override
    public List<Integer> todayBorrowNum() {
        //日期格式20200310
        //获取今日
        List<Integer> todayBorrow = new ArrayList<>();
        String today = DateUtils.date2String(new Date(), "yyyyMMdd");
        Calendar ca = Calendar.getInstance();
        int todayNum = borrowDao.selectTodayBorrowNum(today);
        todayBorrow.add(todayNum);
        //昨日
        for (int i = 1; i < 7; i++) {
            ca.add(Calendar.DATE,-1);
            Date caTime = ca.getTime();
            String calTimeStr = DateUtils.date2String(caTime, "yyyyMMdd");
            System.out.println("循坏：" + calTimeStr);
            int num = borrowDao.selectTodayBorrowNum(calTimeStr);
            todayBorrow.add(num);
        }
        return todayBorrow;
    }

    @Override
    public List<Integer> BackNum() {
        //日期格式20200310
        //获取今日
        List<Integer> back = new ArrayList<>();
        String today = DateUtils.date2String(new Date(), "yyyyMMdd");
        Calendar ca = Calendar.getInstance();
        int todayNum = borrowDao.selectBackNum(today);
        back.add(todayNum);
        //昨日
        for (int i = 1; i < 7; i++) {
            ca.add(Calendar.DATE,-1);
            Date caTime = ca.getTime();
            String calTimeStr = DateUtils.date2String(caTime, "yyyyMMdd");
            int num = borrowDao.selectBackNum(calTimeStr);
            back.add(num);
        }
        return back;
    }

    @Override
    public List<Integer> todayBackNum() {
        //日期格式20200310
        //获取今日
        List<Integer> todayBack = new ArrayList<>();
        String today = DateUtils.date2String(new Date(), "yyyyMMdd");
        Calendar ca = Calendar.getInstance();
        int todayNum = borrowDao.selectTodayBackNum(today);
        todayBack.add(todayNum);
        //昨日
        for (int i = 1; i < 7; i++) {
            ca.add(Calendar.DATE,-1);
            Date caTime = ca.getTime();
            String calTimeStr = DateUtils.date2String(caTime, "yyyyMMdd");
            System.out.println("循坏：" + calTimeStr);
            int num = borrowDao.selectTodayBackNum(calTimeStr);
            todayBack.add(num);
        }
        return todayBack;
    }

    @Override
    public List<borrowBookHotSort> borrowBookHotSort() {
        List<borrowBookHotSort> bookHotSort = borrowDao.borrowBookHotSort();
        return bookHotSort;
    }

    @Override
    public int selectBorrowCount() {
        return borrowDao.selectBorrowCount();
    }

    @Override
    public List<Integer> myBorrowNum(String userid) {
        //日期格式20200310
        //获取今日
        List<Integer> borrow = new ArrayList<>();
        String today = DateUtils.date2String(new Date(), "yyyyMMdd");
        Calendar ca = Calendar.getInstance();
        int todayNum = borrowDao.selectMyBorrowNum(today,userid);
        borrow.add(todayNum);
        //昨日
        for (int i = 1; i < 7; i++) {
            ca.add(Calendar.DATE,-1);
            Date caTime = ca.getTime();
            today = DateUtils.date2String(caTime, "yyyyMMdd");
            int num = borrowDao.selectMyBorrowNum(today,userid);
            borrow.add(num);
        }
        return borrow;
    }

    @Override
    public List<Integer> todayMyBorrowNum(String userid) {
        //日期格式20200310
        //获取今日
        List<Integer> todayBorrow = new ArrayList<>();
        String today = DateUtils.date2String(new Date(), "yyyyMMdd");
        Calendar ca = Calendar.getInstance();
        int todayNum = borrowDao.selectMyTodayBorrowNum(today,userid);
        todayBorrow.add(todayNum);
        //昨日
        for (int i = 1; i < 7; i++) {
            ca.add(Calendar.DATE,-1);
            Date caTime = ca.getTime();
            today = DateUtils.date2String(caTime, "yyyyMMdd");
            System.out.println("循坏：" + today);
            int num = borrowDao.selectMyTodayBorrowNum(today,userid);
            todayBorrow.add(num);
        }
        return todayBorrow;
    }
}
