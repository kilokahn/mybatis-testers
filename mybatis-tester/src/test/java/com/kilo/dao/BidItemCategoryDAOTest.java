
package com.kilo.dao;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;

import com.kilo.dao.mapper.BidItemCategoryDAO;
import com.kilo.domain.BidItemCategory;

public class BidItemCategoryDAOTest extends BaseDAOTest {

    @Resource(name = "bidItemCategoryDAO")
    private BidItemCategoryDAO bidItemCategoryDAO;

    @Test
    public void testGetBidItemCategoryById() {
        Integer bidItemCategoryId = 1;
        BidItemCategory bidItemCategory = bidItemCategoryDAO
                .getBidItemCategoryById(bidItemCategoryId);
        Assert.assertNotNull(bidItemCategory);
        bidItemCategory = bidItemCategoryDAO
                .getBidItemCategoryById(bidItemCategoryId);
        Assert.assertNotNull(bidItemCategory);
    }
}
