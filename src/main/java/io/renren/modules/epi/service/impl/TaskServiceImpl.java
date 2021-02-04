package io.renren.modules.epi.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.qiniu.util.StringUtils;
import io.renren.common.utils.R;
import io.renren.modules.epi.entity.EpiUserEntity;
import io.renren.modules.epi.entity.TaskSandEntity;
import io.renren.modules.epi.entity.UserDeptEntity;
import io.renren.modules.epi.service.TaskSandService;
import io.renren.modules.epi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.TaskDao;
import io.renren.modules.epi.entity.TaskEntity;
import io.renren.modules.epi.service.TaskService;


@Service("taskService")
public class TaskServiceImpl extends ServiceImpl<TaskDao, TaskEntity> implements TaskService {
    @Autowired
    private UserService epiUserService;
    @Autowired
    private TaskSandService taskSandService;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<TaskEntity> page = this.page(
                new Query<TaskEntity>().getPage(params),
                new QueryWrapper<TaskEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPages(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<TaskEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.like("a.username",params.get("key").toString());
        }
        //设置分页参数
        IPage<TaskEntity> page = new Query<TaskEntity>().getPage(params);
        //分页查询
        IPage<TaskEntity> pages= this.baseMapper.getPages(page,queryWrapper);

        return new PageUtils(pages);
    }

    @Override
    public TaskEntity getTaskById(long id) {
        return this.getOne(new QueryWrapper<TaskEntity>().eq("id",id));
    }

    @Override
    public R startTask(Long id) {
        TaskEntity t=this.getById(id);
        if(t!=null){
            //没有超时
            if(t.getEndTime().getTime()>new Date().getTime()){
                //开始发送给相应的用户
                List<EpiUserEntity> userlist=new ArrayList<>();
                //发送目标：0：所有用户，1：学生，2教师，3,其他
                int sandTarget =t.getSandTarget();
                //用户表：0：学生，1：教师，2：其他
                switch (sandTarget){
                    case 0:
                        userlist=epiUserService.list();
                    break;
                    case 1:
                        userlist=epiUserService.list(new QueryWrapper<EpiUserEntity>().eq("type",0));
                        break;
                    case 2:
                        userlist=epiUserService.list(new QueryWrapper<EpiUserEntity>().eq("type",1));
                        break;
                    case 3:
                        userlist=epiUserService.list(new QueryWrapper<EpiUserEntity>().eq("type",02));
                        break;
                }

                //发送
                List<TaskSandEntity> sendlist=new ArrayList<>();
                for(EpiUserEntity em:userlist){
                    TaskSandEntity send=new TaskSandEntity();
                    send.setReceiveTime(new Date());
                    send.setTaskId(t.getId());
                    send.setUserId(em.getId());
                    sendlist.add(send);
                }
                //批量保存
                taskSandService.saveBatch(sendlist);
                //更新任务表
                t.setStatus(1);
                this.updateById(t);
                return R.ok();
            }else{
                return R.error("任务过结束时间");
            }
        }
        return R.error("任务不存在！");
    }
}