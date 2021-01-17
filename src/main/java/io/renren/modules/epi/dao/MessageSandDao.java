package io.renren.modules.epi.dao;

import io.renren.modules.epi.entity.MessageSandEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 消息发送表
 * 
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:56
 */
@Mapper
public interface MessageSandDao extends BaseMapper<MessageSandEntity> {
	
}
