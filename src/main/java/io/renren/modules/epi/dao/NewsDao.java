package io.renren.modules.epi.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.epi.entity.NewsEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 新闻表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@Mapper
public interface NewsDao extends BaseMapper<NewsEntity> {
    @Select("SELECT a.*,b.`name` as createrName,c.`name` as reviewerName from epi_news a LEFT JOIN epi_user b on a.creater=b.id LEFT JOIN epi_user c on a.reviewer=c.id ${ew.customSqlSegment} ")
    IPage<NewsEntity> getPages(IPage<NewsEntity> page, @Param(Constants.WRAPPER) QueryWrapper wrapper);
}
