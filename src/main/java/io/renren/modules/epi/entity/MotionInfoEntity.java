package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 运动记录表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@Data
@TableName("epi_motion_info")
public class MotionInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 外键 user表id
	 */
	private Long userId;
	/**
	 * 运动步数
	 */
	private Integer steps;
	/**
	 * 运动开始时间
	 */
	private Date startTime;
	/**
	 * 运动结束时间
	 */
	private Date endTime;
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
