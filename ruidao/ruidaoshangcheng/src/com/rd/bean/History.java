package com.rd.bean;

public class History {
  private int id;
  private String image;
  private String name;
  private double price;
  private String date;
  
  
  public History(int id, String image, String name, double price, String date) {
    super();
    this.id = id;
    this.image = image;
    this.name = name;
    this.price = price;
    this.date = date;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public History() {
    super();
  }

  public History(String image, String name, double price, String date) {
    super();
    this.image = image;
    this.name = name;
    this.price = price;
    this.date = date;
  }

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
  }

  @Override
  public String toString() {
    return "History [date=" + date + ", image=" + image + ", name=" + name + ", price=" + price
        + "]";
  }
  
  
}
