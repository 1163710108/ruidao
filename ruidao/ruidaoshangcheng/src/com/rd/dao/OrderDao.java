package com.rd.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.rd.bean.Order;
import com.rd.utils.DBUtils;

public class OrderDao {
  private static QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
  
  
  public int addOrder(Order order) throws SQLException{
    String sql = "insert into orders values (?,?,?,?,?,?,?,?)";
    int a = qr.update(sql,order.getOderid(),order.getOrdertime(),order.getTotal(),order.getState(),order.getAddress(),order.getName(),order.getTelephone(),order.getUsersid());
    return a ;
    
  }
  
  public List<Order> findallorder() throws SQLException{
    String sql = "select * from orders";
    List<Order> list = qr.query(sql,new BeanListHandler<Order>(Order.class));
    return list;
  }
  
  
  public void change(String id, String address) throws SQLException{
    String sql = "update orders set state=1 , address = ? where oderid=? ";
    qr.update(sql,address,id);
  }
  
  
  public List<Order> findbyuserid(int a) throws SQLException{
    String sql = "select * from orders where userid=?";
    return qr.query(sql, new BeanListHandler<Order>(Order.class),a);
  }
  
}
