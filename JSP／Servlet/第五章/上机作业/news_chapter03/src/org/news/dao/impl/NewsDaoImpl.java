﻿package org.news.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
                + " `ncreateDate`, `nsummary`, `tname` FROM `NEWS`, `TOPIC`"
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
    @Override
	public int delNewId(int nid) {
		Connection co = super.getConnection();
		int count = 0;
		Statement st=null;
		try {
			 st= co.createStatement();
			String sql="delete from news where nid="+nid+"";
			 count= st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeAll(co, st, null);
		return count;
	}

	@Override
	public int update(int id) {
		Connection co = super.getConnection();
		PreparedStatement pr=null;
		try {
			String sql = "update news set";
			pr = co.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	
}
