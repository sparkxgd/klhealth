package io.renren.modules.epi.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.epi.entity.UserBandingEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.epi.entity.UserDeptEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 用户账号绑定表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@Mapper
public interface UserBandingDao extends BaseMapper<UserBandingEntity> {
    @Select("SELECT a.*,b.`name`,b.username from epi_user_banding a left join epi_user b on a.user_id = b.id ${ew.customSqlSegment} ")
    IPage<UserBandingEntity> getPages(IPage<UserBandingEntity> page, @Param(Constants.WRAPPER) QueryWrapper wrapper);
}
