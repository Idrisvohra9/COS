<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@page import="jakarta.servlet.*,jakarta.servlet.http.*,java.io.*, java.util.*"%>
<!DOCTYPE html>

<html lang="en-IN">
  <head>
    <title></title>
    <meta charset="utf-8" />

    <meta name="viewport" content="width=device-width" />
    <style>
      ::-webkit-scrollbar {
        display: none;
      }
      :root {
        --primary: #ea40a4;
        --business: #3a82ee;
        --personal: var(--primary);
        --light: #374151;
        --grey: #888;
        --dark: #eee;
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
        font-family: "montserrat", sans-serif;
      }

      body {
        background: var(--light);
        color: var(--dark);
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

      section {
        margin-top: 2rem;
        margin-bottom: 2rem;
        padding-left: 1.5rem;
        padding-right: 1.5rem;
      }

      .greeting .title {
        color: var(--dark);
        font-size: 1.5rem;
        font-weight: 700;
      }

      .greeting .title {
        display: flex;
      }

      .daily-report {
        margin-top: 50px;
      }

      .container {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        padding: 20px;
      }

      .container .card1 {
        background-color: rgb(188, 187, 187);
        width: 350px;
        height: 350px;
        position: absolute;
        left: 68px;
        border-radius: 40px;
        box-shadow: 0 0 10px black;
        padding: 60px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      .container .card2 {
        background-color: rgb(188, 187, 187);
        width: 350px;
        height: 350px;
        position: absolute;
        right: 68px;
        border-radius: 40px;
        box-shadow: 0 0 10px black;
        padding: 60px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
      .container .card {
        background-color: rgb(218, 218, 218);
        width: 400px;
        height: 400px;
        border-radius: 40px;
        box-shadow: 0 0 10px black;
        padding: 60px;
        display: flex;
        z-index: 2;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
      .container h5 {
        color: grey;
        font-size: 1.2rem;
      }
      .container .timeSpent {
        color: darkslategrey;
        font-size: 1.2rem;
        margin: auto;
      }
      #main {
		margin-top: -20px;
        display: flex;
		position: absolute;
		border-radius: 40px 40px 0 0;
		overflow: hidden;
      }

      #main div {
        width: 70px;
        height: 70px;
      }

      #myGreenDIV {
        animation: mymove 5s infinite;
      }

      @keyframes mymove {
        50% {
          order: 6;
        }
      }
    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@0,400;0,700;0,900;1,400&family=Montserrat:ital,wght@0,400;0,700;0,900;1,400&display=swap"
      rel="stylesheet"
    />
  </head>

  <body>
    <section class="greeting">
    <% String Username = (String)session.getAttribute("Username"); %>
      <h3 class="title">Hello, <%= Username %></h3>
    </section>
    <!-- ScreenTime Calculation -->
    <% 
    String LoginTime = (String)session.getAttribute("loginTime");
    String[] tArr = LoginTime.split(":");
    /* Login time variables */
    int LHr = Integer.parseInt(tArr[0]);
    int LMin = Integer.parseInt(tArr[1]);
    int LSec = Integer.parseInt(tArr[2]);
    
    /* Current Time variables */
    Date d = new Date();
    int CHr = d.getHours();
    int CMin = d.getMinutes();
    int CSec = d.getSeconds();
    
    /* Total Time Variables */
    int THr = CHr - LHr;
    int TMin = CMin - LMin;
    int TSec = CSec - LSec;
    %>
    <section class="daily-report">
      <h3 class="title">Check your daily report:</h3>
      <div class="container">
        <div class="card1">
          <h5>Previous Report</h5>
          <div class="timeSpent">0hh : 0mm</div>
        </div>
        <div class="card">
          <h5>Total Time spent today</h5>
          <div class="timeSpent"><%= String.format("%dhh : %dmm : %dss",THr,TMin,TSec) %></div>
        </div>
        <div class="card2">
          <h5>Maximise productivity</h5>
          <div class="timeSpent">Set Habits/Custom Goals with ScreenTime!!</div>
        </div>
      </div>
    </section>
    <div class="container">
      <div id="main">
        <div
          style="background-color: lightgreen; order: 1"
          id="myGreenDIV"
        ></div>
        <div style="background-color: coral; order: 2"></div>
        <div style="background-color: lightblue; order: 3"></div>
        <div style="background-color: pink; order: 4"></div>
      </div>
    </div>
  </body>
</html>
