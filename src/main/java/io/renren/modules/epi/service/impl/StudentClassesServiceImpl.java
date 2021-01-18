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
    @Override
    public PageUtils queryPages(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<StudentClassesEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.like("a.`no`",params.get("key").toString());
        }
        //设置分页参数
        IPage<StudentClassesEntity> page = new Query<StudentClassesEntity>().getPage(params);
        //分页查询
        IPage<StudentClassesEntity> pages= this.baseMapper.getPages(page,queryWrapper);

        return new PageUtils(pages);
    }
}
