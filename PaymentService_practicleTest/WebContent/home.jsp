<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="/Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Service</title>
<link rel="stylesheet" href="views/bootstrap.min.css.css">
</head>
<body style="background-color:#B0C4DE;text-align: center;">
<br><br><br>
<a href="payment.jsp"><input type="button" value="Add Payment" class="btn btn-primary"></a><br><br>
<a href="card.jsp"><input type="button" value="Add Card" class="btn btn-primary"></a><br><br>
<a href="adminPayment.jsp"><input type="button" value="Manage Payment" class="btn btn-primary"></a><br><br>
<a href="adminCard.jsp"><input type="button" value="Manage Card" class="btn btn-primary"></a>
</body>
<%@include file="/Footer.jsp" %> 
</html>