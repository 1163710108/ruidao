package com.rd.service.impl;

import java.sql.SQLException;
import java.util.List;
import com.rd.bean.Category;
import com.rd.dao.CategoryDao;
import com.rd.service.CategoryService;

public class CategoryServiceImpl implements CategoryService{

  public List<Category> findallkind() {
    CategoryDao C =new CategoryDao();
    List<Category> list = null;
    try {
      list = C.findallkind();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return list;
  }

}
