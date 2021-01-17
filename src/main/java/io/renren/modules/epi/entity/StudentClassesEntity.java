package io.renren.modules.epi.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 学生班级表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
@Data
@TableName("epi_student_classes")
public class StudentClassesEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * ID
	 */
	@TableId
	private Long id;
	/**
	 * 学号
	 */
	private Integer no;
	/**
	 * 班级,外键，班级表id
	 */
	private Integer clsId;
	/**
	 * 加入时间
	 */
	private Date addTime;
	/**
	 * 退出时间
	 */
	private Date exitTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;
	/**
	 * 状态 0：正常，-1：异常,1:退出，2：休学
	 */
	private Integer status;

}
