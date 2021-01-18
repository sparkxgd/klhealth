package io.renren.modules.epi.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import io.renren.modules.epi.entity.UserDeptEntity;
import io.renren.modules.epi.service.UserDeptService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.epi.entity.EpiUserEntity;
import io.renren.modules.epi.service.UserService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 疫情系统用户表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-18 13:48:17
 */
@RestController
@RequestMapping("epi/user")
public class UserController {
    @Autowired
    private UserService epiUserService;
    @Autowired
    private UserDeptService userDeptService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:user:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = epiUserService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:user:info")
    public R info(@PathVariable("id") Long id){
		EpiUserEntity user = epiUserService.getById(id);

        return R.ok().put("user", user);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:user:save")
    public R save(@RequestBody EpiUserEntity user){
        //判断用户名如果存在，就不能添加了
        if(epiUserService.isExitUser(user.getUsername())){
            user.setCreateTime(new Date());
            user.setUpdateTime(new Date());
            epiUserService.save(user);
            //添加到用户部门表里
            UserDeptEntity userDept=new UserDeptEntity();
            userDept.setCreateTime(new Date());
            userDept.setUpdateTime(new Date());
            EpiUserEntity m =epiUserService.getOneBy(user.getUsername());
            userDept.setUserId(m.getId());
            userDeptService.save(userDept);
            return R.ok();
        }else{
            return R.error("用户名已经存在");
        }

    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:user:update")
    public R update(@RequestBody EpiUserEntity user){
        //更新部分内容，不要全部更新
        EpiUserEntity m = epiUserService.getById(user.getId());
        m.setIdCard(user.getIdCard());
        m.setMobile(user.getMobile());
        m.setName(user.getName());
        m.setRemark(user.getRemark());
        m.setSex(user.getSex());
        m.setNo(user.getNo());
        m.setUpdateTime(new Date());
        epiUserService.updateById(m);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:user:delete")
    public R delete(@RequestBody Long[] ids){
        epiUserService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
