package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 任务表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:34
 */
@Data
@TableName("epi_task")
public class TaskEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 任务类型，预留，0：作业
	 */
	private Integer taskType;
	/**
	 * 任务标题
	 */
	private String title;
	/**
	 * 任务描述
	 */
	@TableField("`desc`")
	private String desc;
	/**
	 * 创建任务人，外键user表id
	 */
	private Long userId;
	/**
	 * 开始时间
	 */
	private Date startTime;
	/**
	 * 结束时间
	 */
	private Date endTime;
	/**
	 * 类型 0：一般 1：紧急
	 */
	private Integer sandType;
	/**
	 * 状态 0：未执行 1：执行中 2：完成 3：未完成 -1：异常
	 */
	private Integer status;
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
}
