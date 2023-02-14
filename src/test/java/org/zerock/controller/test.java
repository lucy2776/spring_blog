package org.zerock.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class test {

   @Autowired
   DataSource ds;
   
   @Autowired
   SqlSessionFactory sessionFactory;
   
//   @Autowired
//   RestAPIMapper mapper;
   
   
   @Test
   public void testConnection() {
      try {
           Class.forName("oracle.jdbc.driver.OracleDriver");
           
           Connection conn = DriverManager.getConnection(
                 "jdbc:oracle:thin:@//localhost:1521/XE","user1","1234");
           
           log.info(conn);
           conn.close();
           
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   @Test
   public void testConn() {
      try(Connection conn = ds.getConnection()){
         log.info(conn);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   @Test
   public void testConn2() {
      try(SqlSession session = sessionFactory.openSession();
            Connection conn = session.getConnection()){
         log.info("session : " + session);
         log.info("conn : " + conn);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
}
