
package com.kilo.dao.mapper;

import java.util.List;

import com.kilo.domain.User;

public interface UserDAO {

    List<User> getUsers();

    User getUserById(Integer userId);

    User getUserByName(String userName);

}
