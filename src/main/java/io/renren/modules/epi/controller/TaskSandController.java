package io.renren.modules.epi.controller;

import java.sql.Time;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.modules.epi.entity.EpiUserEntity;
import io.renren.modules.epi.entity.TaskEntity;
import io.renren.modules.epi.service.TaskService;
import io.renren.modules.epi.service.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.epi.entity.TaskSandEntity;
import io.renren.modules.epi.service.TaskSandService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 任务发送表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@RestController
@RequestMapping("epi/tasksand")
public class TaskSandController {
    @Autowired
    private TaskSandService taskSandService;
    @Autowired
    private UserService epiUserService;
    @Autowired
    private TaskService taskService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:tasksand:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = taskSandService.queryPages(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:tasksand:info")
    public R info(@PathVariable("id") Long id){
		TaskSandEntity taskSand = taskSandService.getById(id);

        return R.ok().put("taskSand", taskSand);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:tasksand:save")
    public R save(@RequestBody TaskSandEntity taskSand){
        //判断职工是否存在
        EpiUserEntity u = epiUserService.getInfoByid(taskSand.getUserId());
        TaskEntity tpid = taskService.getTaskById(taskSand.getTaskId());
        if(u != null){
            //根据任务id判断当前是否有此任务
            if (tpid != null) {
                taskSand.setStatus(0);
                taskSand.setReceiveTime(new Date());
                taskSandService.save(taskSand);
                return R.ok();
            }else {
                return R.error("当前无此任务");
            }

        }else{
            return R.error("查无此人");
        }
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:tasksand:update")
    public R update(@RequestBody TaskSandEntity taskSand){
        //判断职工是否存在
        EpiUserEntity u = epiUserService.getInfoByid(taskSand.getUserId());
        TaskEntity tpid = taskService.getTaskById(taskSand.getTaskId());
        if(u != null){
            //根据任务id判断当前是否有此任务
            if (tpid != null) {
                taskSandService.updateById(taskSand);
                return R.ok();
            }else {
                return R.error("当前无此任务");
            }

        }else{
            return R.error("查无此人");
        }
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:tasksand:delete")
    public R delete(@RequestBody Long[] ids){
		taskSandService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
