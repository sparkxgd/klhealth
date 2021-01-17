package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户账号绑定表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@Data
@TableName("epi_user_banding")
public class UserBandingEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 第三方登录ID 微信ID qqID
	 */
	private String accountId;
	/**
	 * 用户ID
	 */
	private Long userId;
	/**
	 * 第三方的昵称
	 */
	private String nickname;
	/**
	 * 头像
	 */
	private String headImg;
	/**
	 * 类型 0：微信 1:QQ 2：其他
	 */
	private Integer type;
	/**
	 * 绑定时间
	 */
	private Date updateTime;
	/**
	 * 备注
	 */
	private String remark;

}
