package io.renren.modules.epi.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.EpiUserDao;
import io.renren.modules.epi.entity.EpiUserEntity;
import io.renren.modules.epi.service.UserService;


@Service("epiUserService")
public class UserServiceImpl extends ServiceImpl<EpiUserDao, EpiUserEntity> implements UserService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<EpiUserEntity> page = this.page(
                new Query<EpiUserEntity>().getPage(params),
                new QueryWrapper<EpiUserEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public boolean isExitUser(String username) {
        int count = this.count(new QueryWrapper<EpiUserEntity>().eq("username",username));
        if(count>0){
            return false;
        }else{
            return true;
        }
    }

    @Override
    public PageUtils queryPages(Map<String, Object> params) {
        return null;
    }

    @Override
    public EpiUserEntity getOneBy(String username) {

        return this.getOne(new QueryWrapper<EpiUserEntity>().eq("username",username));
    }

    @Override
    public EpiUserEntity getStudentByNo(String no) {
        return this.getOne(new QueryWrapper<EpiUserEntity>().eq("no",no).eq("type",0));
    }
}
