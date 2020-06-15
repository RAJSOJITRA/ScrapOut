<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index_Navigation</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@1,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Dosis:wght@500&family=Merriweather:ital,wght@1,900&display=swap" rel="stylesheet">
<script src="/credential/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
 
 /*local file style  */
*{
margin :0px;
font-family: 'Dosis', sans-serif;
font-family: 'Merriweather', serif;
}

.dropdown:hover .dropdown-menu{
	display:block;
}




/*       Desktop view      */
@media only screen and (min-width:800px){

  #mobile_nav{
      display:none;
  }
}



</style>
<script>
function fetch_Address() {

	var SavedAddress = new XMLHttpRequest();
	SavedAddress.open("GET", "/displayAddress", false);
	SavedAddress.send();
	document.getElementById("display_address").innerHTML = SavedAddress.responseText;
}
</script>
</head>
<body>
  
  				<!-- Navigation-Bar For Desktop  -->
  				
 <div class='container-fluid-100' id="desktop_nav">
  <nav  class="navbar navbar-expand-lg navbar-light bg-light">
  		 <a class="navbar-brand ml-0"  href="#"><img src="/credential/images/Original.jpg" alt="logo" style="width:13%;;border:1px solid black"> <b style="font-size:140%;font-family: 'Merriweather', serif;">SCAPOUT JunkMart</b></a>
  <button class="navbar-toggler ml-auto" type="button"  data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
   <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse mr-auto" id="navbarTogglerDemo01">
   
   
  
    <ul class="navbar-nav mr-auto text-center">
      <li class="nav-item p-1">
        <a class="nav-link text-capitalize" href="/requestPickUp">Request pickup Now</a>
      </li>
	 <li class="nav-item dropdown p-1">
        <a class="nav-link dropdown-toggle padding_a" href="#" id="navbardrop" data-toggle="dropdown">
          Order
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item text-capitalize" href="/pastorder">past order</a>
          <a class="dropdown-item text-capitalize" href="#">recent order</a>
          <a class="dropdown-item text-capitalize" href="#">your cart</a>
        </div>
      </li>
       <li class="nav-item p-1">
        <a class="nav-link text-capitalize" href="#">Rate card</a>
      </li>
       <li class="nav-item p-1">
        <a class="nav-link text-capitalize" href="#">Contact Us</a>
      </li>
 	  <li class="nav-item p-1">
        <a class="nav-link" href="#"  >Help</a>
      </li>
     
	</ul>	
      <button class='ml-auto'>
      		 <a class="nav-link text-capitalize text-dark" href="/login" >Login</a>	
      </button>
  </div>
</nav>
</div>


		
  
</body>
</html>