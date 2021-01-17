package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.UserBandingEntity;

import java.util.Map;

/**
 * 用户账号绑定表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
public interface UserBandingService extends IService<UserBandingEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

