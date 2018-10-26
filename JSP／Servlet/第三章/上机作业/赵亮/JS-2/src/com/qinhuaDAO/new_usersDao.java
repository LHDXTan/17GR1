package com.qinhuaDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qinhua.empity.news_users;

public class new_usersDao extends BaseDao{
    public news_users findA(Object[] o,String sql){
    	Connection con = getcon();
    	PreparedStatement ps=null;
    	 ResultSet rs=null;
    	try {
			 ps = con.prepareStatement(sql);
			 if(o!=null){
				 
				 for (int i = 0; i < o.length; i++) {
					 ps.setObject(i+1, o[i]);
				 }
			 }
			rs = ps.executeQuery();
		     while(rs.next()){
		    	 news_users user = new news_users();
		    	 user.setUname(rs.getString("uname"));
		    	 user.setUpwd(rs.getString("upwd"));
		    	 user.setUid(rs.getInt("uid"));
		    	 return user;
		     }
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    	
    	
    	
		return null;
    	
    }
    public static void main(String[] args) {
       new_usersDao s = new	new_usersDao(); 
       
       String sql="select * from news_users where uname=?";
	Object[] o={"c"};
	news_users u = s.findA(o, sql);
	if(u!=null){
		
		System.out.println(u.getUpwd()+u.getUname()+u.getUid());
	}
	}
}
