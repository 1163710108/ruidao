package com.rd.bean;

public class Product {
  private int pid;
  private String pname;
  private double pprice;
  private double pdiscount;
  private String pimage;
  private int pcategory;
  private int pis_hot;
  private int pshop;
  private int pnumber;
  private String pdesc;
  
  
  public Product() {
    super();
  }

  public Product(int pid, String pname, double pprice, String pdesc, double pdiscount,
      String pimage, int pcategory, int pisHot, int pshop, int pnumber) {
    super();
    this.pid = pid;
    this.pname = pname;
    this.pprice = pprice;
    this.pdesc = pdesc;
    this.pdiscount = pdiscount;
    this.pimage = pimage;
    this.pcategory = pcategory;
    pis_hot = pisHot;
    this.pshop = pshop;
    this.pnumber = pnumber;
  }

  public Product(String pname, double pprice, String pdesc, double pdiscount, String pimage,
      int pcategory, int pisHot, int pshop, int pnumber) {
    super();
    this.pname = pname;
    this.pprice = pprice;
    this.pdesc = pdesc;
    this.pdiscount = pdiscount;
    this.pimage = pimage;
    this.pcategory = pcategory;
    pis_hot = pisHot;
    this.pshop = pshop;
    this.pnumber = pnumber;
  }

  public int getPid() {
    return pid;
  }

  public void setPid(int pid) {
    this.pid = pid;
  }

  public String getPname() {
    return pname;
  }

  public void setPname(String pname) {
    this.pname = pname;
  }

  public double getPprice() {
    return pprice;
  }

  public void setPprice(double pprice) {
    this.pprice = pprice;
  }

  public String getPdesc() {
    return pdesc;
  }

  public void setPdesc(String pdesc) {
    this.pdesc = pdesc;
  }

  public double getPdiscount() {
    return pdiscount;
  }

  public void setPdiscount(double pdiscount) {
    this.pdiscount = pdiscount;
  }

  public String getPimage() {
    return pimage;
  }

  public void setPimage(String pimage) {
    this.pimage = pimage;
  }

  public int getPcategory() {
    return pcategory;
  }

  public void setPcategory(int pcategory) {
    this.pcategory = pcategory;
  }

  public int getPis_hot() {
    return pis_hot;
  }

  public void setPis_hot(int pisHot) {
    pis_hot = pisHot;
  }

  public int getPshop() {
    return pshop;
  }

  public void setPshop(int pshop) {
    this.pshop = pshop;
  }

  public int getPnumber() {
    return pnumber;
  }

  public void setPnumber(int pnumber) {
    this.pnumber = pnumber;
  }

  @Override
  public String toString() {
    return "product [pcategory=" + pcategory + ", pdesc=" + pdesc + ", pdiscount=" + pdiscount
        + ", pid=" + pid + ", pimage=" + pimage + ", pis_hot=" + pis_hot + ", pname=" + pname
        + ", pnumber=" + pnumber + ", pprice=" + pprice + ", pshop=" + pshop + "]";
  }
  
  
  
  
  
}
