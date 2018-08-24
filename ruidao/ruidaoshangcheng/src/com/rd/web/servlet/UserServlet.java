package com.rd.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rd.bean.Cart;
import com.rd.bean.Users;
import com.rd.service.impl.UserServiceImpl;

public class UserServlet extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    
    Users users = (Users)request.getSession().getAttribute("login_user");

    String string = (String)request.getParameter("username");

    String string1 = (String)request.getParameter("date");

    String string2 = (String)request.getParameter("sex");

    String string3 = (String)request.getParameter("telephone");

    String string4 = (String)request.getParameter("email");

    String string5 = (String)request.getParameter("newpassword");

    users.setUusername(string);
    users.setUdate(string1);
    users.setUsex(string2);
    users.setUtelephone(string3);
    users.setUemail(string4);
    if(string5 == null){
      boolean a = new UserServiceImpl().change(users);
      if(a){
        System.out.println("后端修改成功");
      }
      request.getSession().setAttribute("login_user", users);
      request.getRequestDispatcher("information.jsp").forward(request, response);
    }else{
      users.setUpassword(string5);
      new UserServiceImpl().change(users);
      request.getSession().setAttribute("login_user", users);
      request.getRequestDispatcher("information.jsp").forward(request, response);
    }
    
    
    out.flush();
    out.close();
  }


  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
