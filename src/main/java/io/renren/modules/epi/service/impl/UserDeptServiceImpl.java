package io.renren.modules.epi.service.impl;

import com.qiniu.util.StringUtils;
import io.renren.modules.epi.entity.ClassesEntity;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.UserDeptDao;
import io.renren.modules.epi.entity.UserDeptEntity;
import io.renren.modules.epi.service.UserDeptService;


@Service("userDeptService")
public class UserDeptServiceImpl extends ServiceImpl<UserDeptDao, UserDeptEntity> implements UserDeptService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserDeptEntity> page = this.page(
                new Query<UserDeptEntity>().getPage(params),
                new QueryWrapper<UserDeptEntity>()
        );

        return new PageUtils(page);
    }
    @Override
    public PageUtils queryPages(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<UserDeptEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.like("a.username",params.get("key").toString());
        }
        //设置分页参数
        IPage<UserDeptEntity> page = new Query<UserDeptEntity>().getPage(params);
        //分页查询
        IPage<UserDeptEntity> pages= this.baseMapper.getPages(page,queryWrapper);

        return new PageUtils(pages);
    }

    @Override
    public UserDeptEntity getSById(Long id) {
        return this.baseMapper.getSById(id);
    }
}
