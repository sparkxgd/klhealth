package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户基本信息表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@Data
@TableName("epi_user_base_info")
public class UserBaseInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 学工号，教师工号 其他
	 */
	private String no;
	/**
	 * 用户ID
	 */
	private Long userId;
	/**
	 * 真实姓名
	 */
	private String name;
	/**
	 * 身份证号
	 */
	private String idCard;
	/**
	 * 类型，0：学生，1：教师，2：其他
	 */
	private Integer type;
	/**
	 * 性别 0：女 男：1
	 */
	private Integer sex;
	/**
	 * 备注
	 */
	private String remark;

}
