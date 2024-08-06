package com.my_library.dao;

import com.my_library.dao.database.sessionmanager.SessionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class BookDaoJDBS implements BookDao{
    private final SessionManager sessionManager;

    public BookDaoJDBS(SessionManager sessionManager) {
        this.sessionManager = sessionManager;
    }

    @Override
    public void createBook() {
        sessionManager.beginSession();
        Connection connection = sessionManager.getCurrentSession();

    }

    @Override
    public void readBook() {

    }

    @Override
    public void updateBook() {

    }

    @Override
    public void deleteBook() {

    }
}
