package com.xiao.dao;

import com.xiao.domain.Category;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ICategoryDao {

    @Select("select * from category where c_id=#{id}")
    Category findById(int id);

    @Select("select c_id from category where c_name=#{value}")
    int findByName(String value);

    @Delete("delete from category where c_id=#{id}")
    void deleteCategoryById(String id);

    @Insert("INSERT INTO category(c_name)VALUE(#{c_name})")
    void saveCategory(Category category);
}
