<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>COS Registeration</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
      :root {
      	--yellow: goldenrod;
      	--dark: #11171a;
      }

      ::-webkit-scrollbar {
      	display: none;
      }

      .third {
      	box-shadow: -10px 10px 10px black;
      	background: #fff;
      	border-radius: 20px;
      }

      display-flex, .display-flex, .display-flex-center, .third {
      	display: flex;
      }

      a:focus, a:active {
      	text-decoration: none;
      	outline: none;
      	transition: all 300ms ease 0s;
      }

      figure {
      	margin: 0;
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

      .clear {
      	clear: both;
      }

      body {
      	font-size: 13px;
      	line-height: 1.8;
      	color: #222;
      	background: rgb(21, 21, 21);
      	font-weight: 400;
      	font-family: Arial, Helvetica, sans-serif;
      }

      .second {
      	width: 900px;
      	margin: 0 auto;
      	/* box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05); */
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

      .first {
      	margin: 65px;
      }

      .third {
      	padding: 75px 0;
      }

      .title {
      	margin-bottom: 33px;
      }

      .logo img {
      	width: 220px;
      	height: 200px;
      	border-radius: 40px;
      	background-color: rgb(21, 21, 21);
      	margin-left: 90px;
      	margin-top: 90px;
      	padding-bottom: 10px;
      	filter: drop-shadow(0 0 12px goldenrod);
      }

      .reg {
      	display: inline-block;
      	background: #6dabe4;
      	color: #fff;
      	border-bottom: none;
      	width: auto;
      	padding: 15px 30px;
      	border-radius: 5px;
      	margin-top: 5px;
      	cursor: pointer;
      }

      .reg.disabled {
      	background-color: rgba(53, 53, 53, 0.435);
      }

      .reg.disabled:hover {
      	background-color: rgba(53, 53, 53, 0.435);
      }

      .reg:hover {
      	background: #4292dc;
      }

      .link {
      	font-size: 14px;
      	color: blue;
      	text-align: center;
      }

      .new {
      	font-size: 14px;
      	color: #222;
      	display: block;
      	text-align: center;
      	margin-left: 90px;
      }

      .term-service {
      	font-size: 13px;
      	color: blue;
      }

      .form {
      	margin-left: 75px;
      	margin-right: 75px;
      	padding-left: 34px;
      	z-index: 2;
      }

      .register {
      	width: 100%;
      }

      .group {
      	position: relative;
      	display: flex;
      	margin-bottom: 45px;
      }

      .group .pass {
      	width: 20px;
      	height: 20px;
      	cursor: pointer;
      	opacity: 0.5;
      	position: absolute;
      	right: 0;
      	top: 50%;
      	transform: translateY(-50%);
      }

      input[type="text"], input[type="password"], input[type="email"], input[type="submit"]
      	{
      	width: 100%;
      	display: block;
      	cursor: text;
      	outline: none;
      	border: none;
      	border-bottom: 1px solid #999;
      	padding: 6px 30px;
      	font-family: Arial, Helvetica, sans-serif;
      	box-sizing: border-box;
      }

      input:focus {
      	border-bottom: 1px solid #222;
      }

      label {
      	position: absolute;
      	left: 0;
      	top: 50%;
      	transform: translateY(-50%);
      }

      .label-accept {
      	position: relative;
      	top: 0%;
      	transform: translateY(0);
      }

      .valid-feedback {
      	position: absolute;
      	left: 10px;
      	top: 35px;
      	color: maroon;
      	line-height: 10px;
      }

      .passStrength {
      	position: absolute;
      	left: 10px;
      	top: 45px;
      	width: 100%;
      }

      .passStrength .progress {
      	height: 5px;
      	flex-direction: column;
      }

      .passStrength .progress-bar {
      	height: 5px;
      	width: 0%;
      }

      .passStrength::before {
      	content: "Strength: ";
      	font-size: 10px;
      	color: black;
      	display: inline;
      	margin-right: 5px;
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
      	.third {
      		flex-direction: column;
      		justify-content: center;
      	}
      	.form {
      		margin-left: 0px;
      		margin-right: 0px;
      		padding-left: 0px;
      		/* box-sizing: border-box; */
      		padding: 0 30px;
      	}
      	.form, .logo {
      		width: auto;
      	}
      	.form-button {
      		text-align: center;
      	}
      	.title {
      		text-align: center;
      	}
      }
    </style>
  </head>

  <body>
    <section class="first">
      <div class="second">
        <div class="third">
          <div class="form">
            <h2 class="title">Register</h2>
            <p
              style="margin-top: -40px; margin-bottom: 15px; font-weight: bold"
            >
              Make COS your's truly.
            </p>
            <form class="register was-validated" id="register" method="post">
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
                  required
                  maxlength="15"
                />
                <div class="valid-feedback">
                  Username must be atleast 3 characters and under 15 characters.
                  Should not contain any symbols other than hyphens and
                  underscores.
                </div>
              </div>
              <div class="group">
                <label for="email"
                  ><i
                    ><img
                      src="Icons/email-svgrepo-com.svg"
                      height="20"
                      width="20" /></i
                ></label>
                <input
                  type="email"
                  name="email"
                  id="email"
                  placeholder="Your Email"
                  required
                />
              </div>
              <div class="group">
                <label for="pass"
                  ><i
                    ><img
                      src="Icons/password-svgrepo-com.svg"
                      height="20"
                      width="20" /></i
                ></label>
                <input
                  type="password"
                  name="pass"
                  id="pass"
                  placeholder="Password"
                  required
                  maxlength="6"
                  onkeyup="checkMatch();passStrength();"
                />
                <div class="valid-feedback">
                  Password must be 6 digits long and complex.
                </div>
                <div class="passStrength">
                  <div class="progress">
                    <div class="progress-bar"></div>
                  </div>
                </div>
                <img
                  src="Icons/visibility-svgrepo-com.svg"
                  alt=""
                  class="pass"
                  onclick="Unhide(this);"
                />
              </div>
              <div class="group">
                <label for="re-pass"
                  ><i
                    ><img
                      src="Icons/password-svgrepo-com.svg"
                      height="20"
                      width="20" /></i
                ></label>
                <input
                  type="password"
                  name="re_pass"
                  id="re_pass"
                  placeholder="Repeat your password"
                  required
                  maxlength="6"
                  onkeyup="checkMatch();"
                />
                <img
                  src="Icons/visibility-svgrepo-com.svg"
                  alt=""
                  class="pass"
                  onclick="Unhide(this);"
                />
              </div>
              <div class="group form-check">
                <input
                  type="checkbox"
                  name="accept"
                  id="accept"
                  class="form-check-input text-bg-dark"
                  style="margin-right: 10px"
                />
                <label for="accept" class="label-accept">
                  I agree all statements in
                  <a href="#" class="term-service">Terms of service</a></label
                >
                <div class="invalid-feedback">
                  Check this checkbox to continue.
                </div>
              </div>
              <p class="text-danger" id="pass_validation"></p>
              <div class="btn">
                <input type="submit" class="reg disabled" value="Register" />
              </div>
              <!-- If every thing is proper it will add the information to the database -->
            </form>
          </div>
          <div class="logo">
            <figure>
              <img src="Icons/JS_logo_transparent.png" alt="logo image" />
            </figure>
            <p class="new">
              Already Using COS? <a href="Login.jsp" class="link">Log in</a>
            </p>
          </div>
        </div>
      </div>
    </section>
    <script>
      n = 0;
      function Unhide(param) {
        if (n == 0) {
          param.style.opacity = "1";
          param.parentElement.children[1].setAttribute("type", "text");
          n = 1;
        } else {
          param.style.opacity = "0.5";
          param.parentElement.children[1].setAttribute("type", "password");
          n = 0;
        }
      }

      function checkMatch() {
        let pass = document.getElementById("pass").value;
        let retype = document.getElementById("re_pass").value;
        let passValid = document.getElementById("pass_validation");
        if (pass != retype) {
          passValid.innerText = "Password does not match.";
          btn[0].className = btn[0].className += " disabled";
        } else {
          passValid.innerText = "";
        }
      }

      let input = document.querySelectorAll(
        "input[type=text], input[type=password]"
      );
      let btn = document.getElementsByClassName("reg");
      for (let i = 0; i < input.length; i++) {
        input[i].addEventListener("keyup", function () {
          if (input[i].value != "") {
            btn[0].className = btn[0].className.replace(" disabled", "");
          } else {
            btn[0].className = btn[0].className += " disabled";
          }
        });
      }

      function passStrength() {
        let pass = document.getElementById("pass").value;
        let strength = 0;
        var numbers = /[0-9]/g;
        var upperCaseLetters = /[A-Z]/g;
        var lowerCaseLetters = /[a-z]/g;
        if (pass.length > 3) {
          strength += 20;
        }
        if (pass.match(numbers)) {
          strength += 20;
        }
        if (pass.match(upperCaseLetters)) {
          strength += 20;
        }
        if (pass.match(lowerCaseLetters)) {
          strength += 20;
        }
        if (pass.length == 6) {
          strength += 20;
        }
        if (pass == "") {
          strength = 0;
        }
        ChangeProgressBar(strength);
      }

      function ChangeProgressBar(s) {
        let pb = document.getElementsByClassName("progress-bar")[0];
        switch (s) {
          case 20:
            pb.style.width = s + "%";
            pb.style.backgroundColor = "lightblue";
            break;
          case 40:
            pb.style.width = s + "%";
            pb.style.backgroundColor = "blue";
            break;
          case 60:
            pb.style.width = s + "%";
            pb.style.backgroundColor = "yellow";
            break;
          case 80:
            pb.style.width = s + "%";
            pb.style.backgroundColor = "gold";
            break;
          case 100:
            pb.style.width = s + "%";
            pb.style.backgroundColor = "goldenrod";
            break;
        }
      }
    </script>
  </body>
</html>
