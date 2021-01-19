package io.renren.modules.epi.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.epi.entity.ClassesEntity;
import io.renren.modules.epi.service.ClassesService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 班级表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
@RestController
@RequestMapping("epi/classes")
public class ClassesController {
    @Autowired
    private ClassesService classesService;

    /**
     * 列表
     * 提交测试
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:classes:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = classesService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:classes:info")
    public R info(@PathVariable("id") Long id){
		ClassesEntity classes = classesService.getById(id);

        return R.ok().put("classes", classes);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:classes:save")
    public R save(@RequestBody ClassesEntity classes){
        classes.setCreateTime(new Date());
        classes.setUpdateTime(new Date());
		classesService.save(classes);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:classes:update")
    public R update(@RequestBody ClassesEntity classes){
        classes.setUpdateTime(new Date());
		classesService.updateById(classes);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:classes:delete")
    public R delete(@RequestBody Long[] ids){
		classesService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
