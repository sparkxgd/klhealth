package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.UserBandingDao;
import io.renren.modules.epi.entity.UserBandingEntity;
import io.renren.modules.epi.service.UserBandingService;


@Service("userBandingService")
public class UserBandingServiceImpl extends ServiceImpl<UserBandingDao, UserBandingEntity> implements UserBandingService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserBandingEntity> page = this.page(
                new Query<UserBandingEntity>().getPage(params),
                new QueryWrapper<UserBandingEntity>()
        );

        return new PageUtils(page);
    }

}