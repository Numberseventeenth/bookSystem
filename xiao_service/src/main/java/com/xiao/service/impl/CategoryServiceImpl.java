package com.xiao.service.impl;

import com.xiao.dao.ICategoryDao;
import com.xiao.domain.Category;
import com.xiao.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("categoryService")
@Transactional
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    ICategoryDao categoryDao;

    @Override
    public int findByName(String value) {
        return categoryDao.findByName(value);
    }

    @Override
    public void saveCategory(Category category) {
        categoryDao.saveCategory(category);
    }
}
