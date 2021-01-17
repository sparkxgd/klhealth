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

import io.renren.modules.epi.entity.HealthInfoEntity;
import io.renren.modules.epi.service.HealthInfoService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 健康记录数据表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:35
 */
@RestController
@RequestMapping("epi/healthinfo")
public class HealthInfoController {
    @Autowired
    private HealthInfoService healthInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:healthinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = healthInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:healthinfo:info")
    public R info(@PathVariable("id") Long id){
		HealthInfoEntity healthInfo = healthInfoService.getById(id);

        return R.ok().put("healthInfo", healthInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:healthinfo:save")
    public R save(@RequestBody HealthInfoEntity healthInfo){
		healthInfoService.save(healthInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:healthinfo:update")
    public R update(@RequestBody HealthInfoEntity healthInfo){
		healthInfoService.updateById(healthInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:healthinfo:delete")
    public R delete(@RequestBody Long[] ids){
		healthInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
