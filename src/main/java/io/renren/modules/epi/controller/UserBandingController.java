package io.renren.modules.epi.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.epi.entity.UserBandingEntity;
import io.renren.modules.epi.service.UserBandingService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 用户账号绑定表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@RestController
@RequestMapping("epi/userbanding")
public class UserBandingController {
    @Autowired
    private UserBandingService userBandingService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:userbanding:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userBandingService.queryPages(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:userbanding:info")
    public R info(@PathVariable("id") Long id){
		UserBandingEntity userBanding = userBandingService.getById(id);

        return R.ok().put("userBanding", userBanding);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:userbanding:save")
    public R save(@RequestBody UserBandingEntity userBanding){
		userBandingService.save(userBanding);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:userbanding:update")
    public R update(@RequestBody UserBandingEntity userBanding){
		userBandingService.updateById(userBanding);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:userbanding:delete")
    public R delete(@RequestBody Long[] ids){
		userBandingService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
