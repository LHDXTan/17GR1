package cn.easybuy.utils;

import java.io.Serializable;
import java.sql.SQLException;

public class UniqueConstraintException extends RuntimeException implements
		Serializable {

	private static final long serialVersionUID = -6984743006223373424L;

	// 包装类异常
	public UniqueConstraintException(SQLException e) {
		super(e);
	}

}
