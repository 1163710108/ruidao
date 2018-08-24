package com.rd.service.impl;

import java.sql.SQLException;
import java.util.List;
import com.rd.bean.PageBean;
import com.rd.bean.Product;
import com.rd.dao.ProductDao;
import com.rd.service.ProductService;

public class ProductServiceImpl implements ProductService {

  public List<Product> findByKindproduct(int pid) {
    // TODO Auto-generated method stub
    return null;
  }

  public List<Product> findBypshop(int shopid) {
    ProductDao p = new ProductDao();
    List<Product> list = null;
    try {
       list = p.findBypshop(shopid);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return list;
  }

  public boolean deleteProduct(int pid) {
    ProductDao p = new ProductDao();
    int a=0;
    try {
      a = p.deleteProduct(pid);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return a>0?true:false;
  }

  public List<Product> fourProduct(int id) {
    ProductDao p = new ProductDao();
    List<Product> list = null;
    try {
       list = p.fourProduct(id);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return list;
  }

  public PageBean<Product> findPageBean(Integer cid, int currentPage, int currentCount) {
    // TODO Auto-generated method stub
    PageBean<Product> pageBean = new PageBean<Product>();
    ProductDao dao = new ProductDao();
    //1、封装当前页
    pageBean.setCurrentPage(currentPage);
    //2、封装每页显示的条数
    pageBean.setCurrentCount(currentCount);
    //3、封装总条数
    int totalCount = 0;
    try {
        totalCount = dao.findByCidproduct(cid).size();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    pageBean.setTotalCount(totalCount);
    //4、封装总页数
    int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
    pageBean.setTotalPage(totalPage);
    
    //5、当前页显示的数据
    // select * from product where cid=? limit ?,?
    // 当前页与起始索引index的关系
    int index = (currentPage-1)*currentCount;
    List<Product> list = null;
    try {
        list = dao.findBypcategory(cid,index+1,currentCount*currentPage);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    pageBean.setProductList(list);
    
    return pageBean;
  }
  public Product findProductbypid(int pid) {
    Product p = null;
    ProductDao pa = new ProductDao();
    try {
      p = pa.findProductbypid(pid);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return p;
  }

  public List<Product> fourProductdiscount() {
    List<Product> p = null;
    ProductDao pa = new ProductDao();
    try {
      p = pa.fourProductdiscount();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return p;
  }

  public List<Product> fourProducthot() {
    List<Product> p = null;
    ProductDao pa = new ProductDao();
    try {
      p = pa.fourProducthot();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return p;
  }

  public List<Product> searchpruduct(String s) {
    List<Product> list = null;
    ProductDao p = new ProductDao();
    try {
      list = p.searchpruduct(s);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return list;
  }
  
}