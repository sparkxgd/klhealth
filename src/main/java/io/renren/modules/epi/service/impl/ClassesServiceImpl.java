package io.renren.modules.epi.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qiniu.util.StringUtils;
import io.renren.common.utils.Query;
import io.renren.modules.epi.entity.DeptEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;


import io.renren.modules.epi.dao.ClassesDao;
import io.renren.modules.epi.entity.ClassesEntity;
import io.renren.modules.epi.service.ClassesService;


@Service("classesService")
public class ClassesServiceImpl extends ServiceImpl<ClassesDao, ClassesEntity> implements ClassesService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<ClassesEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.like("a.`name`",params.get("key").toString());
        }
        //设置分页参数
        IPage<ClassesEntity> page = new Query<ClassesEntity>().getPage(params);
        //分页查询
        IPage<ClassesEntity> pages= this.baseMapper.getPages(page,queryWrapper);

        return new PageUtils(pages);
    }

}
