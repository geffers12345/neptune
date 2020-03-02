<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Seabase._Default" %>

<!DOCTYPE html>

<style>
body {
   background-image: url("content/img/BN-LN780_cma_M_20151203035735.jpg");
   background-repeat: no-repeat;
   font-family: Century Gothic;
   background-size: 100%;
 }
.login {
  width: 400px;
  margin: 16px auto;
  font-size: 16px;
}

/* Reset top and bottom margins from certain elements */
.login-header,
.login p {
  margin-top: 0;
  margin-bottom: 0;
}


.login-header {
  margin-top: 30%;
  background: #0e0d0d;
  padding: 20px;
  font-size: 1.4em;
  font-weight: normal;
  text-align: center;
  color: #fff;
}

.login-container {
  /*background: #ebebeb75;*/
  background: #fdfdfd75;
  padding: 12px;
}

/* Every row inside .login-container is defined with p tags */
.login p {
  padding: 12px;
}

.login input, #btnLogin, #btnCancel {
  box-sizing: border-box;
  display: block;
  width: 100%;
  border-width: 1px;
  border-style: solid;
  padding: 16px;
  outline: 0;
  font-family: inherit;
  font-size: 0.95em;
}

.login input[type="email"],
.login input[type="password"] {
  background: #fff;
  border-color: #bbb;
  color: #555;
}

/* Text fields' focus effect */
.login input[type="email"]:focus,
.login input[type="password"]:focus {
  border-color: #888;
}

#btnLogin {
  background: #0b0b0b;
  border-color: transparent;
  color: #fff;
  cursor: pointer;
}

#btnLogin:hover {
	border-color:#fff;	
}

/* Buttons' focus effect */
#btnLogin:focus {
  background: transparent;
  border-color: #fff;
  border-style: solid;
  border-width: 1px;
  color:#fff;
}

#passToggle {
    position: absolute;
    margin-top: -5.6%;
    padding-top: 15px;
    height: 9%;
    border-color: #28292b;
    background-color: #403075;
    border-radius: 0;
    padding-right: 26px;
    color: #fff;
    border-left: 1px solid #4e4f51;
    font-size: 20px;
    margin-left: 23.1%;
}

.brand-name {
    color: #f8b21a;
    font-size: 1.5em;
}

.brand-name b {
    color: #818381;
}

.text-info {
    font-weight: 400 !important;
    color: #121313 !important;
}

.text-danger {
    font-weight: 300 !important;
    color: #e70e0a !important;
    font-size: 15px;
}

#errorBag {
    color: red;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link rel="icon" href="Content/img/yellowhub.png" sizes="32x32"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"/>
<link href="Content/css/animate.min.css" rel="stylesheet" />
<link href="Content/css/sweetalert2.min.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
</head>
<body>
    <div class="col-md-12">
        <div class="login">
            <div class="login-triangle"></div>
            <div class="login-header">
                <span class="brand-name" style="display: inline;">e<b>Recruit</b> | Sea Base</span>
            </div>
            <form class="login-container">
            <div class="group">
				<label class="text-danger" id="lockMessage">
                                    
				</label>
			</div>
            <p>
                <input type="text" placeholder="Email Address" id="email" data-name="Email Address" />
                <label id="errorEmail" class="text-danger" style="display: none;"></label>
            </p>
            <p>
                <input type="password" placeholder="Password" id="password" data-name="Password"/>
                <label id="errorPassword" class="text-danger" style="display: none;"></label>
            </p>
            <p>
                <button id="btnLogin" class="btn btn-info">Login</button>
            </p>
            </form>
        </div>
    </div>
</body>
</html>
<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="Scripts/helpers.js"></script>
<script src="Scripts/sweetalert2.min.js"></script>
<script src="Scripts/validator.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    var attempt = 0;

    $(document).ready(function () {
        function isInputValid() {
            var isEmailValid = $("#email").validate(['email']).displayErrorOn($("#errorEmail"));
            var isPasswordValid = $("#password").validate(['required']).displayErrorOn($("#errorPassword"));

            return isEmailValid && isPasswordValid;
        }

        $(document).on('click', '#btnLogin', function (e) {
            e.preventDefault();

            if (isInputValid()) {

                (new http).post('default.aspx/login', {
                    email: $('#email').val(),
                    password: $('#password').val()
                }).then(function (data) {
                    if (data.d == 1) {
                        var url = '/dashboard';
                        $(location).attr('href', url);
                    } else {
                        swal(
                          'Invalid Username or Password',
                          'Please Try Again',
                          'error'
                        )
                    }
                }).run();
            }
        });
    });
</script>