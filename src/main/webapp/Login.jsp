<%@page import="com.mysql.cj.xdevapi.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="jakarta.servlet.*,jakarta.servlet.http.*,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <title>Login</title>
    <style>
      :root {
        --yellow: #ffea00;
        --dark: #11171a;
      }

      ::-webkit-scrollbar {
        display: none;
      }

      display-flex,
      .display-flex,
      .display-flex-center,
      .signup-content,
      .third,
      .social-login,
      .socials {
        display: flex;
        display: -webkit-flex;
      }

      .third {
        box-shadow: -10px 10px 10px black;
        background: #fff;
        border-radius: 20px;
      }

      list-type-ulli,
      .socials {
        list-style-type: none;
        margin: 0;
        padding: 0;
      }

      a:focus,
      a:active {
        text-decoration: none;
        outline: none;
        transition: all 300ms ease 0s;
      }

      input,
      select,
      textarea {
        outline: none;
        appearance: unset !important;
      }

      input::-webkit-outer-spin-button,
      input::-webkit-inner-spin-button {
        appearance: none !important;
        margin: 0;
      }

      input:focus,
      select:focus,
      textarea:focus {
        outline: none;
        box-shadow: none !important;
      }

      input[type="checkbox"] {
        appearance: checkbox !important;
      }

      input[type="radio"] {
        appearance: radio !important;
      }

      p {
        margin-bottom: 0px;
        font-size: 15px;
        color: #777;
      }

      h2 {
        line-height: 1.66;
        margin: 0;
        padding: 0;
        font-weight: bold;
        color: #222;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 36px;
      }

      .main {
        background: #f8f8f8;
        padding: 150px 0;
      }

      .clear {
        clear: both;
      }

      body {
        font-size: 13px;
        line-height: 1.8;
        color: #222;
        background: rgb(21, 21, 21);
        font-weight: 400;
        font-family: Arial, Helvetica, sans-serifs;
      }

      .first {
        margin: 65px;
      }

      .second {
        width: 900px;
        background: #fff;
        margin: 0 auto;
        box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
        border-radius: 20px;
      }

      .display-flex {
        justify-content: space-between;
        align-items: center;
      }

      .display-flex-center {
        justify-content: center;
        align-items: center;
      }

      .position-center {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
      }

      .signup-content {
        padding: 75px 0;
      }

      .signup-form,
      .logo,
      .form {
        width: 50%;
        overflow: hidden;
      }

      .title {
        margin-bottom: 33px;
      }

      .logo img {
        width: 220px;
        height: 200px;
        border-radius: 40px;
        background-color: rgb(21, 21, 21);
        margin-left: 60px;
        margin-top: 80px;
        padding-bottom: 10px;
        filter: drop-shadow(0 0 12px goldenrod);
      }

      .logo {
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
      }

      figure {
        margin-bottom: 50px;
        text-align: center;
      }

      .subbtn {
        display: inline-block;
        background: #6dabe4;
        color: #fff;
        border-bottom: none;
        width: auto;
        padding: 15px 39px;
        border-radius: 5px;
        margin-top: 25px;
        cursor: pointer;
      }

      .subbtn:hover {
        background: #4292dc;
      }

      #signin {
        margin-top: 16px;
      }

      .link {
        font-size: 14px;
        color: #222;
        text-decoration: none;
        display: block;
        text-align: center;
      }

      .term-service {
        font-size: 13px;
        color: #222;
      }

      .signup-form {
        margin-left: 75px;
        margin-right: 75px;
        padding-left: 34px;
      }

      .register {
        width: 100%;
      }
      input {
        border: none;
        width: 100%;
      }
      .group {
        position: relative;
        display: flex;
        margin-bottom: 35px;
        display: block;
        border: none;
        border-bottom: 1px solid #999;
        padding: 6px 30px;
        font-family: Arial, Helvetica, sans-serifs;
        box-sizing: border-box;
      }

      .group:focus {
        border-bottom: 1px solid #222;
      }

      .accept {
        display: inline-block;
        width: auto;
      }

      label {
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        color: #222;
      }

      .label-has-error {
        top: 22%;
      }

      label.error {
        position: relative;
        background: url("../images/unchecked.gif") no-repeat;
        background-position-y: 3px;
        padding-left: 20px;
        display: block;
        margin-top: 20px;
      }

      label.valid {
        display: block;
        position: absolute;
        right: 0;
        left: auto;
        margin-top: -6px;
        width: 20px;
        height: 20px;
        background: transparent;
      }

      label.valid:after {
        font-family: "Times New Roman", sans-serif;
        content: "\f269";
        width: 100%;
        height: 100%;
        position: absolute;
        /* right: 0; */
        font-size: 16px;
        color: green;
      }

      .label-accept {
        position: relative;
        top: 0%;
        transform: translateY(0);
      }

      .third {
        padding-top: 67px;
        padding-bottom: 87px;
      }

      .social-login {
        align-items: center;
        margin-top: 80px;
      }

      .social-label {
        display: inline-block;
        margin-right: 15px;
      }

      .socials li {
        padding: 5px;
      }

      .socials li:last-child {
        margin-right: 0px;
      }

      .socials li a {
        text-decoration: none;
      }

      .socials li a i {
        width: 30px;
        height: 30px;
        color: #fff;
        font-size: 14px;
        border-radius: 5px;
        transform: translateZ(0);
        transition-duration: 0.3s;
        transition-property: transform;
        transition-timing-function: ease-out;
      }

      .socials li:hover a i {
        transform: scale(1.3) translateZ(0);
      }

      .facebook {
        background: #3b5998;
      }

      .twitter {
        background: #1da0f2;
      }

      .google {
        background: #e72734;
      }

      .form {
        margin-right: 90px;
        margin-left: 80px;
      }

      .valid-feedback {
        position: absolute;
        left: 0px;
        top: 135%;
        transform: translateY(-50%);
        color: maroon;
        line-height: 10px;
      }

      @media screen and (max-width: 1200px) {
        .second {
          width: calc(100% - 30px);
          max-width: 100%;
        }
      }

      @media screen and (min-width: 1024px) {
        .second {
          max-width: 1200px;
        }
      }

      @media screen and (max-width: 768px) {
        .signup-content,
        .third {
          flex-direction: column;
          justify-content: center;
        }
        .signup-form {
          margin-left: 0px;
          margin-right: 0px;
          padding-left: 0px;
          /* box-sizing: border-box; */
          padding: 0 30px;
        }
        .signup-form,
        .logo,
        .form {
          width: auto;
        }
        .social-login {
          justify-content: center;
        }
        .btn {
          text-align: center;
        }
        .form {
          order: 1;
          margin-right: 0px;
          margin-left: 0px;
          padding: 0 30px;
        }
        .title {
          text-align: center;
        }
      }

      @media screen and (max-width: 400px) {
        .social-login {
          flex-direction: column;
        }
        .social-label {
          margin-right: 0px;
          margin-bottom: 10px;
        }
      }
    </style>
  </head>

  <body>
    <section class="first">
      <div class="second">
        <div class="third">
          <div class="logo">
            <figure>
              <img src="Icons/JS_logo_transparent.png" alt="logo image" />
            </figure>
            <a href="NewUser.jsp" class="link">Create an account</a>
          </div>

          <div class="form">
            <h2 class="title">Log in</h2>
            <p
              style="margin-top: -40px; margin-bottom: 15px; font-weight: bold"
            >
              Welcome to yours truly:)
            </p>
            <form method="post" class="register was-validated" id="login-form">
              <div class="group">
                <label for="name"
                  ><i
                    ><img
                      src="Icons/user-svgrepo-com.svg"
                      height="20"
                      width="20" /></i
                ></label>
                <input
                  type="text"
                  name="name"
                  id="name"
                  placeholder="Your Name"
                  maxlength="15"
                  required
                />
                <div class="valid-feedback">
                  Username must be under 15 characters. Should not contain any
                  symbols other than hyphens and underscores.
                </div>
              </div>
              <div>
                <input
                  type="checkbox"
                  name="remember-me"
                  id="remember-me"
                  class="accept"
                />
                <label for="remember-me" class="label-accept">
                  Remember me</label
                >
              </div>
              <div class="btn">
                <input
                  type="submit"
                  class="subbtn"
                  value="Log in"
                />
              </div>
            </form>
            <%
            String Uname = request.getParameter("name");
            if(Uname!= null && Uname.length() >= 3){
	            try{
	        		Class.forName("com.mysql.cj.jdbc.Driver");
	        		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/COS_DB", "root", "idrisvohra987");
	        		
	        		PreparedStatement smt = c.prepareStatement("SELECT USERNAME FROM EXISTINGUSER;");
	        		ResultSet rs = smt.executeQuery();
	        		int Exists =-1;
	        		while (rs.next()) {
	        			String USERNAME = rs.getString("USERNAME");
	        			if(Uname.equals(USERNAME)){
	        				Exists = 1;
	        			}
	        		}
	        		if(Exists == 0){
	        			out.print("<h6 style='color:Red;'>THE ENTERED USERNAME DOES NOT EXIST CONSIDER MAKING A NEW ACCOUNT.</h6>");
	        		}
	        		else{
	        			RequestDispatcher rd = request.getRequestDispatcher("LockScreen.jsp");
						rd.forward(request,response);
	        		}
	            } catch(ClassNotFoundException | SQLException e) {
	        		out.print("Server Side error occured: "+e.toString());
	        		/* application.s */
	        	}
	          }
            %>
            <div class="social-login">
              <span class="social-label">Or login with</span>
              <ul class="socials">
                <li>
                  <a href=""
                    ><i class="display-flex-center facebook"
                      ><img
                        src="Icons/facebook.svg"
                        height="20"
                        width="20" /></i
                  ></a>
                </li>
                <li>
                  <a href=""
                    ><i class="display-flex-center twitter"
                      ><img src="Icons/twitter.svg" height="20" width="20" /></i
                  ></a>
                </li>
                <li>
                  <a href="https://accounts.google.com"
                    ><i class="display-flex-center google"
                      ><img src="Icons/google.svg" height="20" width="20" /></i
                  ></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
