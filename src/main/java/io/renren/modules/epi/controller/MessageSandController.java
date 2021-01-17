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

import io.renren.modules.epi.entity.MessageSandEntity;
import io.renren.modules.epi.service.MessageSandService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 消息发送表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:20:56
 */
@RestController
@RequestMapping("epi/messagesand")
public class MessageSandController {
    @Autowired
    private MessageSandService messageSandService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("epi:messagesand:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = messageSandService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("epi:messagesand:info")
    public R info(@PathVariable("id") Long id){
		MessageSandEntity messageSand = messageSandService.getById(id);

        return R.ok().put("messageSand", messageSand);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("epi:messagesand:save")
    public R save(@RequestBody MessageSandEntity messageSand){
		messageSandService.save(messageSand);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("epi:messagesand:update")
    public R update(@RequestBody MessageSandEntity messageSand){
		messageSandService.updateById(messageSand);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("epi:messagesand:delete")
    public R delete(@RequestBody Long[] ids){
		messageSandService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
