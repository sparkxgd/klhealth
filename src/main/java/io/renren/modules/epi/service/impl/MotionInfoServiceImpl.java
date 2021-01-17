package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.MotionInfoDao;
import io.renren.modules.epi.entity.MotionInfoEntity;
import io.renren.modules.epi.service.MotionInfoService;


@Service("motionInfoService")
public class MotionInfoServiceImpl extends ServiceImpl<MotionInfoDao, MotionInfoEntity> implements MotionInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<MotionInfoEntity> page = this.page(
                new Query<MotionInfoEntity>().getPage(params),
                new QueryWrapper<MotionInfoEntity>()
        );

        return new PageUtils(page);
    }

}