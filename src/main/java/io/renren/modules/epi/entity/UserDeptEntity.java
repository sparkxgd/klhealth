package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户部门表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@Data
@TableName("epi_user_dept")
public class UserDeptEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * ID
	 */
	@TableId
	private Long id;
	/**
	 * 用户	外键，用户表id
	 */
	private Long userId;
	/**
	 * 部门id	外键，部门机构表id
	 */
	private Long deptId;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;
	/**
	 * 状态	0：正常，-1：异常
	 */
	@TableField("`status`")
	private Integer status;
	/**
	 * 用户名
	 */
	@TableField(exist = false)
	private String username;
	/**
	 * 真实姓名
	 */
	@TableField(exist = false)
	private String name;
	/**
	 * 用户用户表id
	 */
	@TableField(exist = false)
	private Integer uId;
	/**
	 * 部门名称
	 */
	@TableField(exist = false)
	private String deptName;

}
