package com.rd.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rd.bean.Cart;
import com.rd.bean.CartItem;
import com.rd.bean.Order;
import com.rd.bean.OrderItem;
import com.rd.bean.Product;
import com.rd.bean.Users;
import com.rd.service.impl.OrderItemServiceImpl;
import com.rd.service.impl.OrderServiceImpl;
import com.rd.service.impl.UserServiceImpl;
import com.rd.utils.CommonsUtils;

public class OrderServlet extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    String string = (String)request.getParameter("m");
    if(string.equals("tijiao")){
      tijiao(request,response);
    }else if(string.equals("change")){
      change(request,response);
    }else if(string.equals("selforder")){
      selforder(request,response);
    }else if(string.equals("selforderchange")){
      selforderchange(request,response);
    }
    
    out.flush();
    out.close();
  }



  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    doGet(request, response);
  }
  
  private void selforderchange(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    String sting = (String)request.getParameter("id");
    String string = (String)request.getParameter("address");
    string =new String(string.getBytes("ISO-8859-1"), "utf-8");
    
    new OrderServiceImpl().change(sting, string);
    
    request.getRequestDispatcher("orderservlet?m=selforder").forward(request, response);
  }
  


  private void selforder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    Users users = (Users)request.getSession().getAttribute("login_user");
    int a = users.getU_id();
    System.out.println(a);
    List<Order> list = new OrderServiceImpl().findbyuserid(a);
      request.setAttribute("list", list);
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("utf-8");
      request.getRequestDispatcher("selforder.jsp").forward(request, response);

  }
  
  private void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    String sting = (String)request.getParameter("orderid");
    String string = (String)request.getParameter("address");
    string = new String(string.getBytes("ISO-8859-1"), "utf-8");
    new OrderServiceImpl().change(sting, string);
    Cart cart = (Cart)request.getSession().getAttribute("cart");
    Users users = (Users)request.getSession().getAttribute("login_user");
    users.setUcost(cart.getTotal());
    new UserServiceImpl().change(users);
    request.getSession().setAttribute("login_user", users);
    cart.setTotal(0);
    cart.getList().clear();
    request.getSession().setAttribute("cart", cart);
    request.getRequestDispatcher("buycar.jsp").forward(request, response);
    
  }
  
  private void tijiao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    Cart cart = (Cart)request.getSession().getAttribute("cart");
    Order order = new Order();
    Users user = (Users)request.getSession().getAttribute("login_user");
    order.setOderid(CommonsUtils.getUUID());
    order.setOrdertime((new SimpleDateFormat().format(new Date())).toString());
    order.setTotal(cart.getTotal());
    order.setState(0);
    order.setAddress("");
    order.setUsersid(user.getU_id());
    order.setName(user.getUname());
    order.setTelephone(user.getUtelephone());
    new OrderServiceImpl().addOrder(order);
    
    for(CartItem c : cart.getList()){
      OrderItem orderItem = new OrderItem();
      orderItem.setCount(c.getBuyNum());
      orderItem.setOid(CommonsUtils.getUUID());
      orderItem.setProductid(c.getProduct().getPid());
      orderItem.setShop(c.getProduct().getPshop());
      orderItem.setSubtotal(c.getSubtotal());
      orderItem.setOrders(order.getOderid());
      new OrderItemServiceImpl().addOrderItem(orderItem);
    }
    request.getSession().setAttribute("order", order);
    request.getRequestDispatcher("order.jsp").forward(request, response);
  }

}
