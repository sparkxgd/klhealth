package io.renren.modules.epi.service.impl;

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

}