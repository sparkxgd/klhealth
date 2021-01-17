package io.renren.modules.epi.dao;

import io.renren.modules.epi.entity.StudentClassesEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 学生班级表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
@Mapper
public interface StudentClassesDao extends BaseMapper<StudentClassesEntity> {
	
}
