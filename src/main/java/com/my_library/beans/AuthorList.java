package com.my_library.beans;

import com.my_library.db.DataBase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AuthorList {

    public ArrayList<Author> getAuthorList() {
        ArrayList<Author> authorList = new ArrayList<>();
        try (Connection conn = DataBase.getConnection()) {
            assert conn != null;
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("select * from author order by author_name")) {

                while (rs.next()) {
                    Author author = new Author();
                    author.setName(rs.getString("author_name"));
                    authorList.add(author);
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, e);
        }
        return authorList;
    }

}
