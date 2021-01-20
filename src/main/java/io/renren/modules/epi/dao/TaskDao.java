package io.renren.modules.epi.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.epi.entity.TaskEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.epi.entity.UserDeptEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 任务表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:34
 */
@Mapper
public interface TaskDao extends BaseMapper<TaskEntity> {

    @Select("SELECT b.*,a.`name`,a.username from epi_task b LEFT JOIN epi_user a on a.`no`=b.user_id ${ew.customSqlSegment} ")
    IPage<TaskEntity> getPages(IPage<TaskEntity> page, @Param(Constants.WRAPPER) QueryWrapper wrapper);

}
