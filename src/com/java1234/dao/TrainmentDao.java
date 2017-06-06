package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java1234.model.PageBean;
import com.java1234.model.Recruitment;
import com.java1234.model.Trainment;
import com.java1234.util.StringUtil;

public class TrainmentDao {

	public ResultSet positionList(Connection con,PageBean pageBean,Trainment trainment) throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_trainment");
		if(trainment!=null&&!StringUtil.isEmpty(trainment.getDeparentName())){
			sb.append(" and deparentName like '%"+trainment.getDeparentName()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();		
	}
	
	public int positionCount(Connection con)throws Exception{
		String sql="select count(*) as total from t_trainment";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	public int positionAdd(Connection con,Trainment trainment) throws Exception{
		String sql="insert into t_trainment (trainID,deparentName,trainDate,trainTime,trainContent) values(?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, trainment.getTrainID());
		pstmt.setString(2, trainment.getDeparentName());
		pstmt.setDate(3, trainment.getTrainDate());
		pstmt.setInt(4, trainment.getTrainTime());
		pstmt.setString(5, trainment.getTrainContent());
		return pstmt.executeUpdate();		
	}
	
	public int positionDelete(Connection con,String delIds)throws Exception{
		String sql="delete from t_trainment where trainid in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public int positionModify(Connection con,Trainment trainment)throws Exception{
		String sql="update t_trainment set deparentName=?,trainDate=?,trainTime=?,trainContent=? where trainID=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, trainment.getDeparentName());
		pstmt.setDate(2, trainment.getTrainDate());
		pstmt.setInt(3, trainment.getTrainTime());
		pstmt.setString(4, trainment.getTrainContent());
		pstmt.setInt(5, trainment.getTrainID());
		return pstmt.executeUpdate();
	}
}
