package com.xiao.service;

import com.xiao.domain.Book;
import com.xiao.domain.Category;

import java.util.List;

public interface BookService {
    List<Category> findCategory();

    void save(Book book);

    List<Book> findAll(Integer page, Integer size);

    Book findById(String id);

    void update(Book book);

    List<Book> query(String value);

    List<Book> queryBookByNameAndIsbn(String book);

    void updateBorrow(String book_isbn);

    void updateBack(String book_isbn,String b_lose);

    List<Book> findAll();

    void updateOutById(String book_isbn,String out);

    List<Book> queryBookByOut();

    void deleteCategoryById(String c_id);

    void updateCIdByBook(String c_id);

    void updateCountById(String book_isbn,int count);
}
