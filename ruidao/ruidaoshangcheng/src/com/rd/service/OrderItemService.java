package com.rd.service;

import java.util.List;
import com.rd.bean.OrderItem;

public interface OrderItemService {
  public abstract boolean addOrderItem(OrderItem orderItem);
  
  public abstract List<OrderItem> findorderitembyshop(int id);
}
