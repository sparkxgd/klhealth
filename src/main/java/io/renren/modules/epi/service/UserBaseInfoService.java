package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.UserBaseInfoEntity;

import java.util.Map;

/**
 * 用户基本信息表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
public interface UserBaseInfoService extends IService<UserBaseInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

