package com.my_library.db;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DataBase {
    private static final Logger LOGGER = Logger.getLogger(DataBase.class.getName());
    private static DataSource ds;

    static {
        try {
            InitialContext ic = new InitialContext();
            ds = (DataSource) ic.lookup("java:comp/env/jdbc/library");
        } catch (NamingException ex) {
            LOGGER.log(Level.SEVERE, "Error   DataSource", ex);
        }
    }

    public static Connection getConnection() {
        try {
            if (ds != null) {
                return ds.getConnection();
            } else {
                throw new SQLException("DataSource is not initialized");
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error getting connection", ex);
            return null;
        }
    }
}
