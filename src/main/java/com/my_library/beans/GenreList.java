package com.my_library.beans;

import com.my_library.db.DataBase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GenreList {

    public ArrayList<Genre> getGenreList() {
        ArrayList<Genre> genreList = new ArrayList<>();

        try (Connection conn = DataBase.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from genre order by genre_name")) {

            while (rs.next()) {
                Genre genre = new Genre();
                genre.setName(rs.getString("genre_name"));
                genreList.add(genre);
            }
        } catch (SQLException e) {
            Logger.getLogger(GenreList.class.getName()).log(Level.SEVERE, null, e);
        }
        return genreList;
    }

}
