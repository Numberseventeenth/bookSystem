package com.xiao.service.impl;

import com.github.pagehelper.PageHelper;
import com.xiao.dao.IBookDao;
import com.xiao.dao.ICategoryDao;
import com.xiao.domain.Book;
import com.xiao.domain.Category;
import com.xiao.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired
    private IBookDao bookDao;

    @Autowired
    private ICategoryDao categoryDao;

    @Override
    public List<Category> findCategory() {
        List<Category> categoryList = bookDao.findCategory();
        return categoryList;
    }

    @Override
    public void save(Book book) {
        Date date = new Date();
        book.setBook_date(date);
        Book byId = bookDao.findById(book.getBook_isbn());
        if(byId == null){
            //如果不存在则加入
            bookDao.save(book);
        }else{
            //如果存在则在原有的基础上+count
            bookDao.updateCountById(book.getBook_isbn(),book.getBook_count());
        }

    }

    @Override
    public List<Book> findAll(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        return bookDao.findAll();
    }

    @Override
    public Book findById(String id) {
        Book book = bookDao.findById(id);
        return book;
    }

    @Override
    public void update(Book book) {
         bookDao.update(book);
    }

    @Override
    public List<Book> query(String value) {
        List<Book> books = bookDao.query("%"+value+"%");
        return books;
    }

    @Override
    public List<Book> queryBookByNameAndIsbn(String book) {
        return bookDao.queryBookByNameAndIsbn(book);
    }

    @Override
    public void updateBorrow(String book_isbn) {
        bookDao.updateBorrow(book_isbn);
    }

    @Override
    public void updateBack(String book_isbn,String b_lose) {
        bookDao.updateBack(book_isbn,b_lose);
    }

    @Override
    public List<Book> findAll() {
        return bookDao.findAll();
    }

    @Override
    public void updateOutById(String book_isbn,String out) {
        bookDao.updateOutById(book_isbn,out);
    }

    @Override
    public List<Book> queryBookByOut() {
        return bookDao.queryBookByOut();
    }

    @Override
    public void deleteCategoryById(String c_id) {
        categoryDao.deleteCategoryById(c_id);
    }

    @Override
    public void updateCIdByBook(String c_id) {
        bookDao.updateCIdByBook(c_id);
    }

    @Override
    public void updateCountById(String book_isbn,int count) {
        bookDao.updateCountById(book_isbn,count);
    }


}
