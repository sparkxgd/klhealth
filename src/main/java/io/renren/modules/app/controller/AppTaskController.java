/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.app.controller;


import com.qiniu.util.StringUtils;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.epi.entity.TaskSandEntity;
import io.renren.modules.epi.service.TaskSandService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * APP任务-微信
 *2021年1月27日16:05:33
 */
@RestController
@RequestMapping("/app/weixin/task/")
@Api("APP登录接口")
public class AppTaskController {
    @Autowired
    private TaskSandService taskSandService;
    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = taskSandService.queryPages2(params);
        return R.ok().put("page", page);
    }
    /**
     * 获取用户今日任务列表
     */
    @RequestMapping("/my_day_task_list")
    public R myDayTaskList(@RequestParam Map<String, Object> params){
        Object k = params.get("userid");
        Long userid=null;
        if(!StringUtils.isNullOrEmpty(String.valueOf(k))){
            if (!k.equals("null")) {
                userid = Long.valueOf(String.valueOf(k));
            }
        }
        List<TaskSandEntity>  list= taskSandService.myDayTaskList(userid);
        int wei = 0;
        int yi = 0;
        for (int i=0;i<list.size();i++){
            if(list.get(i).getStatus()==0){
                wei++;
            }
            if (list.get(i).getStatus()==1){
                yi++;
            }
        }
        Map<String, Object> dayTaskInfo=new HashMap<>();
        dayTaskInfo.put("total",list.size());
        dayTaskInfo.put("wei",wei);
        dayTaskInfo.put("yi",yi);
        return R.ok().put("list", list).put("dayTaskInfo",dayTaskInfo);
    }

}
