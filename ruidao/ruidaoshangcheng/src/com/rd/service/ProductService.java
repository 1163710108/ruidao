package com.rd.service;

import java.util.List;
import com.rd.bean.PageBean;
import com.rd.bean.Product;


public interface ProductService {
  
  public abstract List<Product> findByKindproduct(int pid);
  
  
  public abstract List<Product> findBypshop(int shopid);
  
  public abstract boolean deleteProduct(int pid);

  public abstract List<Product> fourProduct(int id);

  public abstract Product findProductbypid(int pid);
  
  public abstract PageBean<Product> findPageBean(Integer cid, int currentPage, int currentCount);
  
  
  public abstract List<Product> fourProducthot();
  
  public abstract List<Product> fourProductdiscount();
  
  public abstract List<Product> searchpruduct(String s);
  
  
}
