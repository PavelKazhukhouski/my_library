<%@ page import="com.my_library.beans.Author" %>
<%@ page import="com.my_library.beans.AuthorList" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Онлайн библиотека</title>
    <link rel="stylesheet" href="../css/style_main.css" type="text/css">
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="../images/logo.png" alt="Logo" />
            <form class="search_form" method="POST">
                <input type="text" name="search_String" placeholder="Поиск..." />
                <input type="submit" name="search_button" value="Поиск" />
                <select name="search_option">
                    <option value="title">Название</option>
                    <option value="author">Автор</option>
                </select>
            </form>
        </div>

        <div class="sidebar1">
            <h4>Список авторов:</h4>
            <ul class="nav">
                <c:forEach var="author" items="${authorList.authorList}">
                    <li><a href="#">${author.name}</a></li>
                </c:forEach>
            </ul>
        </div>

        <div class="content">
            <h1>Добро пожаловать!</h1>
            <p>Используйте меню для поиска книг и авторов.</p>
        </div>
    </div>
</body>
</html>

