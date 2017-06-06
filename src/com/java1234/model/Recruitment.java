package com.java1234.model;

/**
 * @author yii 
 * 招聘管理实体类 add by yii 2017年4月24日16:15:28
 */
public class Recruitment {

	private int tableid;
	private String positionName;
	private double workYears;
	private String positionRemark;

	public int getTableid() {
		return tableid;
	}

	public void setTableid(int tableid) {
		this.tableid = tableid;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public double getWorkYears() {
		return workYears;
	}

	public void setWorkYears(double workYears) {
		this.workYears = workYears;
	}

	public String getPositionRemark() {
		return positionRemark;
	}

	public void setPositionRemark(String positionRemark) {
		this.positionRemark = positionRemark;
	}

}
