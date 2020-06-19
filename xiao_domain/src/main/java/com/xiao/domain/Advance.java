package com.xiao.domain;

import com.xiao.utils.DateUtils;

import java.util.Date;

/**
 * 预借表
 */
public class Advance {

    private String id;
    private String userid;
    private String book_isbn;
    private Date create_time;  //预借时间
    private String createTimeStr;
    private int flag;   //预借状态  0-预借失败 1-预借成功 2-还在等待
    private String flagStr;
    private Date operate_time;   //管理员操作时间
    private String operateTimeStr;
    private int take;    //是否取走 0-未取走 1-已取走
    private String takeStr;
    private Date end_time;  //最后完成时间
    private String endTimeStr;

    private Book book;
    private UserInfo user;


    public String getCreateTimeStr() {
        if(create_time != null){
            createTimeStr = DateUtils.date2String(create_time,"yyyy.MM.dd");
        }
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public String getOperateTimeStr() {
        if(operate_time != null){
            operateTimeStr = DateUtils.date2String(operate_time,"yyyy.MM.dd");
        }
        return operateTimeStr;
    }

    public void setOperateTimeStr(String operateTimeStr) {
        this.operateTimeStr = operateTimeStr;
    }

    public String getEndTimeStr() {
        if(end_time != null){
            endTimeStr = DateUtils.date2String(end_time,"yyyy.MM.dd");
        }
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
    }

    public UserInfo getUser() {
        return user;
    }

    public void setUser(UserInfo user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public String getFlagStr() {
        if(flag == 0){
            flagStr = "预借失败";
        }else if(flag == 1){
            flagStr = "预借成功";
        }else if(flag == 2){
            flagStr = "正在审核中";
        }
        return flagStr;
    }

    public void setFlagStr(String flagStr) {
        this.flagStr = flagStr;
    }

    public String getTakeStr() {
        if(take == 0){
            takeStr = "待取走";
        }else if(take == 1){
            takeStr = "已取走";
        }
        return takeStr;
    }

    public void setTakeStr(String takeStr) {
        this.takeStr = takeStr;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getOperate_time() {
        return operate_time;
    }

    public void setOperate_time(Date operate_time) {
        this.operate_time = operate_time;
    }

    public int getTake() {
        return take;
    }

    public void setTake(int take) {
        this.take = take;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getBook_isbn() {
        return book_isbn;
    }

    public void setBook_isbn(String book_isbn) {
        this.book_isbn = book_isbn;
    }


    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

}
