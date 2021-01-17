package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 消息表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:34
 */
@Data
@TableName("epi_message")
public class MessageEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 发消息人ID
	 */
	private Long userId;
	/**
	 * 发送时间
	 */
	private Date sandTime;
	/**
	 * 消息类型 0：一般 1：紧急
	 */
	private Integer sandType;
	/**
	 * 信息状态 0：待发送 1：已发送 -1：异常
	 */
	private Integer status;
	/**
	 * 备注
	 */
	private String remark;

}
