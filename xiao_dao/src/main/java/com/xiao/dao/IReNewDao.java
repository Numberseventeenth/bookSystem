package com.xiao.dao;

import com.xiao.domain.ReNew;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IReNewDao {

    @Insert("insert into renew(userid,book_isbn,renew,create_time)values(#{userid},#{book_isbn},#{renew},NOW())")
    void insert(@Param("userid") String userid,
                @Param("book_isbn") String book_isbn,
                @Param("renew") String renew);

    @Select("select * from renew where userid=#{userid}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "userid",column = "userid"),
            @Result(property = "book_isbn",column = "book_isbn"),
            @Result(property = "renew",column = "renew"),
            @Result(property = "status",column = "status"),
            @Result(property = "create_time",column = "create_time"),
            @Result(property = "operate_time",column = "operate_time"),
            @Result(property = "end_time",column = "end_time"),
            @Result(property = "book",column = "book_isbn",
                    one = @One(select = "com.xiao.dao.IBookDao.findById")),
            @Result(property = "user",column = "userid",
                    one = @One(select = "com.xiao.dao.IUserDao.findById"))
    })
    List<ReNew> findByUserId(String userid);

    @Select("select * from renew where status=2")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "userid",column = "userid"),
            @Result(property = "book_isbn",column = "book_isbn"),
            @Result(property = "renew",column = "renew"),
            @Result(property = "status",column = "status"),
            @Result(property = "create_time",column = "create_time"),
            @Result(property = "operate_time",column = "operate_time"),
            @Result(property = "end_time",column = "end_time"),
            @Result(property = "book",column = "book_isbn",
                    one = @One(select = "com.xiao.dao.IBookDao.findById")),
            @Result(property = "user",column = "userid",
                    one = @One(select = "com.xiao.dao.IUserDao.findById"))
    })
    List<ReNew> findByStatus2();

    @Update("update renew set status=if(#{status}=0,1,0),operate_time=NOW() where userid=#{userid} and book_isbn=#{book_isbn} and status=2")
    void update(@Param("userid")String userid,
                @Param("book_isbn")String book_isbn,
                @Param("status")Integer status);

    @Select("select count(*) from renew where status=2")
    int countStatus2();
}
