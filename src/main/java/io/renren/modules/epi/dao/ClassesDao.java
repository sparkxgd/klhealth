package io.renren.modules.epi.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.epi.entity.ClassesEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.sql.Wrapper;
import java.util.List;
import java.util.Map;

/**
 * 班级表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
@Mapper
public interface ClassesDao extends BaseMapper<ClassesEntity> {
        @Select("select a.*,b.`name` as majorName from epi_classes a left JOIN epi_dept b on a.major=b.id ${ew.customSqlSegment} ")
        IPage<ClassesEntity> getPages(IPage<ClassesEntity> page,@Param(Constants.WRAPPER) QueryWrapper wrapper);
}
