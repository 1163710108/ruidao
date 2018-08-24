package com.rd.web.servlet;

import java.io.IOException; 
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import com.rd.bean.OrderItem;
import com.rd.bean.Product;
import com.rd.bean.Shop;
import com.rd.service.impl.OrderItemServiceImpl;
import com.rd.service.impl.ProductServiceImpl;
import com.rd.service.impl.ShopServiceImpl;

public class SellerServlet extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    
    String string = (String)request.getParameter("m");
    if(string.equals("tuichu")){
      tuichu(request, response);
    }else if(string.equals("productlist")){
      productlist(request, response);
    }else if(string.equals("delete")) {
      deleteproduct(request,response);
    }else if(string.equals("info")){
      info(request,response);
    }else if(string.equals("updateinfo")){
      updateinfo(request,response);
    }else if(string.equals("orderlist")){
      orderlist(request,response);
    }
    out.flush();
    out.close();
  }


  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    doGet(request, response);
  }
  
  
  private void orderlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    String string = (String)request.getParameter("shopid");
    Integer a = Integer.valueOf(string);
    
    List<OrderItem> list = new OrderItemServiceImpl().findorderitembyshop(a);
    if(list != null){
      System.out.println(list.size());
      request.setAttribute("orderitem", list);
      request.getRequestDispatcher("seller/orderitem/list.jsp").forward(request,response);
    }else {
      System.out.println("订单为空");
      request.getRequestDispatcher("seller/home.jsp").forward(request,response);
    }
  }
  
  
  private void info(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    /*Shop shop =(Shop) request.getSession().getAttribute("login_shop");*/
    
    String string = (String)request.getParameter("shopid");
    int a = Integer.valueOf(string);
    Shop shop = new ShopServiceImpl().findshopbyid(a);
    request.getSession().setAttribute("login_shop", shop);
    request.setAttribute("shop", shop);
    request.getRequestDispatcher("/seller/self/information.jsp").forward(request, response);
  }

  private void updateinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException {
    // TODO Auto-generated method stub
    String string = (String)request.getParameter("susername");
    String string1 = (String)request.getParameter("spassword");
    String string2 = (String)request.getParameter("sname");
    String string3 = (String)request.getParameter("semail");
    String string4 = (String)request.getParameter("stelephone");
    String string5 = (String)request.getParameter("smark");
    Double string6 = Double.valueOf((String)request.getParameter("earn"));
    Shop shop = new Shop(string, string1, string2, string6, string4, string3,string5);
    shop.setSid(Integer.valueOf((String)request.getParameter("pid")));
    System.out.println(shop.toString());
    
    boolean a = new ShopServiceImpl().changeShop(shop);
    if(a){
      try {
        request.getRequestDispatcher("seller/welcome.jsp").forward(request, response);
        //response.sendRedirect("index");
      } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }else{
      
    }
    
  }
  
  public void tuichu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    request.getSession().removeAttribute("login_shop");
    request.getRequestDispatcher("index").forward(request, response);
  }
  
  public void productlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    List<Product> list = new ProductServiceImpl().findBypshop(Integer.valueOf((String)request.getParameter("shopid")));
    System.out.println((String)request.getParameter("shopid"));
    if(list != null){
      request.setAttribute("productlist", list);
      System.out.println("chenggong");
      request.getRequestDispatcher("/seller/product/list.jsp").forward(request, response);
      
    }
    else{
      System.out.println("asdfasd");
    }
  }
  
  private void deleteproduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    String id = request.getParameter("pid");
    boolean a = new ProductServiceImpl().deleteProduct(Integer.valueOf(id));
    if(a){
      request.getRequestDispatcher("sellerservlet?m=productlist&shopid="+id).forward(request, response);
    }else{
      System.out.println("删除失败");
      request.getRequestDispatcher("/contraller/home.jsp").forward(request, response);
    }
    
  }


}
