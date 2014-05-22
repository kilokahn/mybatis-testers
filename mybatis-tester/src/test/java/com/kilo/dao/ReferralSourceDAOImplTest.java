
package com.kilo.dao;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;

import com.kilo.dao.mapper.impl.ReferralSourceDAOImpl;
import com.kilo.domain.ReferralSource;

public class ReferralSourceDAOImplTest extends BaseDAOTest {

    @Resource(name = "referralSourceDAOImpl")
    private ReferralSourceDAOImpl referralSourceDAO;

    @Test
    public void testGetReferralSources() {
        List<ReferralSource> referralSources = referralSourceDAO
                .getReferralSources();
        Assert.assertNotNull(referralSources);
    }

    @Test
    public void testGetReferralSourceById() {
        Integer referralSourceId = 1;
        ReferralSource referralSource = referralSourceDAO
                .getReferralSourceById(referralSourceId);
        Assert.assertNotNull(referralSource);
    }

}
