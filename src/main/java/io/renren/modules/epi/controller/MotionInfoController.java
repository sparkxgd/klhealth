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

import io.renren.modules.epi.entity.MotionInfoEntity;
import io.renren.modules.epi.service.MotionInfoService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 运动记录表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:57
 */
@RestController
@RequestMapping("epi/motioninfo")
public class MotionInfoController {
    @Autowired
    private MotionInfoService motionInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:motioninfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = motionInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:motioninfo:info")
    public R info(@PathVariable("id") Long id){
		MotionInfoEntity motionInfo = motionInfoService.getById(id);

        return R.ok().put("motionInfo", motionInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:motioninfo:save")
    public R save(@RequestBody MotionInfoEntity motionInfo){
		motionInfoService.save(motionInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:motioninfo:update")
    public R update(@RequestBody MotionInfoEntity motionInfo){
		motionInfoService.updateById(motionInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:motioninfo:delete")
    public R delete(@RequestBody Long[] ids){
		motionInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
