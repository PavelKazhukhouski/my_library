<%@ page import="java.util.ArrayList"%>
<%@ page import="com.my_library.beans.Book"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <% include file="../jspf/left_menu.jspf" %>

    <%request.setCharacterEncoding("UTF-8");

        long genderId = 0L;

        try {
                genreId = Long.valueOf(request.getParameter("genre_id"));
            } catch (Exception ex) {
                ex.printStackTrace();
            }
    %>

    <jsp:useBean id="bookList" class="com.my_library.beans.BookList" scope="page"/>

    <div class="book_list">
        <h3>${param.name}</h3>

        <%
            ArrayList<Book> list = bookList.getBooksByGenre(genreId);
            session.setAttribute("currentBookList", list);
            for (Book book : list) {
        %>

    <div class="book_info">
       <div class="book_title">
         <p><%book.getName()%></p>
         </div>
         <div class="book+image">
           <img src="<%=book.getImageURL() %>" height="250" width="190" alt="Обложка"/>
         </div>
         <div class="book_details">
         <br><strong>ISBN:</strong><%=book.getIsbn()%>
         <br><strong>Publisher:</strong><%=book.getPublisher() %>
         <br><strong>Page count:</strong><%=book.getPageCount() %>
         <br><strong>Количество стараниц:</strong><%=book.getPublishDate() %>
         <br><strong>Author</strong><%=book.getAuthor() %>
         <p style="margin:10px;"> <a href="#">Читать</a><p>
       </div>
    </div>

