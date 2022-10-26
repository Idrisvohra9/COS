<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@page import="jakarta.servlet.*,jakarta.servlet.http.*,java.io.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Todo List</title>
    <!-- CSS Import -->
    <style>
    /* Variables */
:root {
	--primary: #EA40A4;
	--business: #3a82ee;
	--personal: var(--primary);
	--light: #374151;
	--grey: #888;
	--dark: #EEE;
	--danger: #ff5b57;

	--shadow: 0 1px 3px rgba(0, 0, 0, 0.1);

	--business-glow: 0px 0px 4px rgba(58, 130, 238, 0.75);
	--personal-glow: 0px 0px 4px rgba(234, 64, 164, 0.75);
}
/* End of Variables */

/* Resets */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'montserrat', sans-serif;
}

input:not([type="radio"]):not([type="checkbox"]), button {
	appearance: none;
	border: none;
	outline: none;
	background: none;
	cursor: initial;
}
/* End of Resets */

body {
	background: var(--light);
	color: var(--dark);
}
::-webkit-scrollbar{
	display:none;
}
section {
	margin-top: 2rem;
	margin-bottom: 2rem;
	padding-left: 1.5rem;
	padding-right: 1.5rem;
}

h3 {
	color: var(--dark);
	font-size: 1rem;
	font-weight: 400;
	margin-bottom: 0.5rem;
}

h4 {
	color: var(--grey);
	font-size: 0.875rem;
	font-weight: 700;
	margin-bottom: 0.5rem;
}

.greeting .title {
	display: flex;
}


.greeting .title{
	color: var(--dark);
	font-size: 1.5rem;
	font-weight: 700;
}

.create-todo input[type="text"] {
	display: block;
	width: 100%;
	font-size: 1.125rem;
	padding: 1rem 1.5rem;
	color: var(--dark);
	background-color: #1F2937;
	border-radius: 0.5rem;
	box-shadow: var(--shadow);
	margin-bottom: 1.5rem;
}

.create-todo .options {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 1rem;
	margin-bottom: 1.5rem;
}

.create-todo .options label {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color: #1F2937;
	padding: 1.5rem;
	box-shadow: var(--shadow);
	border-radius: 0.5rem;
	cursor: pointer;
}

input[type="radio"],
input[type="checkbox"] {
	display: none;
}

.bubble {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 20px;
	height: 20px;
	border-radius: 999px;
	border: 2px solid var(--business);
	box-shadow: var(--business-glow);
}

.bubble.personal {
	border-color: var(--personal);
	box-shadow: var(--personal-glow);
}

.bubble::after {
	content: '';
	display: block;
	opacity: 0;
	width: 0px;
	height: 0px;
	background-color: var(--business);
	box-shadow: var(--business-glow);
	border-radius: 999px;
	transition: 0.2s ease-in-out;
}

.bubble.personal::after {
	background-color: var(--personal);
	box-shadow: var(--personal-glow);
}

input:checked ~ .bubble::after {
	width: 10px;
	height: 10px;
	opacity: 1;
}

.create-todo .options label div {
	color: var(--dark);
	font-size: 1.125rem;
	margin-top: 1rem;
}

.create-todo input[type="submit"] {
	display: block;
	width: 100%;
	font-size: 1.125rem;
	padding: 1rem 1.5rem;
	color: #FFF;
	font-weight: 700;
	text-transform: uppercase;
	background-color: var(--primary);
	box-shadow: var(--personal-glow);
	border-radius: 0.5rem;
	cursor: pointer;
	transition: 0.2s ease-out;
}

.create-todo input[type="submit"]:hover {
	opacity: 0.75;
}

.todo-list .list {
	margin: 1rem 0;
}

.todo-list .todo-item {
	display: flex;
	align-items: center;
	background-color: #1F2937;
	padding: 1rem;
	border-radius: 0.5rem;
	box-shadow: var(--shadow);
	margin-bottom: 1rem;
}

.todo-item label {
	display: block;
	margin-right: 1rem;
	cursor: pointer;
}

.todo-item .todo-content {
	flex: 1 1 0%;
}

.todo-item .todo-content input {
	color: var(--dark);
	font-size: 1.125rem;
}

.todo-item .actions {
	display: flex;
	align-items: center;
}

.todo-item .actions button {
	display: block;
	padding: 0.5rem;
	border-radius: 0.25rem;
	color: #FFF;
	cursor: pointer;
	transition: 0.2s ease-in-out;
}

.todo-item .actions button:hover {
	opacity: 0.75;
}

.todo-item .actions .edit {
	margin-right: 0.5rem;
	background-color: var(--primary);
}

.todo-item .actions .delete {
	background-color: var(--danger);
}

.todo-item.done .todo-content input {
	text-decoration: line-through;
	color: var(--grey);
}
    </style>
    <!-- End of CSS Import -->
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@0,400;0,700;0,900;1,400&family=Montserrat:ital,wght@0,400;0,700;0,900;1,400&display=swap"
      rel="stylesheet"
    />
    <!-- End of Fonts -->
  </head>

  <body>
    <!-- App Wrapper -->
    <main class="app">
      <!-- Greeting -->
      <section class="greeting">
        <h2 class="title">
        <% String Username = (String)session.getAttribute("Username"); %>
          What's up, <%= Username  %>
        </h2>
      </section>
      <!-- End of Greeting -->

      <!-- New Todo -->
      <section class="create-todo">
        <h3>CREATE A TODO</h3>
        <form id="new-todo-form">
          <h4>What's on your todo list?</h4>
          <input
            type="text"
            placeholder="e.g. Practice Some Codes"
            name="content"
            id="content"
          />

          <h4>Pick a category</h4>
          <div class="options">
            <label>
              <input
                type="radio"
                name="category"
                id="category1"
                value="business"
              />
              <span class="bubble business"></span>
              <div>Business</div>
            </label>
            <label>
              <input
                type="radio"
                name="category"
                id="category2"
                value="personal"
              />
              <span class="bubble personal"></span>
              <div>Personal</div>
            </label>
          </div>

          <input type="submit" value="Add todo" />
        </form>
      </section>
      <!-- End of New Todo -->

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
