package io.renren.modules.epi.dao;

import io.renren.modules.epi.entity.HealthInfoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 健康记录数据表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:35
 */
@Mapper
public interface HealthInfoDao extends BaseMapper<HealthInfoEntity> {
	
}
