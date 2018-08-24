package com.rd.service.impl;

import java.sql.SQLException;
import java.util.List;
import com.rd.bean.OrderItem;
import com.rd.dao.OrderItemDao;
import com.rd.service.OrderItemService;

public class OrderItemServiceImpl implements OrderItemService{
  
  public boolean addOrderItem(OrderItem orderItem){
    OrderItemDao o = new OrderItemDao();
    int a = 0 ;
    try {
      a = o.addOrderItem(orderItem);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return a>0?true:false ;
  }

  public List<OrderItem> findorderitembyshop(int id) {
    OrderItemDao o = new OrderItemDao();
    List<OrderItem> list = null;
    try {
      list = o.findorderitembyshop(id);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return list;
  }
  
  
}
