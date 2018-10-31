package org.news.entity;

import java.io.Serializable;

/*
 * 主题 实体类
 * @author
 */
public class Topic implements Serializable {
    private static final long serialVersionUID = 2786883833042050721L;
    private String tid;
	private String tname;

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

}
