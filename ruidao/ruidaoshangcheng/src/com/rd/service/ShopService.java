package com.rd.service;

import java.util.List;
import com.rd.bean.Shop;

public interface ShopService {
  public abstract List<Shop> findallshop();
  
  public abstract boolean addShop(Shop shop);
  
  public abstract boolean changeShop(Shop shop);
  
  public abstract Shop isEist(String string , String string2);
  
  
  public abstract boolean delete(int shopid);
  
  public abstract Shop findshopbyid(int id);
}
