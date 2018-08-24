package com.rd.web.servlet;

import java.io.IOException; 
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.rd.bean.Category;
import com.rd.bean.Product;
import com.rd.service.impl.CategoryServiceImpl;
import com.rd.service.impl.ProductServiceImpl;

@SuppressWarnings("serial")
public class Index extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html;charset=utf-8");
    response.setCharacterEncoding("utf-8");
    PrintWriter out = response.getWriter();
    List<Category> list = new CategoryServiceImpl().findallkind();
    
    for(Category c : list){
      int a = c.getCid();
      List<Product> l = new ProductServiceImpl().fourProduct(a);
      c.setList(l);
    }
    List<Product> hot = new ProductServiceImpl().fourProducthot();
    List<Product> discount =new ProductServiceImpl().fourProductdiscount();
    
    request.setAttribute("category",list);
    request.setAttribute("hot",hot);
    request.setAttribute("discount",discount);
    request.getRequestDispatcher("index.jsp").forward(request, response);
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
