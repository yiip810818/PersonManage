package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.java1234.model.Attendment;
import com.java1234.model.PageBean;
import com.java1234.util.StringUtil;

public class AttendmentDao {

	public ResultSet attendmentList(Connection con,PageBean pageBean,Attendment attendment) throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_attendment");
		if(attendment!=null&&!StringUtil.isEmpty(attendment.getDepartmentName())){
			sb.append(" and departmentname like '%"+attendment.getDepartmentName()+"%'");
		}
		if(attendment!=null&&!StringUtil.isEmpty(attendment.getIsLate())){
			sb.append(" and islate like '%"+attendment.getIsLate()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();		
	}
	
	public int attendmentCount(Connection con)throws Exception{
		String sql="select count(*) as total from t_attendment";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	public int positionAdd(Connection con,Attendment attendment) throws Exception{
		String sql="insert into t_attendment (attendId,userName,departmentName,workDate,workoffDate,isLate,isOff,offContent) values(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, attendment.getAttendId());
		pstmt.setString(2, attendment.getUserName());
		pstmt.setString(3, attendment.getDepartmentName());
		pstmt.setString(4,attendment.getWorkDate());
		pstmt.setDate(5, attendment.getWorkoffDate());
		pstmt.setString(6, attendment.getIsLate());
		pstmt.setString(7, attendment.getIsOff());
		pstmt.setString(8, attendment.getOffContent());
		return pstmt.executeUpdate();		
	}
	
	public int attendmentDelete(Connection con,String delIds)throws Exception{
		String sql="delete from t_attendment where attendId in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public int positionModify(Connection con,Attendment attendment)throws Exception{
		String sql="update t_attendment set attendId=?,userName=?,departmentName=?,workDate=?,workoffDate=?,isLate=?,isOff=?,offContent=? where attendId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, attendment.getAttendId());
		pstmt.setString(2, attendment.getUserName());
		pstmt.setString(3, attendment.getDepartmentName());
		pstmt.setString(4, attendment.getWorkDate());
		pstmt.setDate(5, attendment.getWorkoffDate());
		pstmt.setString(6, attendment.getIsLate());
		pstmt.setString(7, attendment.getIsOff());
		pstmt.setString(8, attendment.getOffContent());
		pstmt.setInt(9, attendment.getAttendId());
		return pstmt.executeUpdate();
	}
}
