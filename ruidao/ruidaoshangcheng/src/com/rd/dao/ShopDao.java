package com.rd.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.rd.bean.Shop;
import com.rd.bean.Users;
import com.rd.utils.DBUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class ShopDao {
  private static QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
  
  
  public List<Shop> findallshop() throws SQLException{
    String sql = "select * from shop order by sid";
    List<Shop> list = qr.query(sql,new BeanListHandler<Shop>(Shop.class));
    return list;
  }
  
  public int addShop(Shop shop) throws SQLException{
    
    String sql = "insert into shop values (shop_id.nextval,?,?,?,?,?,?,?)";
    Object[] params = {shop.getSusername(),shop.getSpassword(),shop.getSname(),shop.getSern(),shop.getStelephone(),shop.getSemail(),shop.getSmark()};
    int a = qr.update(sql,params);
    return a;
  }
  
  public int changeShop(Shop shop) throws SQLException{
    String sql = "update shop set susername =? , spassword = ? , sname = ? , sern = ? , stelephone = ? , semail = ? ,smark = ? where sid = ?";
    Object[] params = {shop.getSusername() , shop.getSpassword() , shop.getSname() , shop.getSern(),shop.getStelephone(),shop.getSemail(),shop.getSmark(),shop.getSid()};
    int a = qr.update(sql,params);
    return a ;
  }
  
  public Shop isEist(String string , String string2) throws SQLException{
    String sql = "select * from shop where susername=? and spassword=?";
    Object[] params = {string ,string2};
    Shop users = qr.query(sql, new BeanHandler<Shop>(Shop.class),params);
    return users;
  }
  
  
  public int delete(int shopid) throws SQLException {
    String sql = "delete from shop where sid= ?";
    int a = qr.update(sql,shopid);
    return a ;
  }
  
  public Shop findshopbyid(int id) throws SQLException{
    Shop shop = qr.query("select * from shop where sid = ?", new BeanHandler<Shop>(Shop.class),id);
    return shop;
  }
}
