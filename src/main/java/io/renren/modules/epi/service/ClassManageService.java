package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.ClassManageEntity;

import java.util.Map;

/**
 * 班级管理表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
public interface ClassManageService extends IService<ClassManageEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

