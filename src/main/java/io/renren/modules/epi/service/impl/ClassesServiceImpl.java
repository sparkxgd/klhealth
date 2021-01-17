package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.ClassesDao;
import io.renren.modules.epi.entity.ClassesEntity;
import io.renren.modules.epi.service.ClassesService;


@Service("classesService")
public class ClassesServiceImpl extends ServiceImpl<ClassesDao, ClassesEntity> implements ClassesService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ClassesEntity> page = this.page(
                new Query<ClassesEntity>().getPage(params),
                new QueryWrapper<ClassesEntity>()
        );

        return new PageUtils(page);
    }

}