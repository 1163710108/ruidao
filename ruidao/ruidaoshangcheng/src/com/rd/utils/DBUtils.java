package com.rd.utils;

import java.io.InputStream;
import java.util.Properties;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;

public class DBUtils {
  private static BasicDataSource datasource = new BasicDataSource();
  private static String driverClass;
  private static String url;
  private static String username;
  private static String password;
  static{
    try{
      readconfig();
      datasource.setDriverClassName(driverClass);
      datasource.setUrl(url);
      datasource.setUsername(username);
      datasource.setPassword(password);
      
      datasource.setInitialSize(10);//初始化的连接数
      datasource.setMaxActive(8);//最大连接数量
      datasource.setMaxIdle(5);//最大空闲数
      datasource.setMinIdle(1);//最小空闲
    }catch(Exception ex){
      ex.printStackTrace();
      throw new RuntimeException("数据库链接失败");
    }
  }
  
  
  private static void readconfig() throws Exception{
    InputStream in =
      DBUtils.class.getClassLoader().getResourceAsStream("database.properties");
    Properties pro = new Properties();
    pro.load(in);
    driverClass = pro.getProperty("driverClass");
    url = pro.getProperty("url");
    username = pro.getProperty("username");
    password = pro.getProperty("password");
  }
  
  public static DataSource getDataSource(){
    return datasource;
}
}
