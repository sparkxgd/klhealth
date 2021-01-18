package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.EpiUserEntity;

import java.util.Map;

/**
 * 疫情系统用户表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-18 13:48:17
 */
public interface UserService extends IService<EpiUserEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 判断用户名是否存在
     * @param username
     * @return
     */
    boolean isExitUser(String username);
}

