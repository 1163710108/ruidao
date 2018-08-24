package com.rd.web.servlet;
import java.io.IOException;  
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rd.bean.Users;
import com.rd.service.impl.UserServiceImpl;

public class RegisterUserServlet extends HttpServlet {

 
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String string1 = (String)request.getParameter("uyanzhengma");
    String string2 = (String)request.getSession().getAttribute("randCheckCode");
    System.out.println(string1);
    System.out.println(string2);
    if(string1.equals(string2)){
      Users users = new Users();
      users.setUusername((String)request.getParameter("uusername"));
      users.setUpassword((String)request.getParameter("upassword"));
      users.setUname((String)request.getParameter("uname"));
      users.setUsex((String)request.getParameter("usex"));
      System.out.println((String)request.getParameter("usex"));
      users.setUbirthday((String)request.getParameter("ubirthday"));
      users.setUemail((String)request.getParameter("uemail"));
      users.setUtelephone((String)request.getParameter("utelephone"));
      users.setUdate((new SimpleDateFormat().format(new Date())).toString());
      users.setUmark("");
      users.setUcost(0);
      new UserServiceImpl().register(users);
      response.sendRedirect(request.getContextPath()+"/registersucces.jsp");
      request.getSession().setAttribute("error", "");
    }else{
      response.sendRedirect(request.getContextPath()+"/register.jsp");
      request.getSession().setAttribute("error", "验证码错误");
    }
    
    
    
    out.flush();
    out.close();
  }

  /**
   * The doPost method of the servlet. <br>
   *
   * This method is called when a form has its tag value method equals to post.
   * 
   * @param request the request send by the client to the server
   * @param response the response send by the server to the client
   * @throws ServletException if an error occurred
   * @throws IOException if an error occurred
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    doGet(request, response);
  }


}
