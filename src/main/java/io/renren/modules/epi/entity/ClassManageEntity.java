package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 班级管理表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
@Data
@TableName("epi_class_manage")
public class ClassManageEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 被管理班级	外键，班级表id
	 */
	private Integer claId;
	/**
	 * 管理人（班主任，辅导员）	外键，user表id
	 */
	private Integer userId;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 状态	0：正常，-1：异常
	 */
	private Integer status;

}
