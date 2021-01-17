package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.HealthInfoDao;
import io.renren.modules.epi.entity.HealthInfoEntity;
import io.renren.modules.epi.service.HealthInfoService;


@Service("healthInfoService")
public class HealthInfoServiceImpl extends ServiceImpl<HealthInfoDao, HealthInfoEntity> implements HealthInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<HealthInfoEntity> page = this.page(
                new Query<HealthInfoEntity>().getPage(params),
                new QueryWrapper<HealthInfoEntity>()
        );

        return new PageUtils(page);
    }

}