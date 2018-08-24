package com.rd.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import com.rd.bean.Users;
import com.rd.utils.DBUtils;

public class Userdao {
  private static QueryRunner qr = new QueryRunner(DBUtils.getDataSource());

  /**
   * 注册用户 到数据库中
   * 
   * @param user 注册用户的信息
   * @return 如成功返回1 不成功返回0
   * @throws SQLException
   */
  public int regist(Users user) throws SQLException {
    String sql = "insert into users values(user_id.nextval,?,?,?,?,?,?,?,?,?,?) ";
    Object[] params =
        {user.getUusername(), user.getUpassword(), user.getUname(), user.getUemail(),
            user.getUtelephone(), user.getUbirthday(),user.getUsex(),user.getUmark(),user.getUcost(),user.getUdate()};
    int a = qr.update(sql, params);
    return a;
  }


  public int checkUsername(String username) throws SQLException {
    String sql = "select count(*) from users where uusername=?";
    Object query = qr.query(sql, new ScalarHandler<Object>(), username);
    return Integer.parseInt(query.toString());
  }
  
  public Users login(String username , String password) throws SQLException{
    String sql = "select * from users where uusername=? and upassword=?";
    Object[] params = {username,password};
    Users users = qr.query(sql, new BeanHandler<Users>(Users.class),params);
    return users;
  }


  public int change(Users user) throws SQLException {
    String sql =
        "update users set uusername = ? , upassword=? , uname = ? , uemail=?,utelephone=?,ubirthday=? , usex=?,umark=? where u_id=?";
    Object[] params =
        {user.getUusername(), user.getUpassword(), user.getUname(), user.getUemail(),
            user.getUtelephone(), user.getUbirthday(), user.getUsex(), user.getUmark(),
            user.getU_id()};
    int a = qr.update(sql,params);
    return a;
  }
  
  public List<Users> findallusers() throws SQLException{
    String sql = "select * from users";
    List<Users> list = qr.query(sql, new BeanListHandler<Users>(Users.class));
    return list;
  }
  
  public Users findbyidUsers(int id) throws SQLException{
    return qr.query("select * from users where u_id = ?",new BeanHandler<Users>(Users.class),id);
  }


}
