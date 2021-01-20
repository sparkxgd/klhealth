package io.renren.modules.epi.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.modules.epi.entity.EpiUserEntity;
import io.renren.modules.epi.service.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.epi.entity.TaskEntity;
import io.renren.modules.epi.service.TaskService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 任务表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:34
 */
@RestController
@RequestMapping("epi/task")
public class TaskController {
    @Autowired
    private TaskService taskService;
    @Autowired
    private UserService epiUserService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:task:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = taskService.queryPages(params);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:task:info")
    public R info(@PathVariable("id") Long id){
		TaskEntity task = taskService.getById(id);

        return R.ok().put("task", task);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:task:save")
    public R save(@RequestBody TaskEntity task){
        //判断学号是存在
        EpiUserEntity u = epiUserService.getStudentByNo(task.getUserId());
        if(u!=null){
            task.setStatus(0);
            taskService.save(task);
            return R.ok();
        }else{
            return R.error("这个学生的学号不存在");
        }

    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:task:update")
    public R update(@RequestBody TaskEntity task){
		taskService.updateById(task);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:task:delete")
    public R delete(@RequestBody Long[] ids){
		taskService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
