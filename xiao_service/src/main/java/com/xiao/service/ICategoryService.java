package com.xiao.service;

import com.xiao.domain.Category;

public interface ICategoryService {

    /**
     * 业务：图书导入
     * 根据图书类别名名字查询类别id
     * @param value
     * @return
     */
    public int findByName(String value);

    void saveCategory(Category category);
}
