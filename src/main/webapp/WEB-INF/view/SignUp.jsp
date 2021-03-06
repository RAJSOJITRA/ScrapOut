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
<script src="icon.js"></script>

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

<script>
var counter_as_check_condition=0;
var counter_as_check_password=0;
function conformation(){
  var password=document.getElementById("password");
  var conform_password=document.getElementById("cpassword");
  var password_condition=document.getElementById("password_condition");
  var password_not_match=document.getElementById("password_not_match");
  var button=document.getElementById("submit_button");
  var StringFormate=/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
  var numberFormate=/[0-9]/;

  //check the new password
  if((password.value.length) >=8 && password.value.match(StringFormate) && password.value.match(numberFormate)){

          counter_as_check_condition=1;
          password_condition.style.display="none";
  }
  else{
        counter_as_check_condition=0;
        password_condition.style.display="";
  }
  //check the conform password match with new password
  if(conform_password.value == password.value){
      counter_as_check_password=1;
      password_not_match.style.display="none";
  }
  else{
     counter_as_check_password=0;
     password_not_match.style.display="";
  }
  //final condition for enable the submit button
  if(counter_as_check_password==1 && counter_as_check_condition==1){
    button.disabled =false;

  }
  else{
    button.disabled = true;
  }

}

  </script>
</head>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<body>
  <div class="container-fluid">

  <div  class="set_form">



      <div class="row">

          <div class="col-xs-12 col-sm-12 col-md-4 well well-sm form-design">
              <legend style="color:#3B5998"><i class='far fa-question-circle' style='font-size:24px;color:#3B5998'></i><b>Sign up!</b></legend>
              <hr>
              <f:form action="/SignUpInsert" method="post" modelAttribute="SignUpVO">
              <div class="row">
                  <div class="col-xs-6 col-md-6">
                      <input class="form-control" name="firstName" placeholder="First Name" type="text"  id="first" required/>
                  </div>
                  <div class="col-xs-6 col-md-6">
                      <input class="form-control" name="lastName" placeholder="Last Name" type="text" id="last" required/>
                  </div>
              </div>
              <input class="form-control" name="lid.userName" placeholder="Your Username" type="text" id="username" />
              <input class="form-control" name="emailId" placeholder="Your Email" type="email" id="email" required />
              <input class="form-control" name="mobileNO" placeholder="Your Mobile-No" type="text"id="mobile" required />
              <input class="form-control" name="lid.password" placeholder="New Password" id="password" type="password" onkeyup="conformation()" required/>
                <span id="password_condition" style="display:none;color:red">Password must have 8 charecter ,one symbol and Digit</span>
              <input class="form-control" name="confirmPassword" placeholder="Re-enter Password" id="cpassword" type="password" onkeyup="conformation()" required/>
                <span id="password_not_match" style="display:none;color:red">Password Not Match</span>


                <br />
              <br />
              <button class="btn btn-lg btn-primary btn-block" style="background:#3B5998"type="submit" id="submit_button" disabled>
                  Sign up</button>
                  <br/>

              <p align="center">Already Have Member??<a href="Login.html" style="text-decoration:none">Sign in</a></p>
             </f:form>
          </div>

      </div>

  </div>

  </body>
</html>
