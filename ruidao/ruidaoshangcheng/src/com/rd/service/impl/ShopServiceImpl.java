package com.rd.service.impl;

import java.sql.SQLException; 
import java.util.List;
import com.rd.bean.Shop;
import com.rd.dao.ShopDao;
import com.rd.service.ShopService;

public class ShopServiceImpl implements ShopService {

  public boolean addShop(Shop shop) {

    ShopDao shopDao =new ShopDao();
    int a = 0 ; 
    try {
      a = shopDao.addShop(shop);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return a>0?true:false;
  }

  public boolean changeShop(Shop shop) {
    ShopDao shopDao =new ShopDao();
    int a = 0 ; 
    try {
      a = shopDao.changeShop(shop);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return a>0?true:false;
  }

  public List<Shop> findallshop() {
    List<Shop> list = null;
    try {
      list = new ShopDao().findallshop();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return list;
  }

  public Shop isEist(String string, String string2) {
    Shop shop=null;
    try{
      shop = new ShopDao().isEist(string, string2);
    }catch (SQLException e) {
      // TODO: handle exception
      e.printStackTrace();
    }
    return shop;
  }

  public boolean delete(int shopid) {
    // TODO Auto-generated method stub
    ShopDao shopDao = new ShopDao();
    int a =0;
    try {
      a = shopDao.delete(shopid);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return a>0?true:false;
  }

  public Shop findshopbyid(int id) {
    ShopDao shopDao  = new ShopDao();
    Shop shop = null;
    try {
      shop= shopDao.findshopbyid(id);
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return shop;
  }
}
