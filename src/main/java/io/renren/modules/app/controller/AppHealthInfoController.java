package io.renren.modules.app.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.epi.entity.HealthInfoEntity;
import io.renren.modules.epi.service.HealthInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;


/**
 * APP-健康记录数据表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:35
 */
@RestController
@RequestMapping("/app/weixin/healthinfo")
public class AppHealthInfoController {
    @Autowired
    private HealthInfoService healthInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = healthInfoService.queryPage(params);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		HealthInfoEntity healthInfo = healthInfoService.getById(id);

        return R.ok().put("healthInfo", healthInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody HealthInfoEntity healthInfo){
        healthInfo.setCreateTime(new Date());
		healthInfoService.save(healthInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody HealthInfoEntity healthInfo){
		healthInfoService.updateById(healthInfo);

        return R.ok();
    }

}
