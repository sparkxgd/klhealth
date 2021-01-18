package io.renren.modules.epi.service.impl;

import com.qiniu.util.StringUtils;
import io.renren.modules.epi.entity.ClassesEntity;
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
    @Override
    public PageUtils queryPages(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<MotionInfoEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.like("b.`name`",params.get("key").toString());
        }
        //设置分页参数
        IPage<MotionInfoEntity> page = new Query<MotionInfoEntity>().getPage(params);
        //分页查询
        IPage<MotionInfoEntity> pages= this.baseMapper.getPages(page,queryWrapper);

        return new PageUtils(pages);
    }
}
