package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java1234.model.PageBean;
import com.java1234.model.Recruitment;
import com.java1234.util.StringUtil;

public class RecruitmentDao {

	public ResultSet positionList(Connection con,PageBean pageBean,Recruitment recruitment) throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_recruitment");
		if(recruitment!=null&&!StringUtil.isEmpty(recruitment.getPositionName())){
			sb.append(" and positionname like '%"+recruitment.getPositionName()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();		
	}
	
	public int positionCount(Connection con)throws Exception{
		String sql="select count(*) as total from t_recruitment";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	public int positionAdd(Connection con,Recruitment recruitment) throws Exception{
		String sql="insert into t_recruitment (tableid,positionName,workYears,positionRemark) values(?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, recruitment.getTableid());
		pstmt.setString(2, recruitment.getPositionName());
		pstmt.setDouble(3, recruitment.getWorkYears());
		pstmt.setString(4, recruitment.getPositionRemark());
		return pstmt.executeUpdate();		
	}
	
	public int positionDelete(Connection con,String delIds)throws Exception{
		String sql="delete from t_recruitment where tableid in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public int positionModify(Connection con,Recruitment recruitment)throws Exception{
		String sql="update t_recruitment set positionName=?,workYears=?,positionRemark=? where tableid=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, recruitment.getPositionName());
		pstmt.setDouble(2, recruitment.getWorkYears());
		pstmt.setString(3, recruitment.getPositionRemark());
		pstmt.setInt(4, recruitment.getTableid());
		return pstmt.executeUpdate();
	}
}
