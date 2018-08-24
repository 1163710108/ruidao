package com.rd.service;

import java.util.List;
import com.rd.bean.Order;

public interface OrderService {

  
  public abstract boolean addOrder(Order order);
  
  public abstract List<Order> findallorder();
  
  public abstract void change(String id, String address);
  
  public abstract List<Order> findbyuserid(int a);
}