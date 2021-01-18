package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.MotionInfoEntity;

import java.util.Map;

/**
 * 运动记录表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
public interface MotionInfoService extends IService<MotionInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    /**
     * 表关联查询
     * @param params
     * @return
     */
    PageUtils queryPages(Map<String, Object> params);
}

