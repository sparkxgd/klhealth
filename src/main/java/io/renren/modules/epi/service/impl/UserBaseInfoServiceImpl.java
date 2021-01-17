package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.UserBaseInfoDao;
import io.renren.modules.epi.entity.UserBaseInfoEntity;
import io.renren.modules.epi.service.UserBaseInfoService;


@Service("userBaseInfoService")
public class UserBaseInfoServiceImpl extends ServiceImpl<UserBaseInfoDao, UserBaseInfoEntity> implements UserBaseInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserBaseInfoEntity> page = this.page(
                new Query<UserBaseInfoEntity>().getPage(params),
                new QueryWrapper<UserBaseInfoEntity>()
        );

        return new PageUtils(page);
    }

}