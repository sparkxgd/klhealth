package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 疫情系统用户表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-18 13:48:17
 */
@Data
@TableName("epi_user")
public class EpiUserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 用户名
	 */
	private String username;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 手机号
	 */
	private String mobile;
	/**
	 * 学工号，教师工号 其他
	 */
	private String no;
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
	 * 状态	0：正常，-1：异常
	 */
	private Integer status;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;

}
