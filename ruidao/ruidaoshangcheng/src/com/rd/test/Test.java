package com.rd.test;

import java.sql.SQLException;
import java.text.SimpleDateFormat; 
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import com.rd.bean.Category;
import com.rd.bean.Order;
import com.rd.bean.OrderItem;
import com.rd.bean.Product;
import com.rd.bean.Shop;
import com.rd.bean.Users;
import com.rd.dao.OrderDao;
import com.rd.dao.ProductDao;
import com.rd.dao.ShopDao;
import com.rd.dao.Userdao;
import com.rd.service.impl.CategoryServiceImpl;
import com.rd.service.impl.OrderItemServiceImpl;
import com.rd.service.impl.ProductServiceImpl;
import com.rd.service.impl.ShopServiceImpl;
import com.rd.service.impl.UserServiceImpl;
import com.rd.utils.CommonsUtils;
import com.rd.utils.MailUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.org.apache.bcel.internal.generic.Select;



public class Test {

  /**
   * @param args
   * @throws SQLException 
   * @throws MessagingException 
   * @throws AddressException 
   */
  public static void main(String[] args) throws SQLException {
  // TODO Auto-generated method stub
    
     Users u = new Userdao().login("zhangsan", "123");
     System.out.println(u.getU_id());
  }
  

}
