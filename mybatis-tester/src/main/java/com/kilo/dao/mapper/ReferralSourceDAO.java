
package com.kilo.dao.mapper;

import java.util.List;

import com.kilo.domain.ReferralSource;

public interface ReferralSourceDAO {

    List<ReferralSource> getReferralSources();

    ReferralSource getReferralSourceById(Integer referralSourceId);

}
