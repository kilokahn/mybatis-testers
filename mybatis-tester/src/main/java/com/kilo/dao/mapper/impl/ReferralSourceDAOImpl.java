
package com.kilo.dao.mapper.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.kilo.dao.mapper.ReferralSourceDAO;
import com.kilo.domain.ReferralSource;

public class ReferralSourceDAOImpl extends SqlSessionDaoSupport implements
        ReferralSourceDAO {

    @Override
    public List<ReferralSource> getReferralSources() {
        return getSqlSession().selectList(
                "com.kilo.dao.mapper.ReferralSourceDAO.getReferralSources");
    }

    @Override
    public ReferralSource getReferralSourceById(Integer referralSourceId) {
        return getSqlSession().selectOne(
                "com.kilo.dao.mapper.ReferralSourceDAO.getReferralSourceById",
                referralSourceId);
    }

}
