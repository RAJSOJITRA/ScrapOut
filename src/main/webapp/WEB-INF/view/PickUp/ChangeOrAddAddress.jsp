<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<%@include file="../Dashboard/index_Nav.jsp" %>
<%@taglib prefix="p" uri="http://java.sun.com/jstl/core_rt" %>
<div class="container-fluid-100">
<div class="col-sm-10">
  	      <center> <button class="btn text-light" style="background:#3B5998" ><a href="/address">Add Address</button></center>
  	 </div>
</div>
  	 <hr>
<div class="container-fluid-100">
<p:forEach items="${addressList}" var="i">
 
 <div class="container">
 
 <textarea class="form-cantrol" rows="5" cols="50" id="comment" readonly>	${i.getId() } ,	${i.getStreetName()} , ${i.getLocality()} ,${i.getLandmark()} ,${i.getPincode()}, ${i.getCity()} , ${i.getState()} 
 </textarea > <button class="btn text-light"><a href="/editAddress?id=${i.id}" class="text-dark">Edit </a></button>
 <div class="col-sm-4">
  	      
  	 </div>
 </div>
 <hr>
</p:forEach>
</div>		
 

</body>
</html>