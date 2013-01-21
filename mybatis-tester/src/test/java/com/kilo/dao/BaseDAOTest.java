
package com.kilo.dao;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/kilo/logging.xml",
        "/com/kilo/applicationContext.xml" })
public abstract class BaseDAOTest {

}
