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

import io.renren.modules.epi.entity.StudentClassesEntity;
import io.renren.modules.epi.service.StudentClassesService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 学生班级表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
@RestController
@RequestMapping("epi/studentclasses")
public class StudentClassesController {
    @Autowired
    private StudentClassesService studentClassesService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:studentclasses:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = studentClassesService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:studentclasses:info")
    public R info(@PathVariable("id") Long id){
		StudentClassesEntity studentClasses = studentClassesService.getById(id);

        return R.ok().put("studentClasses", studentClasses);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:studentclasses:save")
    public R save(@RequestBody StudentClassesEntity studentClasses){
		studentClassesService.save(studentClasses);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:studentclasses:update")
    public R update(@RequestBody StudentClassesEntity studentClasses){
		studentClassesService.updateById(studentClasses);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:studentclasses:delete")
    public R delete(@RequestBody Long[] ids){
		studentClassesService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
