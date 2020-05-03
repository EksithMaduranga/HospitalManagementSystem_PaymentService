<%@page import="com.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Service</title>
<link rel="stylesheet" href="views/bootstrap.min.css.css">
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/items.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Payment Details</h1>
				<form id="formItem" name="formItem">
					Payment Type: 
					<input id="paymentType" name="paymentType" type="text"class="form-control form-control-sm"> <br>
					Appointment ID:
					<input id="appointmentId" name="appointmentId" type="text" class="form-control form-control-sm"> <br> 
					Patient ID:
					 <input id="patientId" name="patientId" type="text" class="form-control form-control-sm"> <br> 
					 
					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					 <input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
				
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
					<%
						Payment paymentObj = new Payment();
					out.print(paymentObj.readPayment());
					%>
				</div>

			</div>
		</div>
	</div>

</body>
</html>