<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PickUpAddress</title>
<link href="/credential/css/form.css" rel="stylesheet">
<script src="/credential/js/cities.js"></script>
<script>
function submited(){
	var username= document.getElementById("username");
	
}
</script>
<style>
@media only screen and(max-width:480px){
	.set_form{
	
		margin-left:0px;
		width:100%;
	}

}
</style>
</head>
<body>
<%@taglib prefix="p" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@include file="../Dashboard/index_Nav.jsp"  %>
	
<%-- <p:set value="${addressPickUpList}" var="i"></p:set>
 --%>	    <div class="container-fluid-100" >

  <div  class="set_form">

	

      <div class="row" >

          <div class="col-sm-8 col-md-4 well well-sm form-design">
              <legend style="color:#3B5998"><i class='far fa-question-circle' style='font-size:24px;color:#3B5998'></i><b>Login!</b></legend>
              <hr>
              
               <f:form action="/insert_address"  method="post" class="form" role="form" modelAttribute="AddressVO">
               <f:input class="form-control" type="hidden" path="id"/>
               <f:input class="form-control" path="streetName" placeholder="House No,Floor,Street Name*" type="text" id="username" required="required"/>
                  <f:input class="form-control" path="pincode" placeholder="PinCode*"  type="text" required="required"/>
                  <f:input class="form-control" path="locality" placeholder="Locality"  type="text" />
                  <f:input class="form-control" path="landmark" placeholder="Landmark*"  type="text" required="required"/>
                  <f:select onchange="print_city('state', this.selectedIndex);" id="sts"   path="state" class="form-control" required="required"> 
                  	<option value="${city}" selected ></f:select>
				 <f:select id ="state" path="city" class="form-control" required="required">
				 	<option value="${state}" selected></f:select>
				 <script language="javascript">print_state("sts");</script>	
                <br />
              <br />
              <button class="btn btn-lg btn-primary btn-block" style="background:#3B5998"type="submit" id="submit_button">
                  Save Address</button> <br>

              </f:form>
          </div>

      </div>

  </div>
</div>
 <div>
 	
 	
 </div>
    
	
	
</body>
</html>