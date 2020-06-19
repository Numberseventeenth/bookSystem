package com.xiao.dao;

import com.xiao.domain.Advance;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IAdvanceDao {

    @Insert("insert into advance(userid,book_isbn,create_time)values(#{userid},#{book_isbn},NOW())")
    void insertAdvance(@Param("userid") String userid, @Param("book_isbn") String book_isbn);

    @Select("select * from advance where userid=#{userid}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "userid",column = "userid"),
            @Result(property = "book_isbn",column = "book_isbn"),
            @Result(property = "create_time",column = "create_time"),
            @Result(property = "flag",column = "flag"),
            @Result(property = "operate_time",column = "operate_time"),
            @Result(property = "take",column = "take"),
            @Result(property = "end_time",column = "end_time"),
            @Result(property = "book",column = "book_isbn",
                one = @One(select = "com.xiao.dao.IBookDao.findById"))
    })
    List<Advance> findByUserId(String userid);

    @Select("select * from advance where flag=2 order by create_time desc")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "userid",column = "userid"),
            @Result(property = "book_isbn",column = "book_isbn"),
            @Result(property = "create_time",column = "create_time"),
            @Result(property = "flag",column = "flag"),
            @Result(property = "operate_time",column = "operate_time"),
            @Result(property = "take",column = "take"),
            @Result(property = "end_time",column = "end_time"),
            @Result(property = "book",column = "book_isbn",
                    one = @One(select = "com.xiao.dao.IBookDao.findById")),
            @Result(property = "user",column = "userid",
                one = @One(select = "com.xiao.dao.IUserDao.findById"))
    })
    List<Advance> findByFlag();

    @Select("select count(*) from advance where flag=2")
    int countFlag();

    @Update("update advance set flag=if(#{status}=0,1,0),operate_time=NOW() where userid=#{userid} and book_isbn=#{book_isbn} and take=0")
    void update(@Param("userid")String userid,
                @Param("book_isbn")String book_isbn,
                @Param("status")Integer status);

    @Update("update advance set take=1,end_time=NOW() where userid=#{userid} and book_isbn=#{book_isbn} and flag=1")
    void updateTake(@Param("userid")String userid,
                    @Param("book_isbn")String book_isbn);

}
