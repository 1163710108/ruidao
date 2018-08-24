package com.rd.bean;

import java.util.ArrayList;
import java.util.List;

public class Cart {
  
  
  private List<CartItem> list =new ArrayList<CartItem>();
  
  private double total;
  
  

  public Cart() {
    super();
  }

  public Cart(List<CartItem> list, double total) {
    super();
    this.list = list;
    this.total = total;
  }
  
  

  public List<CartItem> getList() {
    return list;
  }

  public void setList(List<CartItem> list) {
    this.list = list;
  }

  public double getTotal() {
    return total;
  }

  public void setTotal(double total) {
    this.total = total;
  }
  
  
  
}
