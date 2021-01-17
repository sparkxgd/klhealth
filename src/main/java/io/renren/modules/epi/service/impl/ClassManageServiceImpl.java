package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.ClassManageDao;
import io.renren.modules.epi.entity.ClassManageEntity;
import io.renren.modules.epi.service.ClassManageService;


@Service("classManageService")
public class ClassManageServiceImpl extends ServiceImpl<ClassManageDao, ClassManageEntity> implements ClassManageService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ClassManageEntity> page = this.page(
                new Query<ClassManageEntity>().getPage(params),
                new QueryWrapper<ClassManageEntity>()
        );

        return new PageUtils(page);
    }

}