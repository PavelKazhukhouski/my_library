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
    private final ArrayList<Author> authorList = new ArrayList<>();

    private ArrayList<Author> getAuthors() {
        authorList.add(new Author("Valera"));
        authorList.add(new Author("Valera1"));
        authorList.add(new Author("Valera2"));
        authorList.add(new Author("Valera3"));
//        try {
//            Connection conn = DataBase.getConnection();
//
//            assert conn != null;
//            Statement stmt = conn.createStatement();
//            ResultSet rs = stmt.executeQuery("select * from author");
//            while (rs.next()) {
//                Author author = new Author();
//                String df = rs.getString("author_name");
//                author.setName(rs.getString("author_name"));
//                authorList.add(author);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, ex);
//        }

        return authorList;
    }

    public ArrayList<Author> getAuthorList() {
        if (!authorList.isEmpty()) {
            return authorList;
        } else {
            return getAuthors();

        }
    }
}
