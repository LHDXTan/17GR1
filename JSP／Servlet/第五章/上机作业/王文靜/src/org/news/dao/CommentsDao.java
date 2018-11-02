package org.news.dao;

import java.util.List;

import org.news.entity.Comment;

public interface CommentsDao{
	//通过nid查找评论
	public List<Comment> getCommentsByNid(String nid);
	//添加评论
	public int addComment(Comment comment);
}