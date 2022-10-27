<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="jakarta.servlet.*,jakarta.servlet.http.*,java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        *
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'poppins',sans-serif;
        }
        body
        {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background:#23242a;
            background-image: url("Wallpapers/JS_login_background.jpg");
            background-size: cover;
        }
        .box
        {
            position: relative;
            width: 380px;
            top: 80px;
            height:365px;
            background: #1c1c1c;
            border-radius: 8px;
            overflow: hidden;
        }
        .box::before
        {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 380px;
            height: 420px;
            background: linear-gradient(0deg,transparent,goldenrod,#fee800);  /*gold theme :- #ffd700 */
            transform-origin: bottom right;
            animation: animate 6s linear infinite;
        }        
        .box::after
        {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 380px;
            height: 420px;
            background: linear-gradient(0deg,transparent,#fee800,goldenrod);
            transform-origin: bottom right;
            animation: animate 6s linear infinite;
            animation-delay: -3s;
        }
        @keyframes animate 
        {
            0%
            {
                transform: rotate(0deg);
            }    
            100%
            {
                transform: rotate(360deg);
            }
        }
        .form 
        {
            /* opacity:1; */
            position: absolute;
            inset: 2px;
            border-radius: 8px;
            height:360px;
            background: #161515;
            z-index: 10;
            padding: 30px;
            display: flex;
            flex-direction: column;
        }
        .form h2
        {
            color: #fee800;
            font-weight: 500;
            text-align: center;
            letter-spacing: 0.1em;
        }
        .inputBox
        {
            position: relative;
            width: 300px;
            margin-top: 35px;
        }
        .inputBox input
        {
            position: relative;
            width: 100%;
            padding: 20px 10px 10px;
            background: transparent;
            border: none;
            outline: none;
            color: #23242a;
            font-size: 1em;
            letter-spacing: 0.05em;
            z-index: 10;
        }
        .inputBox span
        {
            position: absolute;
            left: 0;
            padding: 20px 0px 10px;
            font-size: 1em;
            color: #8f8f8f;
            pointer-events: none;
            letter-spacing: 0.05em;
            transition: 0.5s;
        }
        .inputBox input:valid ~ span,
        .inputBox input:focus ~ span
        {
            color: #fee800;
            transform: translateX(0px) translateY(-34px);
            font-size: 0.75em;
        }
        .inputBox i
        {
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 2px;
            background: #fee800;
            border-radius: 4px;
            transition: 0.5s;
            pointer-events: none;
            z-index: 9;
        }
        .inputBox input:valid ~ i,
        .inputBox input:focus ~ i
        {
            height: 44px;
        }
        .links
        {
            display: flex;
            justify-content: space-between;
        }
        .links a
        {
            margin: 10px 0;
            font-size: 0.75em;
            color: #8f8f8f;
            text-decoration: none;
        }
        .links a:hover,
        .links a:nth-child(2)
        {
            color: #fee800;
        }
        
        .login
        {
        	text-decoration:none;
        	color:#23242a;
            border: none;
            outline: none;
            background: #fee800;
            padding: 10px;
            width: 100px;
            margin-top: 10px;
            border-radius: 4px;
            font-weight: 600;
            cursor: pointer;
        }
        
        .login:active
        {
            opacity: 0.8;
        }
        
        .datetime{
            position: absolute;
            bottom: 20px;
            /* top: 120px; */
            right: 20px;
            font-weight: bold;
            font-size:22px;
            background: -webkit-linear-gradient(gold, orange);
            -webkit-background-clip: text;
            background-clip:text;
            -webkit-text-fill-color: transparent;
        }

        .power{
            width: 75px;
            height: 75px;
            position: absolute;
            top: 10px;
            right: 10px;
            border-radius: 50px;
            filter: drop-shadow(0 0 5px goldenrod);
            padding:0;
        }
        .link{
        	color:gold;
        	display:flex;
        	justify-content:center;
            margin-top:10px;
            font-size:14px;
        }
    </style>
</head>
<body>
    <a href="ShutDown.html">
        <img src="Icons/power-button-gold.svg" alt="" class="power">
    </a>
    <div class="datetime">
        <div id="time" style="text-align: center;font-size: 36px;"></div>
        <div id="date" style="text-align: center;"></div>
    </div>
    <div class="box">
    <form method="post">
        <div class="form">
            <div class="inputBox">
                <input type="text" name="name" required>
                <span>Username</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="password" name="pass" required maxlength="6">
                <span>Password</span>
                <i></i>
            </div>
            <div class="links">
                <a href="#">Forgot password</a>
            </div>
            <input type="submit" value="Enter" class="login">
            <a href="NewUser.jsp" class="link">Create a new account?</a>
        </div>
    </form>
    <% 
    	java.util.Date d = new java.util.Date();
    	String Uname = request.getParameter("name");
    	String Pass = request.getParameter("pass");
    	session.setAttribute("Username",Uname);
    	session.setAttribute("loginTime", String.format("%d:%d:%d",d.getHours(),d.getMinutes(),d.getSeconds()));
    	int id = 0;
    	if((Uname!= null && Uname.length() >= 3) && (Pass!=null && Pass.length() == 6)){
            try{
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/COS_DB", "root", "idrisvohra987");
        		
        		PreparedStatement smt = c.prepareStatement("SELECT USERNAME, PASS FROM EXISTINGUSER;");
        		ResultSet rs = smt.executeQuery();
        		int Exists =0;
        		while (rs.next()) {
        			String USERNAME = rs.getString("USERNAME");
        			String PASSWORD = rs.getString("PASS");
        			if(Uname.equals(USERNAME) && Pass.equals(PASSWORD)){
        				Exists = 1;
        			}
        		}
        		if(Exists == 1){
        		/* Get the id of the current user */
	        		PreparedStatement smt2 = c.prepareStatement("SELECT id FROM EXISTINGUSER WHERE USERNAME = '"+Uname+"'");
	        		ResultSet rs2 = smt2.executeQuery();
	        		while(rs2.next()){
		        		id = rs2.getInt("id");        			
	        		}
	        		session.setAttribute("ID", id);
        			RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
					rd.forward(request,response);
        		}
        		
        		else {
        			out.print("<h5>The entered user information does'nt exist! consider making a new account.</h5>");
        		}
            } catch(ClassNotFoundException | SQLException e) {
        		out.print("Server Side error occured: "+e.toString());
        	}
          }
    	
    %>
    </div>
    <script>
        setInterval(()=>{
            
        let n = new Date();
        let y = n.getFullYear();

        let m = n.getMonth() + 1;

        let d = n.getDate();

        let h = n.getHours();
        let mm = n.getMinutes();

        let date = d + '-' + m + '-' + y;
        
        h = h < 10 ? "0" + h : h;
        mm = mm < 10 ? "0" + mm : mm;
        
        let time = h +":"+ mm;
        document.getElementById("time").innerHTML = time;
        document.getElementById("date").innerHTML = date;
        });
        
        
    </script>
</body>
</html>