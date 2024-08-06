<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.sql.*" %>
 <%@ page import="java.util.ArrayList" %>
 <%@ page import="java.util.List" %>
 <!DOCTYPE html>
 <html lang="ru" dir="ltr">
<html>
<head>
    <meta charset="UTF-8">
    <title>Библиотека</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #121212;
            color: #e0e0e0;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            color: #ffffff;
            margin-top: 20px;
            font-size: 2em;
        }
        form {
            margin: 20px;
            padding: 20px;
            background-color: #1e1e1e;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 600px;
        }
        h2 {
            color: #ffffff;
            margin-bottom: 10px;
            font-size: 1.5em;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #e0e0e0;
        }
        input[type="text"],
        select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #333;
            border-radius: 4px;
            background-color: #333;
            color: #e0e0e0;
            font-size: 1em;
        }
        button {
            padding: 10px 15px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
        }
        button:hover {
            background-color: #0056b3;
        }
        table {
            width: 80%;
            margin: 20px;
            border-collapse: collapse;
            background-color: #1e1e1e;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #333;
        }
        th {
            background-color: #333;
            color: #e0e0e0;
        }
        tr:hover {
            background-color: #2c2c2c;
        }
    </style>
</head>
<body>
    <h1>Управление книгами</h1>

    <!-- Форма для добавления книги -->
    <h2>Добавить книгу</h2>
    <form action="AddBookServlet" method="POST">
        <label for="title">Название:</label>
        <input type="text" id="title" name="title" required>
        <label for="author">Автор:</label>
        <input type="text" id="author" name="author">
        <label for="genre">Жанр:</label>
        <input type="text" id="genre" name="genre">
        <label for="publisher">Издательство:</label>
        <input type="text" id="publisher" name="publisher">
        <button type="submit">Добавить книгу</button>
    </form>

    <!-- Форма для изменения книги -->
    <h2>Изменить книгу</h2>
    <form action="UpdateBookServlet" method="POST">
        <label for="id">ID книги:</label>
        <input type="text" id="id" name="id" required>
        <label for="newTitle">Новое название:</label>
        <input type="text" id="newTitle" name="newTitle">
        <button type="submit">Изменить книгу</button>
    </form>

    <!-- Форма для удаления книги по ID -->
    <h2>Удалить книгу</h2>
    <form action="DeleteBookServlet" method="POST">
        <label for="deleteId">ID книги:</label>
        <input type="text" id="deleteId" name="id" required>
        <button type="submit">Удалить книгу</button>
    </form>

    <!-- Форма для удаления книги по названию -->
    <h2>Удалить книгу по названию</h2>
    <form action="DeleteBookByTitleServlet" method="POST">
        <label for="deleteTitle">Название книги:</label>
        <input type="text" id="deleteTitle" name="title" required>
        <button type="submit">Удалить книгу</button>
    </form>

    <!-- Форма для поиска книг -->
    <h2>Поиск книг</h2>
    <form action="SearchBooksServlet" method="GET">
        <label for="searchType">Поиск по:</label>
        <select id="searchType" name="searchType">
            <option value="author">Автор</option>
            <option value="title">Название</option>
            <option value="genre">Жанр</option>
            <option value="publisher">Издательство</option>
        </select>
        <input type="text" name="searchValue" required>
        <button type="submit">Поиск</button>
    </form>

    <!-- Вывод списка книг -->
    <h2>Список книг</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Автор</th>
                <th>Жанр</th>
                <th>Издательство</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Java code to fetch and display books
                String dbUrl = "jdbc:h2:~/test;DB_CLOSE_ON_EXIT=FALSE";
                String dbUser = "sa";
                String dbPassword = "";

                try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery("SELECT * FROM books")) {

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String title = rs.getString("title");
                        String author = rs.getString("author");
                        String genre = rs.getString("genre");
                        String publisher = rs.getString("publisher");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= title %></td>
                <td><%= author %></td>
                <td><%= genre %></td>
                <td><%= publisher %></td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</body>
</html>