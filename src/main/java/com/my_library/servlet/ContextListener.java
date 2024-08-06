package com.my_library.servlet;

import com.my_library.dao.*;
import com.my_library.dao.database.sessionmanager.SessionManager;
import com.my_library.dao.database.sessionmanager.SessionManagerDataBase;
import com.my_library.dao.datasource.DataSourcePostgreSQL;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import javax.sql.DataSource;
import java.sql.Connection;

@WebListener
public class ContextListener implements ServletContextListener {
    private BookDao bookDaoJDBS;
    private AuthorDao authorDaoJDBC;
    private GenreDao genreDaoJDBC;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        final ServletContext servletContext =
                sce.getServletContext();
        DataSource dataSource = DataSourcePostgreSQL.getDataSource();
        SessionManager sessionManager = new SessionManagerDataBase(dataSource);

        bookDaoJDBS = new BookDaoJDBS(sessionManager);
        servletContext.setAttribute(bookDaoJDBS);



    }
}