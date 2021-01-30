package io.renren.modules.epi.service.impl;

import com.qiniu.util.StringUtils;
import io.renren.modules.app.form.WeixinUserForm;
import io.renren.modules.epi.entity.EpiUserEntity;
import io.renren.modules.epi.entity.UserDeptEntity;
import io.renren.modules.epi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.epi.dao.UserBandingDao;
import io.renren.modules.epi.entity.UserBandingEntity;
import io.renren.modules.epi.service.UserBandingService;


@Service("userBandingService")
public class UserBandingServiceImpl extends ServiceImpl<UserBandingDao, UserBandingEntity> implements UserBandingService {
    @Autowired
    private UserService epiUserService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<UserBandingEntity> page = this.page(
                new Query<UserBandingEntity>().getPage(params),
                new QueryWrapper<UserBandingEntity>()
        );

        return new PageUtils(page);
    }
    @Override
    public PageUtils queryPages(Map<String, Object> params) {
        //表关联分页查询
        QueryWrapper<UserBandingEntity> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isNullOrEmpty(String.valueOf(params.get("key")))) {
            //这里的a.`name`的a是在dao的查询语句里面，记得要对应，要不然就查不到
            queryWrapper.like("b.username",params.get("key").toString());
        }
        //设置分页参数
        IPage<UserBandingEntity> page = new Query<UserBandingEntity>().getPage(params);
        //分页查询
        IPage<UserBandingEntity> pages= this.baseMapper.getPages(page,queryWrapper);

        return new PageUtils(pages);
    }

    @Override
    public UserBandingEntity createAccountAndBingding(String weixinId) {
        //判断是否存在这个微信号
        UserBandingEntity m = this.getByweixinId(weixinId);
        //如果没有，就创建，注意：先创建用户表，然后再创建绑定表
        if(m==null){
            EpiUserEntity user=new EpiUserEntity();
            user.setCreateTime(new Date());
            user.setUsername(weixinId);
            user.setPassword("123456");
            user.setUpdateTime(new Date());
            epiUserService.save(user);

            EpiUserEntity userm = epiUserService.getOneBy(weixinId);

            UserBandingEntity mm = new UserBandingEntity();
            mm.setAccountId(weixinId);
            mm.setUserId(userm.getId());
            mm.setUpdateTime(new Date());
            mm.setType(0);//0代表是微信
            this.save(mm);
            return mm;
        }
        return m;
    }

    @Override
    public UserBandingEntity updateBingding(WeixinUserForm userinfo) {
        //根据微信号找到用户信息
        UserBandingEntity m=this.getByweixinId(userinfo.getOpenid());
        m.setHeadImg(userinfo.getUserInfo().getAvatarUrl());
        m.setNickname(userinfo.getUserInfo().getNickName());
        m.setUpdateTime(new Date());
        this.updateById(m);
        return m;
    }

    @Override
    public UserBandingEntity getByweixinId(String weixinId) {
        return this.getOne(new QueryWrapper<UserBandingEntity>().eq("account_id",weixinId));
    }

}
