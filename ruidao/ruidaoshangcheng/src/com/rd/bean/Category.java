package com.rd.bean;

import java.util.List;

public class Category {
  private int cid;
  private String cname;
  
  private List<Product> list;
  public Category() {
    super();
  }
  public Category(int cid, String cname) {
    super();
    this.cid = cid;
    this.cname = cname;
  }
  public Category(int cid, String cname, List<Product> list) {
    super();
    this.cid = cid;
    this.cname = cname;
    this.list = list;
  }
  public int getCid() {
    return cid;
  }
  public void setCid(int cid) {
    this.cid = cid;
  }
  public String getCname() {
    return cname;
  }
  public void setCname(String cname) {
    this.cname = cname;
  }
  public List<Product> getList() {
    return list;
  }
  public void setList(List<Product> list) {
    this.list = list;
  }
  @Override
  public String toString() {
    return "Category [cid=" + cid + ", cname=" + cname + "]";
  }
  
  
}
