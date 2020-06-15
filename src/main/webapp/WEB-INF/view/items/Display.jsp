<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Jstl tag -->
	<%@taglib prefix="p" uri="http://java.sun.com/jstl/core_rt"%>
	<div class="container">
		<table class="table">
			<p:set value="${total_price}" var="j"></p:set>
			<tr>
				<th>Junk Name</th>
				<th>Price</th>
				<th>Amout of Kg</th>
				<th>Total</th>
			</tr>
			<p:forEach items="${display_string}" var="i">
		${i}
	</p:forEach>
			<tr>
				<td colspan="3"><b>Grand Total:</b></td>
				<td><b><p:out value="${j}"></p:out></b></td>
			</tr>
		</table>
	</div>
</body>
</html>