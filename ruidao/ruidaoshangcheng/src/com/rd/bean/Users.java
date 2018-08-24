package com.rd.bean;


public class Users {
  
  private int u_id; 
  private String uusername;
  private String upassword;
  private String uname;
  private String uemail;  
  private String utelephone;  
  private String ubirthday; 
  private String usex;
  private String umark;
  private double ucost;
  private String udate;
  public Users() {
    super();
  }
  public Users(int uId, String uusername, String upassword, String uname, String uemail,
      String utelephone, String ubirthday, String usex, String umark, double ucost, String udate) {
    super();
    u_id = uId;
    this.uusername = uusername;
    this.upassword = upassword;
    this.uname = uname;
    this.uemail = uemail;
    this.utelephone = utelephone;
    this.ubirthday = ubirthday;
    this.usex = usex;
    this.umark = umark;
    this.ucost = ucost;
    this.udate = udate;
  }
  public Users(String uusername, String upassword, String uname, String uemail, String utelephone,
      String ubirthday, String usex, String umark, double ucost, String udate) {
    super();
    this.uusername = uusername;
    this.upassword = upassword;
    this.uname = uname;
    this.uemail = uemail;
    this.utelephone = utelephone;
    this.ubirthday = ubirthday;
    this.usex = usex;
    this.umark = umark;
    this.ucost = ucost;
    this.udate = udate;
  }
  public int getU_id() {
    return u_id;
  }
  public void setU_id(int uId) {
    u_id = uId;
  }
  public String getUusername() {
    return uusername;
  }
  public void setUusername(String uusername) {
    this.uusername = uusername;
  }
  public String getUpassword() {
    return upassword;
  }
  public void setUpassword(String upassword) {
    this.upassword = upassword;
  }
  public String getUname() {
    return uname;
  }
  public void setUname(String uname) {
    this.uname = uname;
  }
  public String getUemail() {
    return uemail;
  }
  public void setUemail(String uemail) {
    this.uemail = uemail;
  }
  public String getUtelephone() {
    return utelephone;
  }
  public void setUtelephone(String utelephone) {
    this.utelephone = utelephone;
  }
  public String getUbirthday() {
    return ubirthday;
  }
  public void setUbirthday(String ubirthday) {
    this.ubirthday = ubirthday;
  }
  public String getUsex() {
    return usex;
  }
  public void setUsex(String usex) {
    this.usex = usex;
  }
  public String getUmark() {
    return umark;
  }
  public void setUmark(String umark) {
    this.umark = umark;
  }
  public double getUcost() {
    return ucost;
  }
  public void setUcost(double ucost) {
    this.ucost = ucost;
  }
  public String getUdate() {
    return udate;
  }
  public void setUdate(String udate) {
    this.udate = udate;
  }
  @Override
  public String toString() {
    return "Users [u_id=" + u_id + ", ubirthday=" + ubirthday + ", ucost=" + ucost + ", udate="
        + udate + ", uemail=" + uemail + ", umark=" + umark + ", uname=" + uname + ", upassword="
        + upassword + ", usex=" + usex + ", utelephone=" + utelephone + ", uusername=" + uusername
        + "]";
  }
  
  

  
}
