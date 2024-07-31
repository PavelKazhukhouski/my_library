<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ru" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Онлайн библиотека::Вход</title>
    <link rel="stylesheet" href="css/style_index.css" type="text/css">
</head>
<body>
    <div class="container">
        <header class="header">
            <img src="images/lib.png" alt="Library Logo" class="logo">
            <h1 class="title">Online library</h1>
        </header>
        <main class="main-content">
            <section class="welcome">
                <p>Добро пожаловать в библиотеку, где вы сможете выбрать книги на любой вкус.</p>
                <p>Проект находится в разработке, поэтому дизайн и функционал постоянно будут дорабатываться.</p>
                <p>По всем вопросам обращаться 1284@mamail.com</p>
            </section>
            <section class="login">
                <h2>Для входа введите свои данные</h2>
                <form class="login-form" action="pages/main.jsp" method="POST">
                    <label for="username">Имя:</label>
                    <input type="text" id="username" name="username" required>
                    <button type="submit">Войти</button>
                </form>
            </section>
        </main>
        <footer class="footer">
            <p>Разраб Влера Мощный 2024г.</p>
        </footer>
    </div>
</body>
</html>
