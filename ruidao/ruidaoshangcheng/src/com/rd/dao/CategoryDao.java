package com.rd.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.rd.bean.Category;
import com.rd.utils.DBUtils;
public class CategoryDao {
  private static QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
  
  public List<Category> findallkind() throws SQLException{
    return qr.query("select * from  category order by cid asc", new BeanListHandler<Category>(Category.class));
  }
  
}
