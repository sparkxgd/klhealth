package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.DeptDao;
import io.renren.modules.epi.entity.DeptEntity;
import io.renren.modules.epi.service.DeptService;


@Service("deptService")
public class DeptServiceImpl extends ServiceImpl<DeptDao, DeptEntity> implements DeptService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<DeptEntity> page = this.page(
                new Query<DeptEntity>().getPage(params),
                new QueryWrapper<DeptEntity>()
        );

        return new PageUtils(page);
    }

}