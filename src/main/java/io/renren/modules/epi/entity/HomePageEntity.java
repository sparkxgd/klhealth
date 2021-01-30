package io.renren.modules.epi.entity;

import io.renren.modules.epi.entity.home.HomeActivityArea;
import lombok.Data;

import java.util.List;

/**
 * 主页数据
 * @author DFM-LC
 * @date  2020-1-30 14:47
 * */
@Data
public class HomePageEntity {

    /*
    * 系统总人数
    * */
    private int sysUserNum;

    /*
    * 今日未签到
    * */
    private int dayNoSignIn;

    /*
    * 今日已签到
    * */
    private int daySignIn;

    /*
    * 今日任务
    * */
    private int dayTask;

    /*
    * 已完成任务
    * */
    private int taskComplete;

    /*
    * 未完成任务
    * */
    private int taskUnFinishde;

    /*
    * 正常人数
    * */
    private int peoNormalNum;

    /*
    * 异常人数
    * */
    private int peoAbnormalNum;
    /*
    * 用户活动区域
    * */
    private List<HomeActivityArea> areas;
    /*
    * 学院签到数据分析
    * 待定
    * */
}
