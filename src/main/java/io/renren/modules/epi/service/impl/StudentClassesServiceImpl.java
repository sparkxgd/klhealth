package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.StudentClassesDao;
import io.renren.modules.epi.entity.StudentClassesEntity;
import io.renren.modules.epi.service.StudentClassesService;


@Service("studentClassesService")
public class StudentClassesServiceImpl extends ServiceImpl<StudentClassesDao, StudentClassesEntity> implements StudentClassesService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StudentClassesEntity> page = this.page(
                new Query<StudentClassesEntity>().getPage(params),
                new QueryWrapper<StudentClassesEntity>()
        );

        return new PageUtils(page);
    }

}