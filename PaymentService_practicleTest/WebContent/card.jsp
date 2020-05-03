<%@page import="com.Card"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Service</title>
<link rel="stylesheet" href="views/bootstrap.min.css.css">
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/card.js"></script>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Card Details</h1>
				<form id="formItem" name="formItem">
					Card No: 
					<input id="cardNo" name="cardNo" type="text"class="form-control form-control-sm"> <br>
					Card Holder Name:
					<input id="holderName" name="holderName" type="text" class="form-control form-control-sm"> <br> 
					Expiry Date:
					 <input id="expiryDate" name="expiryDate" type="text" class="form-control form-control-sm"> <br>
					 CVV:
					 <input id="cvv" name="cvv" type="text" class="form-control form-control-sm"> <br>
					 Payment No:
					 <input id="paymentNo" name="paymentNo" type="text" class="form-control form-control-sm"> <br> 
					 
					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					 <input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
				
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemsGrid">
					<%
					Card paymentObj = new Card();
					out.print(paymentObj.readCard());
					%>
				</div>

			</div>
		</div>
	</div>

</body>
</html>