package com.rd.service.impl;

import java.sql.SQLException;
import java.util.List;
import com.rd.bean.Users;
import com.rd.dao.Userdao;
import com.rd.service.UserService;

public class UserServiceImpl implements UserService {

  public boolean register(Users user) {
    Userdao dao = new Userdao();
    int row = 0;
    try {
      row = dao.regist(user);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return row>0?true:false;
  }

  public boolean checkUsername(String usename) {
    Userdao dao = new Userdao();
    int isExist = 0;
    try {
        isExist = dao.checkUsername(usename);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return isExist>0?true:false;
  }
  public boolean change(Users user) {
    Userdao dao = new Userdao();
    int a = 0;
    try {
      a = dao.change(user);
  } catch (SQLException e) {
      e.printStackTrace();
  }
  return a>0?true:false;
  }

  public Users login(String usernameString, String passwordString) {
    Userdao dao = new Userdao();
    Users users = null;
    try {
      users = dao.login(usernameString, passwordString);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return users;
  }

  public List<Users> findallusers() {
    List<Users> list = null;
    try {
      list = new Userdao().findallusers();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return list;
  }

  public Users findbyidUsers(int id) {
    Users s =null;
    try {
      s= new Userdao().findbyidUsers(id);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return s;
  }
}
