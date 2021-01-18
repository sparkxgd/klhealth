package io.renren.modules.epi.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.epi.entity.MotionInfoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 运动记录表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@Mapper
public interface MotionInfoDao extends BaseMapper<MotionInfoEntity> {
    @Select("SELECT a.*,b.`name`,b.username from epi_motion_info a LEFT JOIN epi_user b on a.user_id=b.id ${ew.customSqlSegment} ")
    IPage<MotionInfoEntity> getPages(IPage<MotionInfoEntity> page, @Param(Constants.WRAPPER) QueryWrapper wrapper);
}
