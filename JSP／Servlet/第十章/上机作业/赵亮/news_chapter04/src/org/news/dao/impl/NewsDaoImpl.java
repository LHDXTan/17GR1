﻿package org.news.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.news.dao.BaseDao;
import org.news.dao.NewsDao;
import org.news.entity.News;

public class NewsDaoImpl extends BaseDao implements NewsDao {
    // 获取所有新闻
    public List<News> getAllnews() {
        List<News> list = new ArrayList<News>();
        ResultSet rs = null;
        String sql = "SELECT `nid`, `ntid`, `ntitle`, `nauthor`,"
                + " `ncreateDate`, `nsummary`, `ncontent` FROM `NEWS`, `TOPIC`"
                + " WHERE `NEWS`.`ntid` = `TOPIC`.`tid`"
                + " ORDER BY `ncreateDate` DESC";
        try {
            rs = this.executeQuery(sql);
            News news = null;
            while (rs.next()) {
                news = new News();
                news.setNid(rs.getInt("nid"));
                news.setNtid(rs.getInt("ntid"));
                news.setNtitle(rs.getString("ntitle"));
                news.setNauthor(rs.getString("nauthor"));
                news.setNcreatedate(rs.getDate("ncreateDate"));
                news.setNsummary(rs.getString("nsummary"));
                news.setNcontent(rs.getString("ncontent"));
                list.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn, null, rs);
        }
        return list;
    }
    public List<News> getAllnews(Object []lim) {
    	List<News> list = new ArrayList<News>();
    	ResultSet rs = null;
    	String sql = "SELECT `nid`, `ntid`, `ntitle`, `nauthor`,"
                + " `ncreateDate`, `nsummary`, `nauthor` FROM `NEWS` limit ?,? "  ;
    	try {
    		rs = this.executeQuery(sql,lim);
    		News news = null;
    		while (rs.next()) {
    			news = new News();
    			news.setNid(rs.getInt("nid"));
    			news.setNtid(rs.getInt("ntid"));
    			news.setNtitle(rs.getString("ntitle"));
    			news.setNauthor(rs.getString("nauthor"));
    			news.setNcreatedate(rs.getDate("ncreateDate"));
    			news.setNsummary(rs.getString("nsummary"));
    			news.setNauthor(rs.getString("nauthor"));
    			list.add(news);
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	} finally {
    		closeAll(conn, null, rs);
    	}
    	return list;
    }
    public int getAllnewsg() {
		ResultSet rs = null;
		String sql="select count(nid) from news";
		 int count = -1;
	        try {
	            rs = this.executeQuery(sql);
	            rs.next();
	            count = rs.getInt(1);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            closeAll(conn, null, rs);
	        }
	        return count;
		
	}
    // 获取某主题下的所有新闻
    public List<News> getAllnewsByTID(int tid) {
        List<News> list = new ArrayList<News>();
        ResultSet rs = null;
        String sql = "SELECT `nid`, `ntid`, `ntitle`, `nauthor`,"
                + " `ncreateDate`, `nsummary`, `tname` FROM `NEWS`, `TOPIC`"
                + " WHERE `NEWS`.`ntid` = `TOPIC`.`tid` AND `NEWS`.`ntid` = ?"
                + " ORDER BY `ncreateDate` DESC";
        try {
            rs = this.executeQuery(sql, tid);
            News news = null;
            while (rs.next()) {
                news = new News();
                news.setNid(rs.getInt("nid"));
                news.setNtid(rs.getInt("ntid"));
                news.setNtitle(rs.getString("ntitle"));
                news.setNauthor(rs.getString("nauthor"));
                news.setNcreatedate(rs.getDate("ncreateDate"));
                news.setNsummary(rs.getString("nsummary"));
                news.setNtname(rs.getString("tname"));
                list.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn, null, rs);
        }
        return list;
    }
    
    public int getNewsCountByTID(int tid) {
        ResultSet rs = null;
        String sql = "SELECT COUNT(`ntid`) FROM `news` WHERE `ntid` = ?";
        int count = -1;
        try {
            rs = this.executeQuery(sql, tid);
            rs.next();
            count = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn, null, rs);
        }
        return count;
    }
    //根据新闻ID删除新闻
    public int deleteNews(int nid){
    	String sql="delete from news where nid = ? ";
		
    	return super.executeUpdate(sql, nid);
    }
    //更新新闻
    public int updateNews(News n){
    	String sql="update news  set nid=?, ntid=?, ntitle=?, nauthor=?,"
                + " nsummary=? where nid=?";
    	Object[] pa={n.getNid(),n.getNtid(),n.getNtitle(),n.getNauthor(),n.getNsummary(),n.getNid()};
    	
    	return super.executeUpdate(sql, pa); 
    }
    //根据新闻ID查找新闻
    public News getAllnewsByNID(int nid) {
    	ResultSet rs = null;
    	News news = null;
    	String sql = "SELECT `nid`, `ntid`, `ntitle`, `nauthor`,"
    			+ " `ncreateDate`, `nsummary`, `ncontent` FROM `NEWS` where nid=?";
    	try {
    		rs = this.executeQuery(sql, nid);
    		while (rs.next()) {
    			news = new News();
    			news.setNid(rs.getInt("nid"));
    			news.setNtid(rs.getInt("ntid"));
    			news.setNtitle(rs.getString("ntitle"));
    			news.setNauthor(rs.getString("nauthor"));
    			news.setNcreatedate(rs.getDate("ncreateDate"));
    			news.setNsummary(rs.getString("nsummary"));
    			news.setNcontent(rs.getString("ncontent"));
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	} finally {
    		closeAll(conn, null, rs);
    	}
    	return news;
    }

	@Override
	public int insert(News n) {
		String sql ="insert into news(ntid,ntitle,nauthor,ncreateDate,nsummary,ncontent) values(?,?,?,?,?,?)";
		
		Object[] pa={n.getNtid(),n.getNtitle(),n.getNauthor(),n.getNcreatedate(),n.getNsummary(),n.getNauthor()};
		
		return super.executeUpdate(sql, pa); 
	}

}
