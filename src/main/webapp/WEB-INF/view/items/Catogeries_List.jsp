<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
@media only screen and (max-width: 480px){
	

		
}
</style>
<script>
var selectedItems="";
function selection_check_box(){

		var items=document.getElementsByName('junk_name');
		
		for(var i=0; i<items.length; i++){
			if(items[i].type=='checkbox' && items[i].checked==true)
				selectedItems=selectedItems+","+items[i].value;
		}
		alert(selectedItems);
	}	

function display_item(){
	
	var http = new XMLHttpRequest();
	alert(selectedItems);
}


</script>


</head>

<body >

<%@taglib prefix="p" uri="http://java.sun.com/jstl/core_rt" %>

<div class="container" style='heigth:auto'>
<!-- <table class="table">	 -->
<!-- 	<tr><th>Selection</th><th>Junk Name</th><th>Price/kg</th><th>Amount Of Kg</th></tr> -->
<button align='center'class="btn btn-lg bg-primary text-light" onclick="selection_check_box()">Save Junk Item</button>

<div class='row'>
	<p:forEach items="${categoriesList}" var="i">	
<!-- 		<div class="form-check"> -->
  		
<!--   		<tr><label class="form-check-label"> -->
<%--     	<td align="center"><input type="checkbox" style='transform:scale(2);margin:20px;' class="form-check-input bg-dark" name="junk_name" value="${i.id}" onchange="display_input_box()">  --%>
<!--     	</td> -->
<%--     	<td>${i.categories_name}</td> --%>
    	
<%--   				<td><p>${i.categories_price}/kg</p></td> --%>
<%--   				<td><input type="hidden" name="${i.id}" id="${i.id}" placeholder="Enter Kg"></td> --%>
<!--   			 </label></tr> -->
		
		
		
		
<!-- 		</div> -->
	
		
	
	
 <div class='col-sm-3'>	
   <div class="card" style='margin:4px'>
    <input type="checkbox" style='transform:scale(2);margin:20px;' class="form-check-input bg-dark" name="junk_name" value="${i.id}" onchange="display_input_box()">
    <div class="card-body">
     
      
      <h4 class="card-title" align='center'> ${i.categories_name}</h4>
      	
      	       	 <img class="card-img-top" src="/ScrapOut/src/main/resources/static/credential/images/Original.jpg" alt="Card image" style="width:100%">
 
      <h4 class="card-text text-danger" >${i.categories_price}/kg<input type='hidden' id="${i.id}+price" value='${i.categories_price}'></h4>
  		<p class='card-text'><input type="hidden" class='form-control'name="${i.id}" id="${i.id}" placeholder="Enter Kg"></p>
    </div>
 </div>
 </div>
 	
 	 
	
 	
	</p:forEach>	
	</div>
	
</div>
<!-- </table> -->


</body>
</html>