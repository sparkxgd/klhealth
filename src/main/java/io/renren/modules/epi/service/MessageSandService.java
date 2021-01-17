package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.MessageSandEntity;

import java.util.Map;

/**
 * 消息发送表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:56
 */
public interface MessageSandService extends IService<MessageSandEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

