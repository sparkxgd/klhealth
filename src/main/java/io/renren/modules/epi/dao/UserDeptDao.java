package io.renren.modules.epi.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import io.renren.modules.epi.entity.UserDeptEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 用户部门表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@Mapper
public interface UserDeptDao extends BaseMapper<UserDeptEntity> {
    @Select("SELECT b.*,a.id as uId,a.`name`,a.username,c.`name` as deptName from epi_user_dept b LEFT JOIN epi_user a on a.id=b.user_id LEFT JOIN epi_dept c on b.dept_id=c.id ${ew.customSqlSegment} ")
    IPage<UserDeptEntity> getPages(IPage<UserDeptEntity> page, @Param(Constants.WRAPPER) QueryWrapper wrapper);
    @Select("SELECT b.*,a.id as uId,a.`name`,a.username,c.`name` as deptName from epi_user_dept b LEFT JOIN epi_user a on a.id=b.user_id LEFT JOIN epi_dept c on b.dept_id=c.id where b.id = #{id} ")
    UserDeptEntity getSById(@Param("id") Long id);
}
