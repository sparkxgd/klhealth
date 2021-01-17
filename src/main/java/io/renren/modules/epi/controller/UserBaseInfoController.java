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

import io.renren.modules.epi.entity.UserBaseInfoEntity;
import io.renren.modules.epi.service.UserBaseInfoService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 用户基本信息表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@RestController
@RequestMapping("epi/userbaseinfo")
public class UserBaseInfoController {
    @Autowired
    private UserBaseInfoService userBaseInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:userbaseinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userBaseInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:userbaseinfo:info")
    public R info(@PathVariable("id") Long id){
		UserBaseInfoEntity userBaseInfo = userBaseInfoService.getById(id);

        return R.ok().put("userBaseInfo", userBaseInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:userbaseinfo:save")
    public R save(@RequestBody UserBaseInfoEntity userBaseInfo){
		userBaseInfoService.save(userBaseInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:userbaseinfo:update")
    public R update(@RequestBody UserBaseInfoEntity userBaseInfo){
		userBaseInfoService.updateById(userBaseInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:userbaseinfo:delete")
    public R delete(@RequestBody Long[] ids){
		userBaseInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
