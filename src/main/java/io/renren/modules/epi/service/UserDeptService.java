package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.UserDeptEntity;

import java.util.Map;

/**
 * 用户部门表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
public interface UserDeptService extends IService<UserDeptEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

