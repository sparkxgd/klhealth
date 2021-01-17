package io.renren.modules.epi.dao;

import io.renren.modules.epi.entity.DeptEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 部门机构表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@Mapper
public interface DeptDao extends BaseMapper<DeptEntity> {
	
}
