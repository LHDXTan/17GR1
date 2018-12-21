package com.qhit.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodeFilter implements Filter{
	private String encode = null;
	public void destroy(){	encode = null; }
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) {
		if (null == request.getCharacterEncoding()) {
			try {
				request.setCharacterEncoding(encode);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		try {
			chain.doFilter(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

	public void init(FilterConfig filterConfig){
		String encode = filterConfig.getInitParameter("encode");
		if (this.encode == null) {
			this.encode = encode;
		}
	}
}
