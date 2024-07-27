<%@ page import="com.my_library.beans.Author" %>
<%@ page import="com.my_library.beans.AuthorList" %>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Онлайн библиотека</title>
    <link rel="stylesheet" href="css/style_main.css" type="text/css">
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="../images/logo.png" alt="Место для логотипа" class="logo">
            <form class="search_form" name="search_form" method="POST">
                <img src="images/search.jpg" alt="Поиск">
                <input type="text" name="search_String" value="" size="100">
                <input type="submit" value="Поиск" name="search_button">
                <select name="search_option">
                    <option value="title">Название</option>
                    <option value="author">Автор</option>
                </select>
            </form>
        </div>

        <div class="sidebar1">
            <h4>Список авторов:</h4>
            <ul class="nav">
                <%
                AuthorList authorList = new AuthorList();
                for (Author author : authorList.getAuthorList()) {
                %>
                <li><a href="#"><%= author.getName() %></a></li>
                <% } %>
            </ul>
            <p>&nbsp;</p>
        </div>

        <div class="content">
            <h1>&nbsp;</h1>
            <p>&nbsp;</p>
        </div>
    </div>
</body>
</html>
