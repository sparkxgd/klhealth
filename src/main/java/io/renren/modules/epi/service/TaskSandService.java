package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.TaskSandEntity;

import java.util.List;
import java.util.Map;

/**
 * 任务发送表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
public interface TaskSandService extends IService<TaskSandEntity> {

    PageUtils queryPage(Map<String, Object> params);
    /**
     * 表关联查询
     * @param params
     * @return
     */
    PageUtils queryPages(Map<String, Object> params);

    /**
     * 表关联查询
     * @param params
     * @return
     */
    PageUtils queryPages2(Map<String, Object> params);
    /**
     * 获取用户今日任务列表
     * @param userid
     * @return
     */
    List<TaskSandEntity> myDayTaskList(Long userid);

}

