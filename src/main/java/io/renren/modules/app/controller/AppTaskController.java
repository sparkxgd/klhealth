/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.app.controller;


import com.alibaba.fastjson.JSONObject;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.app.form.LoginForm;
import io.renren.modules.app.form.WeixinUserForm;
import io.renren.modules.app.utils.JwtUtils;
import io.renren.modules.app.utils.WechatUtils;
import io.renren.modules.epi.entity.UserBandingEntity;
import io.renren.modules.epi.service.TaskSandService;
import io.renren.modules.epi.service.TaskService;
import io.renren.modules.epi.service.UserBandingService;
import io.renren.modules.epi.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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

}
