package com.rd.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rd.bean.Order;
import com.rd.bean.Shop;
import com.rd.bean.Users;
import com.rd.service.impl.OrderServiceImpl;
import com.rd.service.impl.ShopServiceImpl;
import com.rd.service.impl.UserServiceImpl;

public class ContrallerServlet extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html；charset=utf-8");
    PrintWriter out = response.getWriter();
    String string = (String)request.getParameter("m");
    if(string.equals("addshop")){
      addshop(request, response);
    }else if(string.equals("deleteshop")){
      deleteshop(request, response);
    }else if(string.equals("shoplist")){
      shoplist(request,response);
    }else if(string.equals("yonghulist")){
      yonghulist(request,response);
    }else if(string.equals("tuichu")){
      tuichu(request,response);
    }else if(string.equals("orderlist")){
      orderlist(request,response);
    }
    response.sendRedirect(request.getContextPath()+"/index.jsp");
    out.flush();
    out.close();
  }
  
  

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
  
    doGet(request, response);
  }
  
  private void orderlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    List<Order> list = new OrderServiceImpl().findallorder();
    if(list != null){
      System.out.println(list.size());
      request.setAttribute("orderitem", list);
      request.getRequestDispatcher("contraller/order/list.jsp").forward(request, response);
      
    }else{
      System.out.println("订单查询失败，没有订单");
      request.getRequestDispatcher("contraller/home.jsp").forward(request, response);
    }
  }

  private void tuichu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    request.getRequestDispatcher("/index").forward(request, response);
  }
  
  private void yonghulist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    List<Users> users = new UserServiceImpl().findallusers();
    if(users != null){
      request.setAttribute("user", users);
      System.out.println("成功");
      request.getRequestDispatcher("/contraller/user/list.jsp").forward(request, response);
    }else{
      System.out.println("失败");
    }
  }
  
  
  private void shoplist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    List<Shop> shoplistsList = new ShopServiceImpl().findallshop();  
    if(shoplistsList != null){
      System.out.println(shoplistsList);
      request.setAttribute("shoplists", shoplistsList);
      request.getRequestDispatcher("contraller/seller/list.jsp").forward(request, response);
    }else{
      System.out.println("失败");
    }
  }
  
  
  public void addshop(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
    String username = (String)request.getParameter("susername");
    System.out.println(username);
    String password =(String)request.getParameter("spassword");
    String sern = (String)request.getParameter("sern");
    String sname = (String)request.getParameter("sname");
    String semail = (String)request.getParameter("semail");
    String stelephone = (String)request.getParameter("stelephone");
    String smark =(String)request.getParameter("smark");
    
    Shop shop = new Shop(username, password, sname, Double.valueOf(sern), stelephone, semail, smark);
    System.out.println(shop.toString());
    boolean a = new ShopServiceImpl().addShop(shop);
    System.out.println(a);
    if(a){
      try {
        request.getRequestDispatcher("/contrallerservlet?m=shoplist").forward(request, response);
      } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }else{
      System.out.println("添加店铺失败");
      request.getRequestDispatcher("/contraller/home.jsp").forward(request, response);
    }
    
    
  }
  
  public void deleteshop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    String shopid = (String)request.getParameter("pid");
    System.out.println("asdlfhoqiweknasljfabsd卡即使对方卡萨诺地方 " +shopid);
    int shop = Integer.valueOf(shopid);
    boolean ifdelte = new ShopServiceImpl().delete(shop);
    
    if(ifdelte){
      try {
        request.getRequestDispatcher("/contrallerservlet?m=shoplist").forward(request, response);
      } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }else {
      System.out.println("添加店铺失败");
      request.getRequestDispatcher("/contraller/home.jsp").forward(request, response);
    }
  }
}
