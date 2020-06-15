<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PickUpAddress</title>
<link href="/credential/css/form.css" rel="stylesheet">
<script src="/credential/js/cities.js"></script>	
<style>

</style>
</head>
<body>	

<select onchange="print_city('state', this.selectedIndex);" id="sts" name ="stt" class="form-control" required></select>
<select id ="state" class="form-control" required></select>
<script language="javascript">print_state("sts");</script>	
	
</body>
</html>