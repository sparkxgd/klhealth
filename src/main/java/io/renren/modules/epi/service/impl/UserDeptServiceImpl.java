package io.renren.modules.epi.service.impl;

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

}