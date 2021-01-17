package io.renren.modules.epi.dao;

import io.renren.modules.epi.entity.MotionInfoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 运动记录表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@Mapper
public interface MotionInfoDao extends BaseMapper<MotionInfoEntity> {
	
}
