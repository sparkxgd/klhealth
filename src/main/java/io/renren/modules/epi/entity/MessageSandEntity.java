package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 消息发送表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:56
 */
@Data
@TableName("epi_message_sand")
public class MessageSandEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 外键 epi_message表id
	 */
	private Long msgId;
	/**
	 * 发送给谁 user表id
	 */
	private Long userId;
	/**
	 * 消息状态 0：待接收 1：已接收
	 */
	private Integer status;
	/**
	 * 接收时间
	 */
	private Date sandTime;
	/**
	 * 备注
	 */
	private String remark;

}
