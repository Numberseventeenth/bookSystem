package com.xiao.dao;

import com.xiao.domain.Borrow;
import com.xiao.domain.borrowBookHotSort;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IBorrowDao {

    @Insert("insert into borrow(m_id,b_start,b_end,book_isbn)values(#{m_id},#{b_start},#{b_end},#{book_isbn})")
    void borrow(Borrow borrow);

    @Update("UPDATE borrow SET b_status=0,b_back=NOW(),b_ruin=#{b_ruin},b_lose=#{b_lose},b_compensate=#{b_compensate},b_ruin_int=#{b_ruin_int},b_ruin_level=#{b_ruin_level} WHERE m_id=#{m_id} AND book_isbn=#{book_isbn} and b_status=1")
    void back(@Param("m_id") Integer m_id,
              @Param("book_isbn") String book_isbn,
              @Param("b_ruin")String b_ruin,
              @Param("b_lose")String b_lose,
              @Param("b_compensate")String b_compensate,
              @Param("b_ruin_int")String b_ruin_int,
              @Param("b_ruin_level")String b_ruin_level);

    @Select("select * from borrow where book_isbn=#{book_isbn}")
    @Results({
            @Result(column = "m_id",property = "m_id"),
            @Result(column = "b_start",property = "b_start"),
            @Result(column = "b_day",property = "b_day"),
            @Result(column = "b_end",property = "b_end"),
            @Result(column = "b_status",property = "b_status"),
            @Result(column = "book_isbn",property = "book_isbn"),
            @Result(column = "b_back",property = "b_back"),
            @Result(column = "b_renew",property = "b_renew"),
            @Result(column = "b_ruin",property = "b_ruin"),
            @Result(column = "b_lose",property = "b_lose"),
            @Result(column = "b_compensate",property = "b_compensate"),
            @Result(column = "b_ruin_int",property = "b_ruin_int"),
            @Result(column = "b_ruin_level",property = "b_ruin_level"),
            @Result(column = "m_id",property = "users",
                    javaType = List.class,
                    many = @Many(select = "com.xiao.dao.IUserDao.findById"))
    })
    List<Borrow> findByBookIsbn(String book_isbn);

    @Select("select * from borrow order by b_start desc")
    @Results({
            @Result(column = "m_id",property = "m_id"),
            @Result(column = "b_start",property = "b_start"),
            @Result(column = "b_day",property = "b_day"),
            @Result(column = "b_end",property = "b_end"),
            @Result(column = "b_status",property = "b_status"),
            @Result(column = "book_isbn",property = "book_isbn"),
            @Result(column = "b_back",property = "b_back"),
            @Result(column = "b_renew",property = "b_renew"),
            @Result(column = "b_ruin",property = "b_ruin"),
            @Result(column = "b_lose",property = "b_lose"),
            @Result(column = "b_compensate",property = "b_compensate"),
            @Result(column = "b_ruin_int",property = "b_ruin_int"),
            @Result(column = "b_ruin_level",property = "b_ruin_level"),
            @Result(column = "m_id",property = "user",
                    one = @One(select = "com.xiao.dao.IUserDao.findById")),
            @Result(column = "book_isbn",property = "book",
                    one = @One(select = "com.xiao.dao.IBookDao.findById")),
    })
    List<Borrow> findAll();

    @Select("select * from borrow where m_id in(select id from users where username like #{value} or phonenum like #{value}) or book_isbn in(select book_isbn from book where book_name like #{value}) or book_isbn like #{value} order by b_start desc")
    @Results({
            @Result(column = "m_id",property = "m_id"),
            @Result(column = "b_start",property = "b_start"),
            @Result(column = "b_day",property = "b_day"),
            @Result(column = "b_end",property = "b_end"),
            @Result(column = "b_status",property = "b_status"),
            @Result(column = "book_isbn",property = "book_isbn"),
            @Result(column = "b_back",property = "b_back"),
            @Result(column = "b_renew",property = "b_renew"),
            @Result(column = "b_ruin",property = "b_ruin"),
            @Result(column = "b_lose",property = "b_lose"),
            @Result(column = "b_compensate",property = "b_compensate"),
            @Result(column = "b_ruin_int",property = "b_ruin_int"),
            @Result(column = "b_ruin_level",property = "b_ruin_level"),
            @Result(column = "m_id",property = "user",
                    one = @One(select = "com.xiao.dao.IUserDao.findById")),
            @Result(column = "book_isbn",property = "book",
                    one = @One(select = "com.xiao.dao.IBookDao.findById")),
    })
    List<Borrow> query(String value);


    @Select("select * from borrow where m_id = #{mid} order by b_start desc")
    @Results({
            @Result(column = "m_id",property = "m_id"),
            @Result(column = "b_start",property = "b_start"),
            @Result(column = "b_day",property = "b_day"),
            @Result(column = "b_end",property = "b_end"),
            @Result(column = "b_status",property = "b_status"),
            @Result(column = "book_isbn",property = "book_isbn"),
            @Result(column = "b_back",property = "b_back"),
            @Result(column = "b_renew",property = "b_renew"),
            @Result(column = "b_ruin",property = "b_ruin"),
            @Result(column = "b_lose",property = "b_lose"),
            @Result(column = "b_compensate",property = "b_compensate"),
            @Result(column = "b_ruin_int",property = "b_ruin_int"),
            @Result(column = "b_ruin_level",property = "b_ruin_level"),
            @Result(column = "book_isbn",property = "book",
                    one = @One(select = "com.xiao.dao.IBookDao.findById")),
    })
    List<Borrow> queryByMid(String mid);

    @Update("update borrow set b_renew=b_renew+#{b_renew},b_end=DATE_ADD(b_end, INTERVAL #{b_renew} DAY),b_day=b_day+#{b_renew} WHERE m_id=#{user_id} AND book_isbn=#{bookIsbn} AND b_status=1")
    void updateRenew(@Param("user_id") String user_id,
                     @Param("bookIsbn") String bookIsbn,
                     @Param("b_renew") String b_renew);

    @Select("SELECT COUNT(*) FROM borrow WHERE DATE_FORMAT(b_start,'%Y%m%d')<=#{dateNum}")
    int selectBorrowNum(String dateNum);

    @Select("select count(*) from borrow where DATE_FORMAT(b_start,'%Y%m%d')<=#{today} and m_id=#{userid}")
    int selectMyBorrowNum(@Param("today") String today,
                          @Param("userid") String userid);

    @Select("SELECT COUNT(*) FROM borrow WHERE DATE_FORMAT(b_start,'%Y%m%d')=#{dateNum}")
    int selectTodayBorrowNum(String dateNum);

    @Select("select count(*) from borrow where DATE_FORMAT(b_start,'%Y%m%d')=#{today} and m_id=#{userid}")
    int selectMyTodayBorrowNum(@Param("today") String today,
                               @Param("userid") String userid);

    @Select("SELECT COUNT(*) FROM borrow WHERE DATE_FORMAT(b_back,'%Y%m%d')<=#{dateNum}")
    int selectBackNum(String dateNum);

    @Select("SELECT COUNT(*) FROM borrow WHERE DATE_FORMAT(b_back,'%Y%m%d')=#{dateNum}")
    int selectTodayBackNum(String dateNum);

    @Select("SELECT book_isbn,COUNT(*) AS num FROM borrow GROUP BY book_isbn ORDER BY num DESC limit 10")
    @Results({
            @Result(column = "book_isbn",property = "book_isbn"),
            @Result(column = "num",property = "num"),
            @Result(column = "book_isbn",property = "book",
                    one = @One(select = "com.xiao.dao.IBookDao.findById")),
    })
    List<borrowBookHotSort> borrowBookHotSort();

    @Select("select count(*) from borrow")
    int selectBorrowCount();

}
