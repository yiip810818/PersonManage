package com.java1234.model;

import java.sql.Date;

/**
 * @author yii 招聘管理实体类 add by yii 2017年4月24日16:15:28
 */
public class Trainment {

	private int trainID;
	private String deparentName;
	private Date trainDate;
	private int trainTime;
	private String trainContent;

	public int getTrainID() {
		return trainID;
	}

	public void setTrainID(int trainID) {
		this.trainID = trainID;
	}

	public String getDeparentName() {
		return deparentName;
	}

	public void setDeparentName(String deparentName) {
		this.deparentName = deparentName;
	}

	public Date getTrainDate() {
		return trainDate;
	}

	public void setTrainDate(Date trainDate) {
		this.trainDate = trainDate;
	}

	public int getTrainTime() {
		return trainTime;
	}

	public void setTrainTime(int trainTime) {
		this.trainTime = trainTime;
	}

	public String getTrainContent() {
		return trainContent;
	}

	public void setTrainContent(String trainContent) {
		this.trainContent = trainContent;
	}

}
