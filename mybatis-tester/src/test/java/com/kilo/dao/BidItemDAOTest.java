package com.kilo.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.junit.Test;

import com.kilo.dao.mapper.BidItemDAO;
import com.kilo.domain.BidItem;


public class BidItemDAOTest extends BaseDAOTest {

	private static final Logger LOGGER = Logger.getLogger(BidItemDAOTest.class);

	@Resource(name = "bidItemDAO")
	private BidItemDAO bidItemDAO;

	@Test
	public void testGetBidItems() {
		List<BidItem> bidItems = bidItemDAO.getBidItems();
		LOGGER.info("Done fetching bid items.");
		Assert.assertNotNull(bidItems);
		for (BidItem bidItem : bidItems) {
			LOGGER.info(bidItem.getBidItemCategory().getName());
		}
	}
}
