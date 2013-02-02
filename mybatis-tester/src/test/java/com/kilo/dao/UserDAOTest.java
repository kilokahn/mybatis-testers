
package com.kilo.dao;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;

import com.kilo.dao.mapper.UserDAO;
import com.kilo.domain.User;

public class UserDAOTest extends BaseDAOTest {

    @Resource(name = "userDAO")
    private UserDAO userDAO;

    @Test
    public void testGetUsers() {
        List<User> users = userDAO.getUsers();
        Assert.assertNotNull(users);
    }

    @Test
    public void testGetUserById() {
        Integer userId = 1;
        User user = userDAO.getUserById(userId);
        Assert.assertNotNull(user);
        userId = 2;
        user = userDAO.getUserById(userId);
        Assert.assertNotNull(user);
        userId = 3;
        user = userDAO.getUserById(userId);
        Assert.assertNotNull(user);
    }

    @Test
    public void testGetUserByName() {
        String userName = "baigm";
        User user = userDAO.getUserByName(userName);
        Assert.assertNotNull(user);
    }
}
