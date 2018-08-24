package com.rd.service.impl;

import java.sql.SQLException;
import java.util.List;
import com.rd.bean.Order;
import com.rd.dao.OrderDao;
import com.rd.service.OrderService;

public class OrderServiceImpl implements OrderService{

  public boolean addOrder(Order order) {
    OrderDao orderDao = new OrderDao();
    int a =0;
    try {
      a= orderDao.addOrder(order);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return a>0?true:false;
  }

  public List<Order> findallorder() {
    OrderDao o = new OrderDao();
    List<Order> list =null;
    try {
      list = o.findallorder();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return list;
  }

  public void change(String id, String address) {
    OrderDao o = new OrderDao();
    
    try {
      o.change(id, address);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
  }

  public List<Order> findbyuserid(int a) {
    List<Order> list = null;
    try {
      list = new OrderDao().findbyuserid(a);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return list;
  }
}
