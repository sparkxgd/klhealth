package io.renren.modules.epi.service.impl;

import com.qiniu.util.StringUtils;
import io.renren.modules.epi.entity.MotionInfoEntity;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.NewsDao;
import io.renren.modules.epi.entity.NewsEntity;
import io.renren.modules.epi.service.NewsService;


@Service("newsService")
public class NewsServiceImpl extends ServiceImpl<NewsDao, NewsEntity> implements NewsService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<NewsEntity> page = this.page(
                new Query<NewsEntity>().getPage(params),
                new QueryWrapper<NewsEntity>()
        );

        return new PageUtils(page);
    }
    @Override
    public PageUtils queryPages(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<NewsEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.like("b.`name`",params.get("key").toString());
        }
        //设置分页参数
        IPage<NewsEntity> page = new Query<NewsEntity>().getPage(params);
        //分页查询
        IPage<NewsEntity> pages= this.baseMapper.getPages(page,queryWrapper);

        return new PageUtils(pages);
    }
}
