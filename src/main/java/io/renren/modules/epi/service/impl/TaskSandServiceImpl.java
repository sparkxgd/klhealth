package io.renren.modules.epi.service.impl;

import com.qiniu.util.StringUtils;
import io.renren.modules.epi.entity.StudentClassesEntity;
import io.renren.modules.epi.entity.TaskEntity;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.TaskSandDao;
import io.renren.modules.epi.entity.TaskSandEntity;
import io.renren.modules.epi.service.TaskSandService;


@Service("taskSandService")
public class TaskSandServiceImpl extends ServiceImpl<TaskSandDao, TaskSandEntity> implements TaskSandService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<TaskSandEntity> page = this.page(
                new Query<TaskSandEntity>().getPage(params),
                new QueryWrapper<TaskSandEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPages(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<TaskSandEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.like("b.'id'",params.get("key").toString());
        }
        //设置分页参数
        IPage<TaskSandEntity> page = new Query<TaskSandEntity>().getPage(params);
        //分页查询
        IPage<TaskSandEntity> pages= this.baseMapper.getPages(page,queryWrapper);

        return new PageUtils(pages);
    }
    @Override
    public PageUtils queryPages2(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<TaskSandEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.eq("b.user_id",params.get("key").toString());
        }
        //设置分页参数
        IPage<TaskSandEntity> page = new Query<TaskSandEntity>().getPage(params);
        //分页查询
        IPage<TaskSandEntity> pages= this.baseMapper.getPages2(page,queryWrapper);

        return new PageUtils(pages);
    }
}
