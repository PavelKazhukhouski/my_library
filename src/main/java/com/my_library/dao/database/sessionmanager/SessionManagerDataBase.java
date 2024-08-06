package com.my_library.dao.database.sessionmanager;


import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class SessionManagerDataBase implements SessionManager{
    private static final int TIMEOUT = 10;
    private final DataSource dataSource;
    private Connection connection;

    public SessionManagerDataBase(DataSource dataSource) {
        if(dataSource == null) {
            throw new SessionManagerException("Datasource is null");
        }
        this.dataSource = dataSource;
    }


    @Override
    public void beginSession() {
        try {
            connection = dataSource.getConnection();
            connection.setAutoCommit(false);
        } catch (SQLException e) {
            throw new SessionManagerException(e);
        }
    }

    @Override
    public void commitSession() {
        checkConnection();
        try {
            connection.commit();
        } catch (SQLException e) {
            throw new SessionManagerException(e);
        }

    }

    @Override
    public void rollbackSession() {
        checkConnection();
        try {
            connection.rollback();
        } catch (SQLException e) {
            throw new SessionManagerException(e);
        }
    }

    @Override
    public void close() {
        checkConnection();
        try {
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Connection getCurrentSession() {
        checkConnection();
        return connection;
    }

    private void checkConnection() {
        try {
            if(connection == null || !connection.isValid(TIMEOUT)){
                throw new SessionManagerException("Connection is invalid");
            }
        } catch (SQLException e) {
            throw new SessionManagerException(e);
        }
    }
}
