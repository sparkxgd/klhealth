package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.epi.entity.EpiUserEntity;
import io.renren.modules.epi.entity.TaskEntity;

import java.util.Map;

/**
 * 任务表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:34
 */
public interface TaskService extends IService<TaskEntity> {

    PageUtils queryPage(Map<String, Object> params);
    /**
     * 表关联查询
     * @param params
     * @return
     */
    PageUtils queryPages(Map<String, Object> params);

    /**
     * 根据任务id获取任务信息
     * @param id
     * @return
     */
    TaskEntity getTaskById(long id);

    /**
     * 开始执行任务
     * @param id
     * @return
     */
     R startTask(Long id);

}

