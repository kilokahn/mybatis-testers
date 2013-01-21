
package com.kilo.dao.mapper;

import java.util.List;

import com.kilo.domain.LoginLocation;

public interface LoginLocationDAO {

    List<LoginLocation> getLoginLocations();

    LoginLocation getLoginLocationById(Long loginLocationId);

}
