<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-IN">
  <head>
    <title>COS Browser</title>
    <meta charset="utf-8" />

    <!-- Bootstrap responsive CSS Stuff -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <meta name="viewport" content="width=device-width" />
    <style>
      body {
        background-color: rgb(21, 21, 21);
      }
      * {
        box-sizing: border-box;
      }
      .sticker {
        width: 330px;
        height: 160px;
        filter: drop-shadow(0 0 5px grey);
      }
      .searchBar {
        background-color: rgb(25, 27, 34);
        border: 1px solid grey;
        border-right: none;
        padding: 10px;
        float: left;
        font-size: 20px;
        font-family: arial;
        width: 80%;
        color: aliceblue;
        border-radius: 20px 0 0 20px;
      }
      .searchBtn {
        background-color: rgb(125, 200, 225);
        border: 1px solid grey;
        padding: 8px;
        border-left: none;
        line-height: 34px;
        float: right;
        width: 20%;
        border-radius: 0 20px 20px 0;
      }

      .searchBtn:hover {
        cursor: pointer;
        background-color: rgb(78, 185, 221);
      }
      .container {
        padding: 0;
        display: flex;
        width: 40%;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        border-radius: 20px;
        outline: 1px solid white;
        box-shadow: 5px 5px 10px black;
      }
      .l img {
        width: 40px;
        height: 40px;
      }
      span{
        color: white;
        text-decoration: none;
      }
      .l {
        width: 65px;
        height: 65px;
        padding:8px;
        border-radius: 10px;
        filter: drop-shadow(0);
        box-shadow: none;
        margin-left: 20px;
        margin-right: 20px;
        background-color: rgba(192, 192, 192, 0.6);
        display:flex;
        flex-direction: column;
        text-align: center;
        justify-content: center;
        align-items: center;
        font-size:14px;
        color: white;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <div
      class="container-fluid d-flex justify-content-sm-around align-items-center flex-column"
    >
      <img src="Images/OS_sticker 4k.png" alt="" class="m-lg-5 rounded-4 sticker" />

      <form class="container" action="COS_Browser.jsp">
        <input
          type="text"
          class="searchBar"
          placeholder="Search..."
          name="SearchInput"
        />
        <input type="button" value="⇥ " class="searchBtn" onclick="Search();"/>
      </form>
      <span class="mt-3 alert text-success"> External Links: </span>
      <div
        class="ExternalLinks mt-1 p-3 d-flex flex-col justify-content-lg-around"
      >
        <a href="https:\\www.youtube.com" target="_blank" class="l">
          <img src="Images/youtube-svgrepo-com.svg" alt="" />
          <span>YouTube</span>
        </a>
        <a href="https:\\www.gmail.com" target="_blank" class="l">
          <img src="Images/gmail-svgrepo-com.svg" alt="" />
          <span>Gmail</span>
        </a>
        <a href="http:\\www.themellowcoder.com" target="_blank" class="l">
          <img src="Images/octopus-svgrepo-com (1).svg" alt="" />
          <span>TMC</span>
        </a>
        <a href="http:\\www.drive.google.com" target="_blank" class="l">
          <img src="Images/google-drive-social-media-svgrepo-com.svg" alt="" />
          <span>Drive</span>
        </a>
      </div>
    </div>
    <script>
    function Search(){
    	const Search = document.getElementsByClassName("searchBar")[0].value;
    	location.assign("https://www.google.com/search?q="+Search)
    }
    </script>
  </body>
</html>
