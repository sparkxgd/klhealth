package io.renren.modules.epi.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.renren.modules.sys.entity.SysMenuEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.epi.entity.DeptEntity;
import io.renren.modules.epi.service.DeptService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 部门机构表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:33
 */
@RestController
@RequestMapping("epi/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:dept:list")
    public List<DeptEntity> list(){
        List<DeptEntity> deptList = deptService.list();
        for(DeptEntity deptEntity : deptList){
            DeptEntity parentDeptEntity = deptService.getById(deptEntity.getParentId());
            if(parentDeptEntity != null){
                deptEntity.setParentName(parentDeptEntity.getName());
            }
        }
        return deptList;
    }

    /**
     * 选择菜单(添加、修改菜单)
     */
    @GetMapping("/select")
    @RequiresPermissions("epi:dept:select")
    public R select(){
        //查询列表数据
        List<DeptEntity> menuList = deptService.list();

        return R.ok().put("menuList", menuList);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:dept:info")
    public R info(@PathVariable("id") Long id){
		DeptEntity dept = deptService.getById(id);

        return R.ok().put("dept", dept);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:dept:save")
    public R save(@RequestBody DeptEntity dept){
		deptService.save(dept);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:dept:update")
    public R update(@RequestBody DeptEntity dept){
		deptService.updateById(dept);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:dept:delete")
    public R delete(@RequestBody Long[] ids){
		deptService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
