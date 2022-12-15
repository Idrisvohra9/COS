<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="jakarta.servlet.*,jakarta.servlet.http.*,java.io.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Todo List</title>
    <!-- CSS Import -->
    <link rel="stylesheet" href="main.css" />
    <!-- End of CSS Import -->
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@0,400;0,700;0,900;1,400&family=Montserrat:ital,wght@0,400;0,700;0,900;1,400&display=swap"
        rel="stylesheet">
    <!-- End of Fonts -->
</head>

<body>
    <!-- App Wrapper -->
    <main class="app">
        <!-- Greeting -->
        <section class="greeting">
            <h2 class="title">
        		<% String Username = (String)session.getAttribute("Username"); %>
          		What's up, <div id="name"> <%= Username  %></div>
        	</h2>
        </section>
        <!-- End of Greeting -->

        <!-- New Todo -->
        <section class="create-todo">
            <h3>CREATE A TODO</h3>
            <form id="new-todo-form">
                <h4>What's on your todo list?</h4>
                <input type="text" placeholder="e.g. Practice Some Codes" name="content" id="content" />

                <h4>Pick a category</h4>
                <div class="options">
                    <label>
                        <input type="radio" name="category" id="category1" value="business" />
                        <span class="bubble business"></span>
                        <div>Business</div>
                    </label>
                    <label>
                        <input type="radio" name="category" id="category2" value="personal" />
                        <span class="bubble personal"></span>
                        <div>Personal</div>
                    </label>
                </div>

                <input type="submit" value="Add todo" />
            </form>
        </section>
        <!-- End of New Todo -->

        <!-- Todo List -->
        <section class="todo-list">
            <h3>TODO LIST</h3>
            <div class="list" id="todo-list"></div>
        </section>
        <!-- End of Todo List -->

    </main>
    <!-- End of App Wrapper -->

    <!-- JS Import -->
    <script src="main.js"></script>
    <!-- End of JS Import -->
</body>

</html>