package io.renren.modules.epi.controller;

import io.renren.common.utils.R;
import io.renren.modules.epi.entity.HealthInfoEntity;
import io.renren.modules.epi.entity.HomePageEntity;
import io.renren.modules.epi.entity.home.HomeActivityArea;
import io.renren.modules.epi.service.HomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * 主页
 * @author DFM-LC
 * @date  2020-1-30 14:47
 * */
@RestController
@RequestMapping("epi/home")
public class HomePageController {
    @Autowired
    HomePageService pageService;

    @RequestMapping("/data")
    public R HomeInfoData(){
        HomePageEntity entity = new HomePageEntity();
        entity.setSysUserNum(pageService.sysUserNum());
        entity.setDaySignIn(pageService.daySignIn());
        entity.setDayNoSignIn(pageService.dayNoSignIn());
        entity.setDayTask(pageService.dayTask());
        entity.setTaskComplete(pageService.taskComplete());
        entity.setTaskUnFinishde(pageService.taskUnFinishde());
        entity.setPeoNormalNum(pageService.peoNormalNum());
        entity.setPeoAbnormalNum(pageService.peoAbnormalNum());
        List<HealthInfoEntity> infoEntities = pageService.infoEntitys();
        List<HomeActivityArea> areas = new ArrayList<>();
        for (HealthInfoEntity entity1 : infoEntities){
            boolean isSame=false;
            for (HomeActivityArea activityArea : areas){
                if (activityArea.getName().equals(entity1.getZoneAction())){
                    isSame=true;
                    activityArea.setValue(activityArea.getValue()+1);
                    break;
                }
            }
            if (!isSame) {
                HomeActivityArea activityArea = new HomeActivityArea();
                activityArea.setName(entity1.getZoneAction());
                activityArea.setValue(1);
                areas.add(activityArea);
            }
        }
        entity.setAreas(areas);
        return new R().put("data", entity);
    }

}
