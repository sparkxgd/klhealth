package io.renren.modules.epi.dao;

import io.renren.modules.epi.entity.TaskEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 任务表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:34
 */
@Mapper
public interface TaskDao extends BaseMapper<TaskEntity> {
	
}
