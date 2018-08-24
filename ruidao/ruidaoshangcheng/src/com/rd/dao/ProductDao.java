package com.rd.dao;

import java.sql.SQLException; 
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.rd.bean.Product;
import com.rd.utils.DBUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class ProductDao {
  private static QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
  
  public List<Product> findByCidproduct(int pid) throws SQLException {
    String sql = "select * from product where pcategory = ?";
    List<Product> list = qr.query(sql, new BeanListHandler<Product>(Product.class),pid);
    return list;
  }
  
  
  public List<Product> findBypcategory(int cid , int currentPage , int currentCount) throws SQLException{
    String sql = "select * from (select rownum rn ,pname,pprice , pimage, pcategory,pdiscount,pid,pis_hot,pshop,pnumber,pdesc from (select * from product where pcategory = ?) where rownum<=?) where rn >=?";
    Object[] params = {cid,currentCount,currentPage};
    List<Product> list = qr.query(sql,new BeanListHandler<Product>(Product.class),params);
    return list;
  }
  
  public List<Product> findBypshop(int pshop) throws SQLException{
    String sql = "select * from product where pshop = ?";
    List<Product> list = qr.query(sql,new BeanListHandler<Product>(Product.class),pshop);
    return list;
  }
  
  public int deleteProduct(int pid) throws SQLException{
    String sql = "delete from product where pid=?";
    int a = qr.update(sql,pid);
    return a;
  }
  
  public Product findProductbypid(int pid) throws SQLException{
    String sql = "select * from product where pid = ?";
    Product p = qr.query(sql, new BeanHandler<Product>(Product.class),pid);
    return p;
  }
  
  
  public List<Product> fourProduct(int id) throws SQLException{
    String sql = "select * from (select * from product where pcategory = ?) where  rownum<=4";
    List<Product> list = qr.query(sql, new BeanListHandler<Product>(Product.class),id);
    return list;
  }
  
  public List<Product> fourProducthot() throws SQLException{
    String sql = "select * from (select * from product where pis_hot = ?) where  rownum<=4";
    List<Product> list = qr.query(sql, new BeanListHandler<Product>(Product.class),1);
    return list;
  }
  
  public List<Product> fourProductdiscount() throws SQLException{
    String sql = "select * from (select * from product where pdiscount<?) where  rownum<=4";
    List<Product> list = qr.query(sql, new BeanListHandler<Product>(Product.class),1);
    return list;
  }
  
  
  public List<Product> searchpruduct(String s) throws SQLException{
    String sql = "select * from product where pname like '%"+s+"%'";
    return qr.query(sql, new BeanListHandler<Product>(Product.class));
  }
}
 