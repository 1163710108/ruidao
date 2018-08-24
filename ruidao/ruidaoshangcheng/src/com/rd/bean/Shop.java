package com.rd.bean;

public class Shop {
  
  
//  sid int primary key,
//  susername varchar(20) unique not null,
//  spassword varchar(20) not null,
//  sname varchar(20) unique not null,
//  sern NUMBER(16,2)  ,
//  stelephone varchar(20) not null ,
//  semail varchar(20) not null,
//  smark varchar2(200) 
  private int sid;
  private String susername;
  private String spassword;
  private String sname;
  private double sern;
  private String stelephone;
  private String semail;
  private String smark;
  
  
  public Shop() {
    super();
  }


  public Shop(String susername, String spassword, String sname, double sern, String stelephone,
      String semail, String smark) {
    super();
    this.susername = susername;
    this.spassword = spassword;
    this.sname = sname;
    this.sern = sern;
    this.stelephone = stelephone;
    this.semail = semail;
    this.smark = smark;
  }


  public Shop(int sid, String susername, String spassword, String sname, double sern,
      String stelephone, String semail, String smark) {
    super();
    this.sid = sid;
    this.susername = susername;
    this.spassword = spassword;
    this.sname = sname;
    this.sern = sern;
    this.stelephone = stelephone;
    this.semail = semail;
    this.smark = smark;
  }


  public int getSid() {
    return sid;
  }


  public void setSid(int sid) {
    this.sid = sid;
  }


  public String getSusername() {
    return susername;
  }


  public void setSusername(String susername) {
    this.susername = susername;
  }


  public String getSpassword() {
    return spassword;
  }


  public void setSpassword(String spassword) {
    this.spassword = spassword;
  }


  public String getSname() {
    return sname;
  }


  public void setSname(String sname) {
    this.sname = sname;
  }


  public double getSern() {
    return sern;
  }


  public void setSern(double sern) {
    this.sern = sern;
  }


  public String getStelephone() {
    return stelephone;
  }


  public void setStelephone(String stelephone) {
    this.stelephone = stelephone;
  }


  public String getSemail() {
    return semail;
  }


  public void setSemail(String semail) {
    this.semail = semail;
  }


  public String getSmark() {
    return smark;
  }


  public void setSmark(String smark) {
    this.smark = smark;
  }


  @Override
  public String toString() {
    return "Shop [semail=" + semail + ", sern=" + sern + ", sid=" + sid + ", smark=" + smark
        + ", sname=" + sname + ", spassword=" + spassword + ", stelephone=" + stelephone
        + ", susername=" + susername + "]";
  }
 
  
  
  
  
  
  
  
}
