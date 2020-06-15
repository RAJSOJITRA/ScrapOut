<html>
<head>
<meta name="viewport" content="width=device-width , initial-scale=1.0">
<link href="/credential/css/form.css" rel="stylesheet">
<link href="/credential/css/progress-wizard.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="/credential/js/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	
<script src="/credential/js/icon.js"></script>
<style>
.form {
	width: 150%;
	margin-left: 25%;
}

@media only screen and (max-width: 480px) {
	.form {
		width: 97%;
		margin-left: 0px;
	}
}
</style>
<script>

function removeLink(a){

    switch(a){
      case 0:   //form 1
              step2.style.display="none";
              step1.style.display="";
              information.classList.remove("completed");
        break;

      case 1:   //form-1
          step3.style.display="none";
          step2.style.display="";
          action.classList.remove("completed");

        break;
      case 2:



         break;


    }

}
function activeLink(b){

  switch(b){
    case 0:
            alert(b);
      break;
    case 1:    //form 2


            information.classList.add("completed");
            step2.style.display="";
            step1.style.display="none";

      break;
    case 2:   //form 3
          step2.style.display="none";
          step3.style.display="";
          action.classList.add("completed");
      break;


  }
}
	//fetch selected address
	var address_stored="";
	var address_id= "";
	function displayRadioValue() { 
            var ele = document.getElementsByName('Address_Radio'); 
              
            for(i = 0; i < ele.length; i++) { 
                if(ele[i].checked) 
              {
                	address_stored=ele[i].value;
                	address_id = ele[i].id;
                	//alert(address_id);
              }
                		
                  	
            } 
        } 

	//fetch junk item
	 var j=0;
	 var count=0;
	 var bundle_of_id=new Array(); 
	 var selectedItems=new Array();	
	 //var seitems=null;
	 //var array=null;
	 function selection_check_box(){
				 
			var items=document.getElementsByName('junk_name');
			
			
			for(var i=0; i<items.length; i++){
				if(items[i].type=='checkbox' && items[i].checked==true)
					{
					selectedItems[j]=items[i].value;				
					if(document.getElementById(items[i].value).value  != ""){
					   
						bundle_of_id[j]=document.getElementById(items[i].value).value;
						//alert(bundle_of_id[j]);
							j++;
					}
						
					}
			}
			
			if(selectedItems.length ==  bundle_of_id.length && selectedItems.length != 0){
				var SavedAddress = new XMLHttpRequest();
				//convert array to string selectedItems
				/* for(var c=0;c<selectedItems.length;c++)
				{
					seitems.concat(selectedItems[i]);
					if(!(selectedItems.length-1))
					{
						seitems.concat("&seitems=");
					}
				}
				//convert array to string bundle_of_id
				for(var c=0;c<bundle_of_id.length;c++)
				{
					array+=bundle_of_id[i];
					if(!(bundle_of_id.length-1))
					{
						array+="&array=";
					}
				}
				window.alert(seitems);
				window.alert(array); */
				//window.alert(selectedItems);
				//window.alert(bundle_of_id);
		 		SavedAddress.open("GET","/displayitems?seitems="+selectedItems+"&array="+bundle_of_id+"",false);
		 		SavedAddress.send();
		 		document.getElementById("display_cat1").innerHTML=SavedAddress.responseText;
		 		count=1;
		 		step2_next.disabled=false;
		 		j=0;
		 		document.getElementById("display_cat").style.display="none";
		 		document.getElementById("Browse_Item").style.display="none";
		 		document.getElementById("Edit_Browse_Item").style.display="";
		 		
			}
			else{
				alert("Please filld all required field");
				count=0;
				j=0;
			}
			
		}	
	 
	//alert
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
	

	function fetch_Address() {

		var SavedAddress = new XMLHttpRequest();
		SavedAddress.open("GET", "/displayAddress", false);
		SavedAddress.send();
		document.getElementById("display_address").innerHTML = SavedAddress.responseText;
	}
	function fetch_categories() {
		var SavedAddress = new XMLHttpRequest();
		SavedAddress.open("GET", "/Categories_List", false);
		SavedAddress.send();
		document.getElementById("display_cat").innerHTML = SavedAddress.responseText;
	}
	
	//fetch all information for fetch data
	function submit() {
		
		var SavedAddress = new XMLHttpRequest();
		SavedAddress.open("GET", "/OrderConfirm?seitems="+selectedItems+"&array="+bundle_of_id+"&address="+address_id+"", false);
		SavedAddress.send();
		window.location.href = "/";
	}
	function fetch_Allinformation() {

		var text_field = document.getElementById("address_field");
		alert("Your Info have fetched");
		text_field.value = address_stored;
		var SavedAddress = new XMLHttpRequest();
		SavedAddress.open("GET", "/displayitems?seitems="+selectedItems+"&array="+bundle_of_id+"", false);
		//SavedAddress.open("GET", "/AllDisplay", false);
		SavedAddress.send();
		document.getElementById("final_cart").innerHTML = SavedAddress.responseText;
		userInfo();

	}
	
	//fetching user name and mobile number
	function userInfo() {
		    $.ajax({
		    	url: "/AllDisplay",	    
		    	success: function(response){
		    		//console.log(response+":::"+response[0]);
		    		$("#userName").val(response[0].lid.userName);
		    		$("#moNo").val(response[0].mobileNO);
		    	},
		    	error: function(response){
		    		
		    	}
		    });
	}
	/* Validation of form   */

	// validation step 1
	function step1_form() {
		if (address_stored != null) {
			step1_next.disabled = false;
		}
	}
	function step2_form() {
		if (count == 1) {
			step2_next.disabled = false;
		}
	}

	//display selected junk item
	function display_selected_junk() {
		document.getElementById("Edit_Browse_Item").style.display = "none";
		document.getElementById("display_cat").style.display = "";

	}
</script>
<%@taglib prefix="p" uri="http://java.sun.com/jstl/core_rt" %>


<body onload="fetch_Address()">

<%@include file="../Dashboard/index_Nav.jsp" %>

  <ul class="progress-indicator"  class='container' id="mydiv" >
             <li class="completed" id="address" >
                 <span class="bubble" style="color:black;">1</span>
                 Step 1. <br><small>Address</small>
             </li>
             <li class="form-style " id="information">
                 <span class="bubble"></span>
                 Step 2. <br><small>Weight Information</small>
             </li>
             <li class="form-style" id="action">
                 <span class="bubble"></span>
                 Step 3. <br><small>Show Information</small>
             </li>


         </ul>

 


<div class='container-fluid'>
<!--  First step -->
<div class="container">
 
 	  	<div   align='center' class='container form-design' id="step1" >
         

  	        
  	              <legend style="color:#3B5998;text-align:center"><b>Address</b></legend>
  	              <hr>
  	             
						<!-- Here Show Existing Address -->
  	             		
  	             	<div id="display_address" >
					
							<center><button class="btn btn-lg" ><a href="PickUpAddress.jsp" class="text-dark">Add Address</a></button></center>
					</div>
  	             		<!-- completed Display -->	
  	             
  	             <br>
  	            <div class="row">
  	            	 <div class="col-xs-2 col-sm-2 col-md-1" ></div>
  	            	  <div class="col-xs-2 col-sm-2 col-md-4">

  	                </div>
  	               <div class="col-xs-2 col-sm-2 col-md-2 "></div>
  	               <div class="col-xs-2 col-sm-2 col-md-4 ">
  	            	     <button  type="button" id="step1_next" class="btn btn-block text-light" style="background:#3B5998" onclick="step1_form();activeLink(1)" formtarget="_blank" disabled>Next</button>
  	               </div>
  	               <div class="col-xs-2 col-sm-2 col-md-2"></div>
  	              <div class="col-xs-2 col-sm-2 col-md-2"></div>
               </div>
  	            	  <br>
               </div>
  		 </div>
     
<!-- Second Form -->
 <div class='container'>
    <div  class='container form-design'  id="step2" style="display:none">
          

                  <legend style="color:#3B5998;text-align:center"><b>Select Your Junk</b></legend>
                  <hr>
			
					<center><div id="Browse_Item"><b>Select Categories</b><button class="btn btn-lg"  onclick="fetch_categories()" data-toggle="modal" data-target="#myModal">Browse Item</button></div></center>		                                    
                   
                   <!-- selected item -->
                   <div id="display_cat1">
                   </div>
                    
                    <center><div id="Edit_Browse_Item" style="display:none"><b>Select Categories</b><button class="btn btn-lg"  onclick="display_selected_junk()">Edit Item</button></div></center>		                                    
                   	
                   	<!-- Display Categories-->
                   <div id="display_cat" >
                   		
                   	</div>
                   <br>
                   
                <div class="row">
                   <div class="col-xs-2 col-sm-2 col-md-1" ></div>
                    <div class="col-xs-2 col-sm-2 col-md-4">
                        <button class="btn btn-block bg-dark text-light" onclick="removeLink(0)">Previous</button>
                    </div>
                   <div class="col-xs-2 col-sm-2 col-md-2 "></div>
                   <div class="col-xs-2 col-sm-2 col-md-4 ">
                        <button class="btn btn-block text-light" id="step2_next" onclick="activeLink(2);fetch_Allinformation();"style="background:#3B5998" disabled>Next</button>
                   </div>
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                  <div class="col-xs-2 col-sm-2 col-md-2"></div>
               </div>
                    <br>
        </div>
 </div>      	
                   
    
    <!-- third form -->
  <div class='container'>  
    <div   class='container form-design'id="step3" style="display:none;">
      
        
		
       
              <legend style="color:#3B5998;text-align:center"><b>Your Request</b></legend>
              <hr>
			<!--USER DETAIL CART Address -->
		
			<input class="form-control" name="username" id='userName' placeholder="Username" class="bg-light" value="" type="text" readonly/>
              <input class="form-control" name="mno" placeholder="Mobile No"  id='moNo' type="text"  value="" readonly/>
              <h3 class="text-dark"><b>Address</b></h3>
              <textarea id="address_field"  class="form-control" readonly></textarea>
              <h3 class="text-dark"><b>Your Requested Junk Item</b></h3>
              <div id="final_cart">
              
              
              </div>
              
             
              <br>
               <br>
            <div class="row">
               <div class="col-xs-2 col-sm-2 col-md-1" ></div>
                <div class="col-xs-2 col-sm-2 col-md-4">
                    <button class="btn btn-block bg-dark text-light" onclick="removeLink(1)">Previous</button>
                </div>
               <div class="col-xs-2 col-sm-2 col-md-2 "></div>
               <div class="col-xs-2 col-sm-2 col-md-4 ">
                    <input type="submit" class="btn btn-block text-light" style="background:#3B5998" onclick="submit()"value="submit">
               </div>
               <div class="col-xs-2 col-sm-2 col-md-2"></div>
              <div class="col-xs-2 col-sm-2 col-md-2"></div>
           </div>
                <br>
            </div>
 </div>  
    <!--  Database : Column name: username id/ categeries_name id / selected_weigth / status / Agent name--> 





</div>

	</body>

</html>
