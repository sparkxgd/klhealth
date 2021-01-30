package io.renren.modules.epi.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.epi.dao.HomePageDao;
import io.renren.modules.epi.entity.HealthInfoEntity;
import io.renren.modules.epi.entity.HomePageEntity;
import io.renren.modules.epi.service.HomePageService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("homeSerivce")
public class HomePageSerivceImpl extends ServiceImpl<HomePageDao, HomePageEntity> implements HomePageService {
    /*
    * 系统总人数
    * */
    private int SysUserNum;
    /*
    * 今日已签到
    * */
    private int DaySignIn;
    /*
    * 今日总任务
    * */
    private int DayTask;
    /*
    * 今日正常人数
    * */
    private int PeoNormalNum;

    @Override
    public int sysUserNum() {
        SysUserNum=baseMapper.sel_sysUserNum().getCount();
        return SysUserNum;
    }

    @Override
    public int daySignIn() {
        DaySignIn=baseMapper.sel_SignIn().getCount();
        return DaySignIn;
    }

    @Override
    public int dayNoSignIn() {
        return SysUserNum-DaySignIn;
    }

    @Override
    public int dayTask() {
        DayTask=baseMapper.sel_dask().getCount();
        return DayTask;
    }

    @Override
    public int taskComplete() {
        return (int) (Math.random()*100);
    }

    @Override
    public int taskUnFinishde() {
        return (int) (Math.random()*100);
    }

    @Override
    public int peoNormalNum() {
        PeoNormalNum = baseMapper.sel_peoNormal().getCount();
        return PeoNormalNum;
    }

    @Override
    public int peoAbnormalNum() {
        return DaySignIn-PeoNormalNum;
    }

    @Override
    public List<HealthInfoEntity> infoEntitys() {
        return baseMapper.sel_userArea();
    }
}
