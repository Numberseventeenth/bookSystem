package com.xiao.domain;

import com.xiao.utils.DateUtils;
import org.apache.poi.ss.usermodel.DateUtil;

import java.util.Date;

public class ReNew {

    private int id;
    private String userid;
    private String book_isbn;
    private int renew;   //续借几天
    private int status;  //续借状态  0-续借失败 1-续借成功 2-待审核
    private String statusStr;
    private Date create_time;  //续借时间
    private String createTimeStr;
    private Date operate_time;
    private String operateTimeStr;
    private Date end_time;
    private String endTimeStr;

    private UserInfo user;
    private Book book;

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

    public String getStatusStr() {
        if(status == 0){
            statusStr = "续借失败";
        }else if(status == 1){
            statusStr = "续借成功";
        }else  if(status == 2){
            statusStr = "正在审核";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public int getRenew() {
        return renew;
    }

    public void setRenew(int renew) {
        this.renew = renew;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    @Override
    public String toString() {
        return "ReNew{" +
                "id=" + id +
                ", userid='" + userid + '\'' +
                ", book_isbn='" + book_isbn + '\'' +
                ", renew=" + renew +
                ", status=" + status +
                ", statusStr='" + statusStr + '\'' +
                ", create_time=" + create_time +
                ", createTimeStr='" + createTimeStr + '\'' +
                ", operate_time=" + operate_time +
                ", operateTimeStr='" + operateTimeStr + '\'' +
                ", end_time=" + end_time +
                ", endTimeStr='" + endTimeStr + '\'' +
                ", user=" + user +
                ", book=" + book +
                '}';
    }
}
