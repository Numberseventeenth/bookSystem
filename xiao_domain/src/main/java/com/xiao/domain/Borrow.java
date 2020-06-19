package com.xiao.domain;

import com.xiao.utils.DateUtils;

import java.util.Date;
import java.util.List;

public class Borrow {

    private int m_id;
    private Date b_start;
    private String bStartStr;
    private int day;
    private Date b_end;   //应该归还时间
    private String bEndStr;
    private int b_status;
    private String bStatusStr;
    private int b_day;
    private String book_isbn;
    private Date b_back;   //实际归还时间
    private String bBackStr;
    private int b_renew;   //是否续借0-没有续借
    private String b_ruin;  //图书毁坏记录
    private int b_lose;     //是否丢失 0-没有丢失 1-丢失
    private String b_loseStr;
    private String b_compensate;  //赔偿记录（记录赔偿价钱）
    private int b_ruin_int;  //是否有损坏
    private String b_ruin_intStr;
    private int b_ruin_level;   //损坏程度
    private double b_ruin_levelNum;  //损坏程度需要赔偿的金额

    private List<UserInfo> users;
    private List<Book> books;

    private UserInfo user;
    private Book book;

    private int num;   //临时变量：图书借阅次数排行

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getB_ruin_level() {
        return b_ruin_level;
    }

    public void setB_ruin_level(int b_ruin_level) {
        this.b_ruin_level = b_ruin_level;
    }

    public double getB_ruin_levelNum() {
        //损坏：根据损坏程度进行赔偿
//        1.损坏1%-30%：书籍价钱*%2
//        2.损坏30%-70%：书籍价钱*50%
//        3.损坏70%-100%：书籍价钱*80%
        if(b_ruin_level < 30){
            b_ruin_levelNum = Double.parseDouble(book.getBook_price()) * 0.02;
        }else if(b_ruin_level < 70){
            b_ruin_levelNum = Double.parseDouble(book.getBook_price()) * 0.5;
        }else if(b_ruin_level < 100){
            b_ruin_levelNum = Double.parseDouble(book.getBook_price()) * 0.8;
        }
        return b_ruin_levelNum;
    }

    public void setB_ruin_levelNum(double b_ruin_levelNum) {
        this.b_ruin_levelNum = b_ruin_levelNum;
    }

    public int getB_ruin_int() {
        return b_ruin_int;
    }

    public void setB_ruin_int(int b_ruin_int) {
        this.b_ruin_int = b_ruin_int;
    }

    public String getB_ruin_intStr() {
        if(b_ruin_int == 0){
            b_ruin_intStr = "无损坏";
        }
        if(b_ruin_int == 1){
            b_ruin_intStr = "有损坏";
        }
        return b_ruin_intStr;
    }

    public void setB_ruin_intStr(String b_ruin_intStr) {
        this.b_ruin_intStr = b_ruin_intStr;
    }

    public String getB_compensate() {
        return b_compensate;
    }

    public void setB_compensate(String b_compensate) {
        this.b_compensate = b_compensate;
    }

    public String getB_loseStr() {
        if(b_lose == 0){
            b_loseStr = "没有丢失";
        }
        if(b_lose == 1){
            b_loseStr = "书籍丢失";
        }
        return b_loseStr;
    }

    public void setB_loseStr(String b_loseStr) {
        this.b_loseStr = b_loseStr;
    }

    public int getB_renew() {
        return b_renew;
    }

    public void setB_renew(int b_renew) {
        this.b_renew = b_renew;
    }

    public String getB_ruin() {
        return b_ruin;
    }

    public void setB_ruin(String b_ruin) {
        this.b_ruin = b_ruin;
    }

    public int getB_lose() {
        return b_lose;
    }

    public void setB_lose(int b_lose) {
        this.b_lose = b_lose;
    }

    public List<UserInfo> getUsers() {
        return users;
    }

    public void setUsers(List<UserInfo> users) {
        this.users = users;
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

    public String getbStatusStr() {
        //1-借出  0-归还
        if(b_status == 1){
            bStatusStr = "已借出";
        }
        if(b_status == 0){
            bStatusStr = "已归还";
        }
        return bStatusStr;
    }

    public void setbStatusStr(String bStatusStr) {
        this.bStatusStr = bStatusStr;
    }

    public String getbStartStr() {
        if(b_start != null){
            bStartStr = DateUtils.date2String(b_start,"yyyy年MM月dd日 HH:mm");
        }
        return bStartStr;
    }

    public void setbStartStr(String bStartStr) {
        this.bStartStr = bStartStr;
    }

    public String getbEndStr() {
        if(b_end != null){
            bEndStr = DateUtils.date2String(b_end,"yyyy年MM月dd日 HH:mm");
        }
        return bEndStr;
    }

    public void setbEndStr(String bEndStr) {
        this.bEndStr = bEndStr;
    }

    public String getbBackStr() {
        if(b_back != null){
            bBackStr = DateUtils.date2String(b_back,"yyyy年MM月dd日 HH:mm");
        }
        return bBackStr;
    }

    public void setbBackStr(String bBackStr) {
        this.bBackStr = bBackStr;
    }



    public int getB_day() {
        return b_day;
    }

    public void setB_day(int b_day) {
        this.b_day = b_day;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
    }

    public Date getB_start() {
        return b_start;
    }

    public void setB_start(Date b_start) {
        this.b_start = b_start;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public Date getB_end() {
        return b_end;
    }

    public void setB_end(Date b_end) {
        this.b_end = b_end;
    }

    public int getB_status() {
        return b_status;
    }

    public void setB_status(int b_status) {
        this.b_status = b_status;
    }

    public String getBook_isbn() {
        return book_isbn;
    }

    public void setBook_isbn(String book_isbn) {
        this.book_isbn = book_isbn;
    }

    public Date getB_back() {
        return b_back;
    }

    public void setB_back(Date b_back) {
        this.b_back = b_back;
    }


    @Override
    public String toString() {
        return "Borrow{" +
                "m_id=" + m_id +
                ", b_start=" + b_start +
                ", bStartStr='" + bStartStr + '\'' +
                ", day=" + day +
                ", b_end=" + b_end +
                ", bEndStr='" + bEndStr + '\'' +
                ", b_status=" + b_status +
                ", bStatusStr='" + bStatusStr + '\'' +
                ", b_day=" + b_day +
                ", book_isbn='" + book_isbn + '\'' +
                ", b_back=" + b_back +
                ", bBackStr='" + bBackStr + '\'' +
                ", users=" + users +
                ", books=" + books +
                ", user=" + user +
                ", book=" + book +
                '}';
    }
}
