package org.news.services.impl;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.news.dao.impl.*;
import org.news.dao.*;
import org.news.entity.News;
import org.news.servicess.newServices;

public class newServicesImp implements newServices{
	NewsDao newd = new NewsDaoImpl();
	TopicsDao topicd = new TopicsDaoImpl();
	
	@Override
	public List<News> selectNew() {
		List<News> list = newd.getAllnews();
		return list;

	}
	public void selectNew(HttpServletRequest request,
			HttpServletResponse response) {
		List<News> list = newd.getAllnews();
		 request.setAttribute("list", list);
		 try {
			request.getRequestDispatcher("newspages/admin.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	@Override
	public int deleteNew(HttpServletRequest request,
			HttpServletResponse response) {
		String n= request.getParameter("nid");
		if(n!=null){
			int nid=Integer.parseInt(n);
			int delete = newd.deleteNews(nid);
			if(delete>0){
				selectNew(request, response);
			}
		return delete;
	}
		return 0;
}
	@Override
	public int updateNew(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		String n= request.getParameter("nid");
		if(n!=null){
			int nid=Integer.parseInt(n);
		    String nti= request.getParameter("ntid");
		    int ntid =Integer.parseInt(nti);
		    News nn=new News();
		    nn.setNid(nid);
		    nn.setNtid(ntid);
		    nn.setNtitle(request.getParameter("ntitle"));
		    nn.setNauthor(request.getParameter("nauthor"));
			nn.setNsummary(request.getParameter("nsummary"));
			nn.setNcontent(request.getParameter("ncontent"));
		   nn.setNcreatedate(new Date());
			int upd = newd.updateNews(nn);
		    if(upd>0){
		    	
		    	selectNew(request, response);
		    }
		    
		}
		return 0;
	}
	@Override
	public int insertNew(HttpServletRequest request,
			HttpServletResponse response) {
		 News nn=new News();
		 String nti= request.getParameter("ntid");
		 int ntid =Integer.parseInt(nti);
	    nn.setNtid(ntid);
	    nn.setNtitle(request.getParameter("ntitle"));
	    nn.setNauthor(request.getParameter("nauthor"));
		nn.setNsummary(request.getParameter("nsummary"));
		nn.setNcontent(request.getParameter("ncontent"));
	   nn.setNcreatedate(new Date());
		 int ti=newd.insert(nn);
		 selectNew(request, response);
		return ti;
	}
}