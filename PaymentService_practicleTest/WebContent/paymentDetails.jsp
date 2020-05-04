<%@page import="com.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="/Header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Service</title>
<link rel="stylesheet" href="views/bootstrap.min.css.css">
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/payment.js"></script>
</head>
<body style="background-color:#B0C4DE;">
<div style="text-align: center;position:relative;left:250px;top:50px;" class="container">
		<div class="row">
			<div class="col-6">
				<h1>Payments</h1><br>
				<div style="text-align: center;position:relative;right:25px;" id="divItemsGrid">
					<%
						Payment paymentObj = new Payment();
					out.print(paymentObj.readPayment());
					%>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="/Footer.jsp" %> 
</html>