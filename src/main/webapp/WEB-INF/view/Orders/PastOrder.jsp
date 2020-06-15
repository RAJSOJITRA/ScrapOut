<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="navigation">
<%@include file="../Dashboard/index_Nav.jsp" %>
</div>
<br>
<div class="container-fluid" >
		<div id="PastOrder">
			<div class="row">

				<div class="col-xs-12 col-sm-12 col-md-4 well well-sm form-design">
					<legend style="color: #3B5998; text-align: center">
						<b>Past Order</b>
					</legend>
					<hr>
					<textarea class="form-control" style="background: #F2F2F2" rows="4"
						class="textarea-tall" id="comment" readonly>
						
      				</textarea><br>
				</div>
			</div>
			<!--  Database : Column name: username id/ categeries_name id / selected_weigth / status / Agent name-->
		</div>
	</div>
</body>
</html>