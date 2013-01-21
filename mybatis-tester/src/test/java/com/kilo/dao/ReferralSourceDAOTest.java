
package com.kilo.dao;

import java.util.List;

import javax.annotation.Resource;

import junit.framework.Assert;

import org.junit.Test;

import com.kilo.dao.mapper.ReferralSourceDAO;
import com.kilo.domain.ReferralSource;

public class ReferralSourceDAOTest extends BaseDAOTest {

    @Resource(name = "referralSourceDAO")
    private ReferralSourceDAO referralSourceDAO;

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
