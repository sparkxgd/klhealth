/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.app.form;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 登录表单
 *
 * @author Mark sunlightcs@gmail.com
 */
@Data
@ApiModel(value = "微信用户登录表单")
public class WeixinUserForm {
    private String openid;
    private String code;
    private String encryptedData;

    private String errMsg;

    private String iv;

    private String rawData;

    private String signature;

    private WeixinUserInfo userInfo;



}
