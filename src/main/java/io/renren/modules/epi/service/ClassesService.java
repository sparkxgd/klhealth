package io.renren.modules.epi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.epi.entity.ClassesEntity;

import java.util.Map;

/**
 * 班级表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-17 11:21:32
 */
public interface ClassesService extends IService<ClassesEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

