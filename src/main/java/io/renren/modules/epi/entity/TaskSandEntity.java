package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 任务发送表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@Data
@TableName("epi_task_sand")
public class TaskSandEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 外键epi_task表id
	 */
	private Long taskId;
	/**
	 * 外键 user表id
	 */
	private Long userId;
	/**
	 * 状态 0：待完成 1：已完成
	 */
	private Integer status;
	/**
	 * 接收时间
	 */
	private Date receiveTime;
	/**
	 * 备注
	 */
	private String remark;
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
	 * 标题
	 */
	@TableField(exist = false)
	private String title;
	/**
	 * 开始时间
	 */
	@TableField(exist = false)
	private Date startTime;
	/**
	 * 结束时间
	 */
	@TableField(exist = false)
	private Date endTime;
	/**
	 * 类型 0：一般 1：紧急
	 */
	@TableField(exist = false)
	private Integer sandType;


}
