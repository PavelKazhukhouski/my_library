package com.my_library.servlet;

import com.my_library.beans.Author;
import com.my_library.beans.AuthorList;
import com.my_library.db.DataBase;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        AuthorList authorList = new AuthorList();
        List<Author> authors = authorList.getAuthorList();
        System.out.println(authors);
    }
}
