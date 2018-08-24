package com.rd.service;

import java.util.List;
import com.rd.bean.Users;

public interface UserService {
  public abstract boolean register(Users user);
  
  public abstract boolean checkUsername(String usename);
  
  public boolean change(Users user);
  
  
  public abstract Users login(String usernameString , String passwordString); 
  
  public abstract List<Users> findallusers();
  
  public abstract Users findbyidUsers(int id);
}
