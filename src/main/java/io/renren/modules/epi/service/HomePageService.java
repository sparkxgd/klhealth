package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.epi.entity.HealthInfoEntity;
import io.renren.modules.epi.entity.HomePageEntity;

import java.util.List;

public interface HomePageService extends IService<HomePageEntity> {

    int sysUserNum();

    int daySignIn();

    int dayNoSignIn();

    int dayTask();

    int taskComplete();

    int taskUnFinishde();

    int peoNormalNum();

    int peoAbnormalNum();

    List<HealthInfoEntity> infoEntitys();
}
