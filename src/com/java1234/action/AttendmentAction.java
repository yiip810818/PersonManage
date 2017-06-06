package com.java1234.action;

import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.java1234.dao.AttendmentDao;
import com.java1234.model.Attendment;
import com.java1234.model.PageBean;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AttendmentAction extends ActionSupport {

	/**
	 * add by yii 2017年4月25日17:26:35
	 */
	private static final long serialVersionUID = 1L;
	private Attendment attendment;
	private String page;
	private String rows;
	private String id;
	private String delIds;
	private String departmentname = "";
	private String isLate = "";

	public String getIsLate() {
		return isLate;
	}

	public void setIsLate(String isLate) {
		this.isLate = isLate;
	}

	public String getDepartmentname() {
		return departmentname;
	}

	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}

	public Attendment getAttendment() {
		return attendment;
	}

	public void setAttendment(Attendment attendment) {
		this.attendment = attendment;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getDelIds() {
		return delIds;
	}

	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	DbUtil dbUtil = new DbUtil();
	AttendmentDao attendmentDao = new AttendmentDao();

	@Override
	public String execute() throws Exception {
		Connection con = null;
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		pageBean.setStart((Integer.parseInt(page) - 1) * Integer.parseInt(rows));
		try {
			if (attendment == null) {
				attendment = new Attendment();
			}
			attendment.setDepartmentName(departmentname);
			attendment.setIsLate(isLate);

			con = dbUtil.getCon();
			JSONObject result = new JSONObject();
			ResultSet rs = attendmentDao.attendmentList(con, pageBean, attendment);
			JSONArray jsonArray = JsonUtil.formatRsToJsonArray(rs);
			int total = attendmentDao.attendmentCount(con);
			result.put("rows", jsonArray);
			result.put("total", total);
			HttpServletResponse response = ServletActionContext.getResponse();
			ResponseUtil.write(response, result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public String delete() throws Exception {
		Connection con = null;
		try {
			con = dbUtil.getCon();
			JSONObject result = new JSONObject();
			int delNums = attendmentDao.attendmentDelete(con, delIds);
			if (delNums > 0) {
				result.put("success", "true");
				result.put("delNums", delNums);
			} else {
				result.put("success", "true");
				result.put("errorMsg", "删除失败");
			}
			result.put("delNum", delNums);
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public String save() throws Exception {
		if (StringUtil.isNotEmpty(id)) {
			attendment.setAttendId(Integer.parseInt(id));
		}

		Connection con = null;
		try {
			con = dbUtil.getCon();
			int saveNums = 0;
			JSONObject result = new JSONObject();
			if (StringUtil.isNotEmpty(id)) {
				saveNums = attendmentDao.positionModify(con, attendment);
			} else {
				saveNums = attendmentDao.positionAdd(con, attendment);
			}
			if (saveNums > 0) {
				result.put("success", "true");
			} else {
				result.put("success", "true");
				result.put("errorMeg", "删除失败");
			}
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
