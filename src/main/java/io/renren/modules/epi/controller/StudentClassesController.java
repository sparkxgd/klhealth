package io.renren.modules.epi.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.modules.epi.entity.EpiUserEntity;
import io.renren.modules.epi.service.UserService;
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
    @Autowired
    private UserService epiUserService;
    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:studentclasses:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = studentClassesService.queryPages(params);

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
        //判断学号是存在
        EpiUserEntity u = epiUserService.getStudentByNo(studentClasses.getNo());
        if(u!=null){
            studentClasses.setAddTime(new Date());
            studentClasses.setUpdateTime(new Date());
            studentClassesService.save(studentClasses);
            return R.ok();
        }else{
            return R.error("这个学生的学号不存在");
        }



    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:studentclasses:update")
    public R update(@RequestBody StudentClassesEntity studentClasses){
        studentClasses.setUpdateTime(new Date());
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
