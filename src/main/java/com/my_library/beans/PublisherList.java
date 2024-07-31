package com.my_library.beans;

import com.my_library.db.DataBase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PublisherList {

    private ArrayList<Publisher> getPublisherList() {
        ArrayList<Publisher> publisherList = new ArrayList<>();

        try (Connection conn = DataBase.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from author order by publisher_name")) {

            while (rs.next()) {
                Publisher publisher = new Publisher();
                String df = rs.getString("publisher_name");
                publisher.setPublisherName(rs.getString("publisher_name"));
                publisherList.add(publisher);
            }
        } catch (SQLException e) {
            Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, e);
        }
        return publisherList;
    }

}
