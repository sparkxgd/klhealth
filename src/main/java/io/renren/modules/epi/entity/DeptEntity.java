package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 部门机构表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@Data
@TableName("epi_dept")
public class DeptEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * ID
	 */
	@TableId
	private Long id;
	/**
	 * 父id
	 */
	private Long parentId;
	/**
	 * 父菜单名称
	 */
	@TableField(exist=false)
	private String parentName;
	/**
	 * 名称	学校，机构，分院，专业
	 */
	@TableField("`name`")
	private String name;
	/**
	 * 编号
	 */
	private String no;
	/**
	 * 描述
	 */
	@TableField("`desc`")
	private String desc;
	/**
	 * 状态	0：正常，-1：异常
	 */
	@TableField("`status`")
	private Integer status;
	/**
	 * ztree属性
	 */
	@TableField(exist=false)
	private Boolean open;

	@TableField(exist=false)
	private List<?> list;

}
