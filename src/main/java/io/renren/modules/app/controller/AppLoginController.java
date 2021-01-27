/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.app.controller;


import com.alibaba.fastjson.JSONObject;
import io.renren.common.utils.R;
import io.renren.common.validator.ValidatorUtils;
import io.renren.modules.app.annotation.Login;
import io.renren.modules.app.annotation.LoginUser;
import io.renren.modules.app.entity.UserEntity;
import io.renren.modules.app.form.LoginForm;
import io.renren.modules.app.form.WeixinUserForm;
import io.renren.modules.app.service.UserService;
import io.renren.modules.app.utils.JwtUtils;
import io.renren.modules.app.utils.WechatUtils;
import io.renren.modules.epi.entity.UserBandingEntity;
import io.renren.modules.epi.service.UserBandingService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * APP登录授权-微信
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("/app/weixin")
@Api("APP登录接口")
public class AppLoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    private UserBandingService userBandingService;
    /**
     * 登录
     */
    @PostMapping("login")
    @ApiOperation("登录")
    public R login(@RequestBody LoginForm form){
        //表单校验
        ValidatorUtils.validateEntity(form);

        //用户登录
        long userId = userService.login(form);

        //生成token
        String token = jwtUtils.generateToken(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("expire", jwtUtils.getExpire());

        return R.ok(map);
    }

    @PostMapping("userBingding")
    @ApiOperation("微信用户绑定")
    public R userBingding(@RequestBody WeixinUserForm user){
        //到微信服务器换取微信id
        JSONObject js =WechatUtils.getSessionKeyOropenid(user.getCode());
        String weixinId = js.getString("openid");
        //判断这个微信id是否在疫情系统的用户表中
        UserBandingEntity userb = userBandingService.createAccountAndBingding(weixinId);
        //将判断结果返回到客户端
        return R.ok().put("data", userb);
    }

    @PostMapping("userBingdingUpdata")
    @ApiOperation("更新微信用户绑定")
    public R userBingdingUpdata(@RequestBody WeixinUserForm user){
        UserBandingEntity userb = userBandingService.updateBingding(user);
        //将判断结果返回到客户端
        return R.ok().put("data", userb);
    }

}
