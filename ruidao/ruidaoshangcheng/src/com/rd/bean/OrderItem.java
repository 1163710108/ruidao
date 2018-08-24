package com.rd.bean;

public class OrderItem {

	private String oid;
	private int count;//订单项内商品的购买数量
	private double subtotal;//订单项小计
	private int productid;//订单项内部的商品
	private int shop;
	private String orders;//该订单项属于哪个订单
  public OrderItem(String oid, int count, double subtotal, int productid, int shop, String orders) {
    super();
    this.oid = oid;
    this.count = count;
    this.subtotal = subtotal;
    this.productid = productid;
    this.shop = shop;
    this.orders = orders;
  }
  public OrderItem() {
    super();
  }
  public String getOid() {
    return oid;
  }
  public void setOid(String oid) {
    this.oid = oid;
  }
  public int getCount() {
    return count;
  }
  public void setCount(int count) {
    this.count = count;
  }
  public double getSubtotal() {
    return subtotal;
  }
  public void setSubtotal(double subtotal) {
    this.subtotal = subtotal;
  }
  public int getProductid() {
    return productid;
  }
  public void setProductid(int productid) {
    this.productid = productid;
  }
  public int getShop() {
    return shop;
  }
  public void setShop(int shop) {
    this.shop = shop;
  }
  public String getOrders() {
    return orders;
  }
  public void setOrders(String orders) {
    this.orders = orders;
  }
	
	
}
