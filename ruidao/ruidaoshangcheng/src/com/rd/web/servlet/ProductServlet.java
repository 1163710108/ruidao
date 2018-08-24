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
import com.rd.bean.Category;
import com.rd.bean.History;
import com.rd.bean.PageBean;
import com.rd.bean.Product;
import com.rd.service.ProductService;
import com.rd.service.impl.CategoryServiceImpl;
import com.rd.service.impl.ProductServiceImpl;

@SuppressWarnings("serial")
public class ProductServlet extends HttpServlet {

  @SuppressWarnings("unchecked")
  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    
    List<History> list = (List<History>) request.getSession().getAttribute("history");
    if(list ==null){
      list = new ArrayList<History>();
    }
    request.getSession().setAttribute("history", list);
    String string = (String)request.getParameter("m");
    
    if(string.equals("showlist")){
      showlist(request,response);
    }else if(string.equals("infoofproduct")){
      infoofproduct(request,response);
    }else if(string.equals("history")){
      history(request,response);
    }else if(string.equals("deletehistory")){
      deletehistory(request,response);
    }else if(string.equals("tianjiagouwuche")){
      tianjiagouwuche(request,response);
    }else if(string.equals("updateproduct")){
      updateproduct(request,response);
    }else if(string.equals("updateproduct1")){
      //updateproduct1(request, response);
    }else if(string.equals("yichugouwuche")){
      yichugouwuche(request,response);
    }else if(string.equals("search")){
      search(request,response);
    }
    out.flush();
    out.close();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {

    doGet(request, response);
  }
  
  private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    String string = (String)request.getParameter("searchs");
    string = new String(string.getBytes("ISO-8859-1"), "utf-8");
    System.out.println(string);
    List<Product> list = new ProductServiceImpl().searchpruduct(string);
    if(list != null){
      System.out.println(list.size());
      request.setAttribute("list", list);
      request.getRequestDispatcher("search.jsp").forward(request, response);
    }else {
      System.out.println("list   weikong ");
    }
    
  }
  

  private void yichugouwuche(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    String string = (String)request.getParameter("id");
    int a = Integer.valueOf(string);
    Cart cart = (Cart)request.getSession().getAttribute("cart");
    
    for(int i =0;i<cart.getList().size();i++){
      if(cart.getList().get(i).getProduct().getPid() == a){
        double b = cart.getTotal();
        cart.setTotal(b-cart.getList().get(i).getSubtotal());
        cart.getList().remove(i);
        break;
      }
    }
    
    request.getSession().setAttribute("cart", cart);
    request.getRequestDispatcher("buycar.jsp").forward(request, response);
    
  }

  private void tianjiagouwuche(HttpServletRequest request, HttpServletResponse response) {
    // TODO Auto-generated method stub
    Integer a = Integer.valueOf((String)request.getParameter("num"));
    Integer id = Integer.valueOf((String)request.getParameter("id"));
    
    Product p = new ProductServiceImpl().findProductbypid(id);

    double money = p.getPprice()*p.getPdiscount()*a;
    CartItem cartItem = new CartItem();
    cartItem.setBuyNum(a);
    cartItem.setProduct(p);
    cartItem.setSubtotal(money);
    
    Cart cart = (Cart) request.getSession().getAttribute("cart");
    if(cart==null){
        cart = new Cart();
        cart.setTotal(0);
    }
    double total = cart.getTotal()+ money;
    cart.getList().add(cartItem);
    cart.setTotal(total);
    
    request.getSession().setAttribute("cart", cart);
    
  }


  private void deletehistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    List<History> list = (List<History>) request.getSession().getAttribute("history");
    list.clear();
    request.getSession().setAttribute("history", list);
    request.getRequestDispatcher("productservlet?m=history").forward(request, response);
  }
  private void history(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    List<History> list = (List<History>) request.getSession().getAttribute("history");
    System.out.println("adasd"+list.size());
    request.setAttribute("historys",list);
    request.getRequestDispatcher("history.jsp").forward(request, response);
  }

  private void updateproduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    String string = (String)request.getParameter("id");
    Product p = new ProductServiceImpl().findProductbypid(Integer.valueOf(string));
    System.out.println(p.toString());
    
    List<Category> list = new CategoryServiceImpl().findallkind();
    request.setAttribute("product", p);
    request.setAttribute("categorys", list);
    request.getRequestDispatcher("seller/product/edit.jsp").forward(request, response);
  }
 
  private void showlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    Integer cid = Integer.valueOf((String)request.getParameter("cid"));
    ProductService p = new ProductServiceImpl();
    
    String currentPageStr = request.getParameter("currentPage");
    if(currentPageStr==null) currentPageStr="1";
    int currentPage = Integer.parseInt(currentPageStr);
    //认为每页显示10条
    int currentCount = 10;
    
    PageBean<Product> pageBean = null;
    pageBean = p.findPageBean(cid,currentPage,currentCount);
    
    request.setAttribute("pageBean", pageBean);
    
    request.setAttribute("cid", cid);
    
    request.getRequestDispatcher("product_list.jsp").forward(request, response);
  }
  @SuppressWarnings("unchecked")
  private void infoofproduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    Integer id = Integer.valueOf((String)request.getParameter("id"));
    Product product = new ProductServiceImpl().findProductbypid(id);
    List<History> list = (List<History>) request.getSession().getAttribute("history");
    System.out.print(list.size()+"     ");
    History h = new History(product.getPid(),product.getPimage(), product.getPname(), product.getPprice(), (new SimpleDateFormat().format(new Date())).toString());
    list.add(h);
    System.out.println(list.size());
    request.getSession().setAttribute("history",list);
    request.setAttribute("product", product);
    request.getRequestDispatcher("product_info.jsp").forward(request, response);
  }
}
