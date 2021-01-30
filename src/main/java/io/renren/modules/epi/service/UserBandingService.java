package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.form.WeixinUserForm;
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
    /**
     * 表关联查询
     * @param params
     * @return
     */
    PageUtils queryPages(Map<String, Object> params);

    /**
     * 创建疫情用户及绑定
     * @param weixinId
     * @return
     */
    UserBandingEntity createAccountAndBingding(String weixinId);
    /**
     * 更新疫情用户及绑定
     * @param userinfo
     * @return
     */
    UserBandingEntity updateBingding(WeixinUserForm userinfo);
    /**
     * 根据微信号查询
     * @param weixinId
     * @return
     */
    UserBandingEntity getByweixinId(String weixinId);

}

