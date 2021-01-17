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

import io.renren.modules.epi.entity.ClassManageEntity;
import io.renren.modules.epi.service.ClassManageService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 班级管理表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
@RestController
@RequestMapping("epi/classmanage")
public class ClassManageController {
    @Autowired
    private ClassManageService classManageService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:classmanage:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = classManageService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:classmanage:info")
    public R info(@PathVariable("id") Long id){
		ClassManageEntity classManage = classManageService.getById(id);

        return R.ok().put("classManage", classManage);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:classmanage:save")
    public R save(@RequestBody ClassManageEntity classManage){
		classManageService.save(classManage);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:classmanage:update")
    public R update(@RequestBody ClassManageEntity classManage){
		classManageService.updateById(classManage);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:classmanage:delete")
    public R delete(@RequestBody Long[] ids){
		classManageService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
