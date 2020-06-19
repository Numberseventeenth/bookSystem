package com.xiao.service;


import com.xiao.domain.borrowBookHotSort;

import java.util.List;

public interface IEchartService {

    /**
     * 总借阅数量
     * @return
     */
    public List<Integer> borrowNum();

    /**
     * 今天借阅数量
     */
    public List<Integer> todayBorrowNum();

    /**
     * 获取今日前一周的日期
     * @return
     */
    public List<String> dateNum();

    /**
     * 总归还数量
     * @return
     */
    public List<Integer> BackNum();

    /**
     * 今天归还数量
     */
    public List<Integer> todayBackNum();

    /**
     * 借阅图书数量排行
     * @return
     */
    public List<borrowBookHotSort> borrowBookHotSort();

    /**
     * 总数量
     * @return
     */
    public int selectBorrowCount();

    /**
     * 我的借阅总数量
     * @return
     */
    public List<Integer> myBorrowNum(String userid);

    /**
     * 我的今日借阅数量
     * @param userid
     * @return
     */
    public List<Integer> todayMyBorrowNum(String userid);


}
