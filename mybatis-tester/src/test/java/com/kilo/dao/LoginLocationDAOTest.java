
package com.kilo.dao;

import java.util.List;

import javax.annotation.Resource;

import junit.framework.Assert;

import org.junit.Test;

import com.kilo.dao.mapper.LoginLocationDAO;
import com.kilo.domain.LoginLocation;

public class LoginLocationDAOTest extends BaseDAOTest {

    @Resource(name = "loginLocationDAO")
    private LoginLocationDAO loginLocationDAO;

    @Test
    public void testGetLoginLocations() {

        List<LoginLocation> loginLocations = loginLocationDAO
                .getLoginLocations();
        Assert.assertNotNull(loginLocations);
    }

    @Test
    public void testGetLoginLocationById() {
        Long loginLocationId = 1L;
        LoginLocation loginLocation = loginLocationDAO
                .getLoginLocationById(loginLocationId);
        Assert.assertNotNull(loginLocation);
    }
}
