<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.my_library.beans.Author" %>
<%@ page import="com.my_library.beans.AuthorList" %>
<!DOCTYPE html>
<html lang="ru" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Онлайн библиотека</title>
    <link rel="stylesheet" href="css/style_main.css" type="text/css">
</head>
<body>
    <div class="conteiner">
        <div class="header">
            <img alt="Место для логотипа" name="logo" width="100%" height="90"/>
            <form class="search_form" method="POST">
                <img src="images/lib.png"/>
                <input type="text" name="search_String" value="" size="100"/>
                <input type="submit" name="search_button" value="Поиск" />
                <select name="search_option">
                    <option>Название</option>
                    <option>Автор</option>
                </select>
            </form>
        </div>

        <div class="sidebar1">
            <h4>Список авторов:</h4>
            <ul class="nav">
                <% AuthorList authorList = new AuthorList();
                    for (Author author : authorList.getAuthorList()) {
                %>
                <li><a href="#"><%=author.getName()%></a></li>
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
