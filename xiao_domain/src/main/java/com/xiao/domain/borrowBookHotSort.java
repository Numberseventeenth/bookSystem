package com.xiao.domain;

public class borrowBookHotSort {

    private String book_isbn;

    private int num;

    private Book book;

    public String getBook_isbn() {
        return book_isbn;
    }

    public void setBook_isbn(String book_isbn) {
        this.book_isbn = book_isbn;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Override
    public String toString() {
        return "borrowBookHotSort{" +
                "book_isbn='" + book_isbn + '\'' +
                ", num=" + num +
                ", book=" + book +
                '}';
    }
}
