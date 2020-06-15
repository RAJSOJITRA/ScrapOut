<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@taglib prefix="p" uri="http://java.sun.com/jstl/core_rt" %>
<p:forEach items="${addressList}" var="i">
	
	<div>
	<input type="radio" class="form-cantrol" value="${i.getStreetName()},${i.getLocality()},${i.getLandmark()},${i.getPincode()},${i.getCity()},${i.getState()}" name="Address_Radio" id="Address,${i.id}" onclick="displayRadioValue();step1_form()">
	${i.getStreetName()},${i.getLocality()},${i.getLandmark()},${i.getPincode()},${i.getCity()},${i.getState()} 
	<br>
	</div>
	
	<br>
</p:forEach>
	<div class="col-sm-8">
  	       <button class="btn text-light" style="background:#3B5998" ><a href="/ChangeOrAdd">Change OR Add Address</button>
  	 </div>
	<br>
	
</body>
</html>