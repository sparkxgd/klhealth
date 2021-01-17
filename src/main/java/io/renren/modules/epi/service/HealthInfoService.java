package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.HealthInfoEntity;

import java.util.Map;

/**
 * 健康记录数据表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:35
 */
public interface HealthInfoService extends IService<HealthInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

