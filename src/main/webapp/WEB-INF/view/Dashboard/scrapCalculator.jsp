<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
 #grand_total{
	float: right;
    margin-top: 23%;
    margin-right: 33%;
 }
	
@media only screen and (max-width: 520px){
	
	.container{
	 width:100%;
	 
	}
	#display_cat{
		width:100%;
	}
	.card{
	
		width:100%;
	}
	 #grand_total{
	
    margin-top:23%;
    margin-right: 0%; 
    color:red;
 }
		
}
</style>
<script>

	function FindList(){
		
		var http = new XMLHttpRequest();
		var SavedAddress = new XMLHttpRequest();
		SavedAddress.open("GET","/Categories_List",false);
		SavedAddress.send();
		document.getElementById("display_cat").innerHTML=SavedAddress.responseText;
	}
	
//display for enter amoung of kg input field	
	function display_input_box(){
		
		var items=document.getElementsByName('junk_name');
		
		for(var i=0; i<items.length; i++){
			if(items[i].type=='checkbox' && items[i].checked==true){
				
			
				document.getElementById(items[i].value).type='text';
			 	
			}
			else{
				document.getElementById(items[i].value).type='hidden';
			}
		}

	}
	
	//display grand total
var j=0;
var Items= [];
 var selectedItems = new Array();
 var bundle_of_id = new Array();
 var priceTag = new Array();
 var junkArray =[];
 function selection_check_box(){
			 
		var items=document.getElementsByName('junk_name');
		
		
		for(var i=0; i<items.length; i++){
			if(items[i].type=='checkbox' && items[i].checked==true)
				{
								
				if(document.getElementById(items[i].value).value  != ""){
					selectedItems[j]=items[i].value;   
					priceTag[j]=document.getElementById(items[i].value+'+price').value;
					console.log('Price Tag',priceTag[j]);
					bundle_of_id[j]=document.getElementById(items[i].value).value;
					alert(selectedItems[j]+''+bundle_of_id[j]);
					var tempItems = 
					 {
						 id:selectedItems[j],
						 price : priceTag[j],
						 amount: bundle_of_id[j] 
					 };
					 
					junkArray.push(tempItems);
					console.log('Found Item:', junkArray);	
						j++;
				}
					
				}
			console.log('Length oF ARRAY',junkArray.length);
		}
		
		if(selectedItems.length ==  bundle_of_id.length && selectedItems.length != 0){
				var total=0;
			
				
				for ( var k =0 ; k < junkArray.length ; k++){
					
// 					console.log(junkArray[k].price);
					total +=(junkArray[k].price * junkArray[k].amount);
// 					console.log(total);
				}
				alert(total);
				document.getElementById('total_div').style.display="";
				document.getElementById('grand_total').innerText = total +".Rs";
				
				j=0;
	 			
	 		
		}
		else{
			alert("Please filld all required field");
		
			j=0;
		}
		
	}
</script>
</head>
<body onload='FindList()'>

<%@include file="index_Nav.jsp" %>
<div class='container-fluid'>


<div class='container' id='total_div' style='display:none'>
	
	<h1>Your Grand Total</h1>
	<img src='/credential/images/Calculator.jpg' style="width:50%"/>
	
	<h1  id='grand_total'></h1>
</div>

<div class='container' >
<h1 align='center'>Your Junk Item</h1>
	<div id='display_cat'>

	
	</div>

	

</div>

</div>
<div style='clear:left'>
<%@include file="footer.jsp" %>
</div>
</body>
</html>