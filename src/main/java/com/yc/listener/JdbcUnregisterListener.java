package com.yc.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

@WebListener
public class JdbcUnregisterListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            // Or com.mysql.jdbc.AbandonedConnectionCleanupThread
            Class cls = Class.forName("com.mysql.cj.jdbc.AbandonedConnectionCleanupThread");
            Method method = cls.getMethod("checkedShutdown");
            method.invoke(null);
        } catch (ClassNotFoundException | NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
        }

        // Now deregister JDBC drivers in this context's ClassLoader:
        // Get the webapp's ClassLoader
        ClassLoader cl = Thread.currentThread().getContextClassLoader();
        // Loop through all drivers
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            if (driver.getClass().getClassLoader() == cl) {
                // This driver was registered by the webapp's ClassLoader, so deregister it:
                try {
                    DriverManager.deregisterDriver(driver);
                } catch (SQLException ex) {
                }
            } else {
                // driver was not registered by the webapp's ClassLoader and may be in use elsewhere
            }
        }
    }
}
