package com.rd.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.rd.bean.Shop;
import com.rd.bean.Users;
import com.rd.service.impl.ShopServiceImpl;
import com.rd.service.impl.UserServiceImpl;

public class LoginServlet extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession();
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    
    
    String string = (String)request.getParameter("m");
    if(string.equals("loginyonghu")){
      String strin= (String) request.getSession().getAttribute("randCheckCode");
      String username = (String)request.getParameter("login_usename");
      String password = (String)request.getParameter("login_password");
      System.out.println(username);
      System.out.println(password);
      String yanzhengString = (String)request.getParameter("login_yanzheng");
      Users users = null;
      users = new UserServiceImpl().login(username, password);
      if(strin.equals(yanzhengString)){
        if(users != null ){
          System.out.println(users.getU_id());
          session.setAttribute("login_user", users);
          response.sendRedirect(request.getContextPath()+"/index");
          session.setAttribute("error", "");
        }else{
          session.setAttribute("error", "账号或者密码错误");
          response.sendRedirect(request.getContextPath()+"/index");
        }
      }else{
        session.setAttribute("error", "验证码错误");
      }
    }else if(string.equals("loginoutyonghu")){
      session.removeAttribute("login_user");
      response.sendRedirect(request.getContextPath()+"/index");
    }else if(string.equals("logindianjia")){
      String username = (String)request.getParameter("login_usename");
      String password= (String)request.getParameter("login_password");
      String string3 =(String)request.getSession().getAttribute("randCheckCode");
      String string2 =(String)request.getParameter("login_yanzheng");
      Shop shop = new ShopServiceImpl().isEist(username,password);
      if(string3.equals(string2)){
        if(shop!=null){
          session.setAttribute("login_shop", shop);
          response.sendRedirect(request.getContextPath()+"/seller/home.jsp");
        }
      }else{
        System.out.println("登陆失败");
        response.sendRedirect(request.getContextPath()+"/index");
      }
    }else if(string.equals("loginguanliyuan")){
      String string2 = request.getParameter("login_usename");
      if(string2.equals("ruidaoshangcheng") && InetAddress.getLocalHost().getHostName().equals("DESKTOP-BDDOAN1")){
        request.getSession().setAttribute("guanliyuan", "ruidaoshangcheng");
        System.out.println("成功");
        response.sendRedirect(request.getContextPath()+"/contraller/home.jsp");
      }else{
        response.sendRedirect("index");
      }
    }
    
    out.flush();
    out.close();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    doGet(request, response);
  }

}
