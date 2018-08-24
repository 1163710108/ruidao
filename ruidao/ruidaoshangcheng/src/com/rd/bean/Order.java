package com.rd.bean;

import java.util.ArrayList; 
import java.util.List;

public class Order {
    
	private String oderid;//该订单的订单号
	private String ordertime;//下单时间
	private double total;//该订单的总金额
	private int state;//订单支付状态 1代表已付款 0代表未付款
	
	private String address;//收货地址
	private String name;//收货人
	private String telephone;//收货人电话
	
	private int usersid;//该订单属于哪个用户
	//该订单中有多少订单项
	
	
    public Order() {
    super();
    }

    public Order(String oderid, String ordertime, double total, int state, String address, String name,
      String telephone, int user) {
    super();
    this.oderid = oderid;
    this.ordertime = ordertime;
    this.total = total;
    this.state = state;
    this.address = address;
    this.name = name;
    this.telephone = telephone;
    this.usersid = user;
  }

    public Order(String ordertime, double total, int state, String address, String name,
        String telephone, int usersid) {
      super();
      this.ordertime = ordertime;
      this.total = total;
      this.state = state;
      this.address = address;
      this.name = name;
      this.telephone = telephone;
      this.usersid = usersid;
    }

    public String getOderid() {
      return oderid;
    }

    public void setOderid(String oderid) {
      this.oderid = oderid;
    }

    public String getOrdertime() {
      return ordertime;
    }

    public void setOrdertime(String ordertime) {
      this.ordertime = ordertime;
    }

    public double getTotal() {
      return total;
    }

    public void setTotal(double total) {
      this.total = total;
    }

    public int getState() {
      return state;
    }

    public void setState(int state) {
      this.state = state;
    }

    public String getAddress() {
      return address;
    }

    public void setAddress(String address) {
      this.address = address;
    }

    public String getName() {
      return name;
    }

    public void setName(String name) {
      this.name = name;
    }

    public String getTelephone() {
      return telephone;
    }

    public void setTelephone(String telephone) {
      this.telephone = telephone;
    }

    public int getUsersid() {
      return usersid;
    }

    public void setUsersid(int usersid) {
      this.usersid = usersid;
    }
}
