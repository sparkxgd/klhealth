package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 健康记录数据表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:35
 */
@Data
@TableName("epi_health_info")
public class HealthInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 用户ID
	 */
	private Long userId;
	/**
	 * 健康码
	 */
	private String healthImg;
	/**
	 * 经纬度
	 */
	private String position;
	/**
	 * 体温
	 */
	private BigDecimal temperature;
	/**
	 * 是否正常 0：正常 1：不正常
	 */
	private Integer isnormal;
	/**
	 * 是否与风险人员接触 0：否 1：是
	 */
	private Integer isCatDangerous;
	/**
	 * 活动区域
	 */
	private String zoneAction;
	/**
	 * 备注
	 */
	private String remark;

}
