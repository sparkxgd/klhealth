package io.renren.modules.epi.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.epi.entity.TaskEntity;
import io.renren.modules.epi.entity.TaskSandEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 任务发送表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@Mapper
public interface TaskSandDao extends BaseMapper<TaskSandEntity> {

    @Select("SELECT b.*,c.title,a.`name`,a.username from epi_task_sand b LEFT JOIN epi_user a on a.`no`=b.user_id LEFT JOIN epi_task c on b.task_id=c.id ${ew.customSqlSegment} ")
    IPage<TaskSandEntity> getPages(IPage<TaskSandEntity> page, @Param(Constants.WRAPPER) QueryWrapper wrapper);
	
}
