package io.renren.modules.epi.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.epi.entity.HealthInfoEntity;
import io.renren.modules.epi.entity.HomePageEntity;
import io.renren.modules.epi.entity.home.Count;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HomePageDao extends BaseMapper<HomePageEntity> {

    Count sel_sysUserNum();

    Count sel_SignIn();

    Count sel_dask();

    Count sel_peoNormal();

    List<HealthInfoEntity> sel_userArea();
}
