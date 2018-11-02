package org.news.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.news.dao.BaseDao;
import org.news.dao.CommentsDao;
import org.news.entity.Comment;
import org.news.util.DatabaseUtil;

import java.sql.ResultSet;

public class CommentDaoImp extends BaseDao implements CommentsDao{

	public CommentDaoImp(Connection conn) {
		super(conn);
	}
	// 通过新闻id查找评论
	@Override
	public List<Comment> getCommentsByNid(int nid) throws SQLException {
		List<Comment> list=new ArrayList<Comment>();
		String sql="select * from comments where cnid=? order by cdate desc";
		ResultSet rs=null;
		 try {
		rs=executeQuery(sql, nid);
		Comment comment=null;
		while(rs.next()){
			comment=new Comment();
			comment.setCid(rs.getInt("cid"));
			comment.setCnid(rs.getInt("cnid"));
            comment.setCauthor(rs.getString("cauthor"));
            comment.setCip(rs.getString("cip"));
            comment.setCcontent(rs.getString("ccontent"));
            comment.setCdate(rs.getTimestamp("cdate"));
            list.add(comment);
		 }
} catch (SQLException e) {
    e.printStackTrace();
    throw e;
} finally {
    DatabaseUtil.closeAll(null, null, rs);
}
		return list;
	}
	// 添加评论
	@Override
	public int addComment(Comment comment){
		String sql="insert into comments(cnid,ccontent,cdate,cip,cauthor)values(?,?,?,?,?)";
		System.out.println(comment.getCid()+":"+comment.getCcontent()
                + ":" + comment.getCdate() + ":" + comment.getCip() + ":"
                + comment.getCauthor());
		int result=0;
		try {
		result=executeUpdate(sql, params);
		 } catch (SQLException e) {
	            e.printStackTrace();
	            throw e;
	        }
		return result;
	}

}
