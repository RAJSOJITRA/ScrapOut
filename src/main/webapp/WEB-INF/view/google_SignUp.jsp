<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/credential/css/form.css" rel="stylesheet">
<style>
@media only screen and (max-width: 480px) {

	.container-fluid{
		width:100%;
	}
	.set_form{
		width:100%;
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
<body>
<!-- Heading  -->
<div>
	<%@include file="Dashboard/index_Nav.jsp" %>
</div>
<br>
<br>
	<!-- Sign Up PAGE -->
	<div class="container-fluid">

  <div  class="set_form">



      <div class="row">

          <div class="col-xs-12 col-sm-12 col-md-4 well well-sm form-design">
              <legend style="color:#3B5998"><i class='far fa-question-circle' style='font-size:24px;color:#3B5998'></i><b>Sign up with Google !</b></legend>
              <hr>
              <form action="#" method="post" class="form" role="form">
              
              <input class="form-control" name="username" placeholder="Your Username" type="text" id="username" />
              <input class="form-control" name="mobile-no" placeholder="Your Mobile-No" type="text"id="mobile" required />
              <input class="form-control" name="password" placeholder="New Password" id="password" type="password" onkeyup="conformation()" required/>
               	<span id="password_condition" style="display:none;color:red">Password must have 8 charecter ,one symbol and Digit</span>
              <input class="form-control" name="cpassword" placeholder="Re-enter Password" id="cpassword" type="password" onkeyup="conformation()" required/>
               	<span id="password_not_match" style="display:none;color:red">Password Not Match</span>


                <br />
              <br />
              <button class="btn btn-lg btn-primary btn-block" style="background:#3B5998"type="submit" id="submit_button" disabled>
                  Sign up</button>
                  <br/>

              
              </form>
          </div>

      </div>

  </div>
	
	
	
	
		<!-- footer -->	

<div>
	<%@include file="Dashboard/footer.jsp" %>
</div> 
	
	
	
	
	
</body>
</html>