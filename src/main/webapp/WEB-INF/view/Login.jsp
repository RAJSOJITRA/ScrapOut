<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/credential/css/form.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="/credential/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="/credential/js/icon.js"></script>

<style>
@media only screen and (max-width: 480px) {

	.container-fluid{
		width:100%;
	}
	.middle{
		margin-left:0px;
	}
}
</style>
</head>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<body>
  <div class="container-fluid" >

  <div  class="set_form">



      <div class="row">
		  ${SPRING_SECURITY_LAST_EXCEPTION.message}
          <div class="col-xs-12 col-sm-12 col-md-4 well well-sm form-design">
              <legend style="color:#3B5998"><i class='far fa-question-circle' style='font-size:24px;color:#3B5998'></i><b>Login!</b></legend>
              <hr>
              <form action="login" method="post">
              <input class="form-control" name="username" placeholder="Your Username/Email-Id" type="text" id="username" required/>

              <input class="form-control" name="password" placeholder="New Password" id="password" type="password" required/>


                <br />
              <br />
              <button class="btn btn-lg btn-primary btn-block" style="background:#3B5998"type="submit" id="submit_button">
                  Login</button>

              </form>
              <p><a href="#"><b>Forgot Password</b></a></p>
              <p align="center">If Not Member<a href="/" style="text-decoration:none">Sign Up</a></p>
          </div>

      </div>

  </div>

  </body>
</html>
