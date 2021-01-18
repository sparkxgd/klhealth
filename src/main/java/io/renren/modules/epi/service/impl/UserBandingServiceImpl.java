package io.renren.modules.epi.service.impl;

import com.qiniu.util.StringUtils;
import io.renren.modules.epi.entity.UserDeptEntity;
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
    @Override
    public PageUtils queryPages(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<UserBandingEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.like("b.username",params.get("key").toString());
        }
        //设置分页参数
        IPage<UserBandingEntity> page = new Query<UserBandingEntity>().getPage(params);
        //分页查询
        IPage<UserBandingEntity> pages= this.baseMapper.getPages(page,queryWrapper);

        return new PageUtils(pages);
    }

}
