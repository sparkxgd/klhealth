package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 新闻表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@Data
@TableName("epi_news")
public class NewsEntity implements Serializable {
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
	 * 副标题
	 */
	private String subhead;
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 新闻类型，外键。类型表
	 */
	private Integer newsType;
	/**
	 * 类型 1：原创 2：转载 3：其他
	 */
	private Integer type;
	/**
	 * 作者名字，原创就是创建者
	 */
	private String author;
	/**
	 * 审核人,外键 user表id
	 */
	private Long reviewer;
	/**
	 * 审核时间
	 */
	private Date rviewTime;
	/**
	 * 发布时间
	 */
	private Date releaseTime;
	/**
	 * 文章状态 0：创建 1审核 2：发布 -1：异常
	 */
	private Integer status;
	/**
	 * 创建者 外键 user表id
	 */
	private Long creater;
	/**
	 * 创建时间
	 */
	private Date ceateTime;
	/**
	 * 浏览量
	 */
	private Long lookNum;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 真实姓名
	 */
	@TableField(exist = false)
	private String createrName;
	/**
	 * 真实姓名
	 */
	@TableField(exist = false)
	private String reviewerName;

}
