package io.renren.modules.epi.entity.home;

import lombok.Data;
/**
 * 主页数据
 * @author DFM-LC
 * @date  2020-1-30 14:47
 * */
@Data
public class HomeActivityArea {
    /*
    * 地区名称
    * */
    private String name;

    /*
    * 地区人数
    * */
    private int value;
}
