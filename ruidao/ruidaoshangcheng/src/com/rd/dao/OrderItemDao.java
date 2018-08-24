package com.rd.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.rd.bean.OrderItem;
import com.rd.utils.DBUtils;

public class OrderItemDao {

  private static QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
  
  
  public int addOrderItem(OrderItem orderItem) throws SQLException{
    String sql = "insert into orderitem values (?,?,?,?,?,?)";
    int a = qr.update(sql,orderItem.getOid(),orderItem.getCount(),orderItem.getSubtotal(),orderItem.getProductid(),orderItem.getShop(),orderItem.getOrders());
    return a;
  }
  
  
  
  public List<OrderItem> findorderitembyshop(int id) throws SQLException{
    String sql = "select * from orderitem where shop = ?";
    List<OrderItem> list = qr.query(sql, new BeanListHandler<OrderItem>(OrderItem.class),id);
    return list;
  }
}
