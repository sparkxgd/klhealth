package io.renren.modules.epi.dao;

import io.renren.modules.epi.entity.EpiUserEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 疫情系统用户表
 *
 * @author xiaoguangding
 * @email 472036660@qq.com
 * @date 2021-01-18 13:48:17
 */
@Mapper
public interface EpiUserDao extends BaseMapper<EpiUserEntity> {

}
