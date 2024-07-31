package com.my_library.beans;

import com.my_library.db.DataBase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookList {

    private ArrayList<Book> getBookList() {
        ArrayList<Book> bookList = new ArrayList<>();
        try (Connection conn = DataBase.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from author order by title")) {

            while (rs.next()) {
                Book book = new Book();
                String df = rs.getString("title");
                book.setTitle(rs.getString("title"));
                bookList.add(book);
            }
        } catch (SQLException e) {
            Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, e);
        }
        return bookList;
    }

}

