/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.app.form;

import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * 登录表单
 *
 * @author Mark sunlightcs@gmail.com
 */
@Data
@ApiModel(value = "微信用户信息")
public class WeixinUserInfo {
    private String avatarUrl;

    private String city;

    private String country;

    private String gender;

    private String language;

    private String nickName;
    private String province;



}
