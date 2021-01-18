package io.renren.modules.epi.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.epi.entity.StudentClassesEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.epi.entity.UserDeptEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 学生班级表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
@Mapper
public interface StudentClassesDao extends BaseMapper<StudentClassesEntity> {
    @Select("SELECT a.*,b.`name`,b.username,c.`name` as clsName,c.id as clsidd FROM epi_student_classes a LEFT JOIN epi_user b on a.`no`=b.`no` LEFT JOIN epi_classes c on a.cls_id=c.id ${ew.customSqlSegment} ")
    IPage<StudentClassesEntity> getPages(IPage<StudentClassesEntity> page, @Param(Constants.WRAPPER) QueryWrapper wrapper);
}
