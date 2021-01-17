package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 班级表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
@Data
@TableName("epi_classes")
public class ClassesEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * ID
	 */
	@TableId
	private Long id;
	/**
	 * 专业	外键，部门机构表id
	 */
	private Long major;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 编号
	 */
	private String no;
	/**
	 * 年级,例如2018
	 */
	private String grade;
	/**
	 * 毕业时间
	 */
	private Date graduateTime;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;
	/**
	 * 描述
	 */
	private String desc;
	/**
	 * 状态	0：正常，-1：异常
	 */
	private Integer status;

}
