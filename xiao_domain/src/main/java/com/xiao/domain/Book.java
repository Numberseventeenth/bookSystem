package com.xiao.domain;

import com.xiao.utils.DateUtils;

import java.util.Date;
import java.util.List;

public class Book {
    private String book_isbn;
    private String book_name;
    private String book_price;
    private String book_public;
    private String book_author;
    private String book_year;
    private int book_count;
    private Date book_date;
    private String bookDateStr;
    private int book_borrow;
    private Category category;
    private int c_id;
    private int out;     //0-下架  1-上架
    private String outStr;
    private int remain;  //剩余数
    private String book_img;   //图书图片
    private int book_lose;    //丢失书本数量

    private List<Borrow> borrows;

    public int getBook_lose() {
        return book_lose;
    }

    public void setBook_lose(int book_lose) {
        this.book_lose = book_lose;
    }

    public String getBook_img() {
        return book_img;
    }

    public void setBook_img(String book_img) {
        this.book_img = book_img;
    }

    public int getOut() {
        return out;
    }

    public void setOut(int out) {
        this.out = out;
    }

    public String getOutStr() {
        if(out == 1){
            outStr = "上架";
        }
        if(out == 0){
            outStr = "下架";
        }
        return outStr;
    }

    public void setOutStr(String outStr) {
        this.outStr = outStr;
    }

    public List<Borrow> getBorrows() {
        return borrows;
    }

    public void setBorrows(List<Borrow> borrows) {
        this.borrows = borrows;
    }



    public int getRemain() {
        return book_count-book_borrow-book_lose;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }

    public String getBook_isbn() {
        return book_isbn;
    }

    public void setBook_isbn(String book_isbn) {
        this.book_isbn = book_isbn;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_price() {
        return book_price;
    }

    public void setBook_price(String book_price) {
        this.book_price = book_price;
    }

    public String getBook_public() {
        return book_public;
    }

    public void setBook_public(String book_public) {
        this.book_public = book_public;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public String getBook_year() {
        return book_year;
    }

    public void setBook_year(String book_year) {
        this.book_year = book_year;
    }

    public int getBook_count() {
        return book_count;
    }

    public void setBook_count(int book_count) {
        this.book_count = book_count;
    }

    public Date getBook_date() {
        return book_date;
    }

    public void setBook_date(Date book_date) {
        this.book_date = book_date;
    }

    public String getBookDateStr() {
        if(book_date != null){
            bookDateStr = DateUtils.date2String(book_date,"yyyy.MM.dd");
        }
        return bookDateStr;
    }

    public void setBookDateStr(String bookDateStr) {
        this.bookDateStr = bookDateStr;
    }

    public int getBook_borrow() {
        return book_borrow;
    }

    public void setBook_borrow(int book_borrow) {
        this.book_borrow = book_borrow;
    }


    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    @Override
    public String toString() {
        return "Book{" +
                "book_isbn='" + book_isbn + '\'' +
                ", book_name='" + book_name + '\'' +
                ", book_price='" + book_price + '\'' +
                ", book_public='" + book_public + '\'' +
                ", book_author='" + book_author + '\'' +
                ", book_year='" + book_year + '\'' +
                ", book_count=" + book_count +
                ", book_date=" + book_date +
                ", bookDateStr='" + bookDateStr + '\'' +
                ", book_borrow=" + book_borrow +
                ", category=" + category +
                ", c_id=" + c_id +
                ", remain=" + remain +
                ", borrows=" + borrows +
                '}';
    }
}
