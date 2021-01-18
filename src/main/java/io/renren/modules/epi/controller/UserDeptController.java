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

import io.renren.modules.epi.entity.UserDeptEntity;
import io.renren.modules.epi.service.UserDeptService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 用户部门表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@RestController
@RequestMapping("epi/userdept")
public class UserDeptController {
    @Autowired
    private UserDeptService userDeptService;

    /**
     * 列表是是是
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:userdept:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userDeptService.queryPages(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:userdept:info")
    public R info(@PathVariable("id") Long id){
		UserDeptEntity userDept = userDeptService.getSById(id);
        return R.ok().put("userDept", userDept);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:userdept:save")
    public R save(@RequestBody UserDeptEntity userDept){
		userDeptService.save(userDept);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:userdept:update")
    public R update(@RequestBody UserDeptEntity userDept){
		userDeptService.updateById(userDept);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:userdept:delete")
    public R delete(@RequestBody Long[] ids){
		userDeptService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
