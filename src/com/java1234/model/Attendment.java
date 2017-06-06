package com.java1234.model;

import java.sql.Date;

/**
 * @author yii 招聘管理实体类 add by yii 2017年4月24日16:15:28
 */
public class Attendment {

	private int attendId;
	private String userName;
	private String departmentName;
	private String workDate;
	private Date workoffDate;
	private String isLate;
	private String isOff;
	private String offContent;

	public int getAttendId() {
		return attendId;
	}

	public void setAttendId(int attendId) {
		this.attendId = attendId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getWorkDate() {
		return workDate;
	}

	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}

	public Date getWorkoffDate() {
		return workoffDate;
	}

	public void setWorkoffDate(Date workoffDate) {
		this.workoffDate = workoffDate;
	}

	public String getIsLate() {
		return isLate;
	}

	public void setIsLate(String isLate) {
		this.isLate = isLate;
	}

	public String getIsOff() {
		return isOff;
	}

	public void setIsOff(String isOff) {
		this.isOff = isOff;
	}

	public String getOffContent() {
		return offContent;
	}

	public void setOffContent(String offContent) {
		this.offContent = offContent;
	}

}
