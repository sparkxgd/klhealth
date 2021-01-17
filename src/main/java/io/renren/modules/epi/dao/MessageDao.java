package io.renren.modules.epi.dao;

import io.renren.modules.epi.entity.MessageEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 消息表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:34
 */
@Mapper
public interface MessageDao extends BaseMapper<MessageEntity> {
	
}
