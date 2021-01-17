package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.MessageSandDao;
import io.renren.modules.epi.entity.MessageSandEntity;
import io.renren.modules.epi.service.MessageSandService;


@Service("messageSandService")
public class MessageSandServiceImpl extends ServiceImpl<MessageSandDao, MessageSandEntity> implements MessageSandService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<MessageSandEntity> page = this.page(
                new Query<MessageSandEntity>().getPage(params),
                new QueryWrapper<MessageSandEntity>()
        );

        return new PageUtils(page);
    }

}