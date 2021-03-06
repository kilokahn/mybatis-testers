
package com.kilo;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MybatisTestDriver {

    public static void main(String[] args) {
        try (ConfigurableApplicationContext applicationContext = new ClassPathXmlApplicationContext(
                "classpath:com/kilo/applicationContext.xml",
                "classpath:com/kilo/logging.xml")) {
            System.out.println("Inited");
        }

    }

}
