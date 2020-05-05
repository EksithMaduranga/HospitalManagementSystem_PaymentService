$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 $("#divItemsGrid").hide();
 }
 $("#alertError").hide();
});

// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}

	// If valid------------------------
	var type = ($("#hidIDSave").val() == "") ? "POST" : "PUT";
	$.ajax({
		url : "CardAPI",
		type : type,
		data : $("#formItem").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});

});

function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
			$("#divItemsGrid").show();
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidIDSave").val("");
	$("#formItem")[0].reset();
}

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) {
			$("#hidIDSave").val( $(this).closest("tr").find('#hidIDUpdate').val());
			$("#cardNo").val($(this).closest("tr").find('td:eq(0)').text());
			$("#holderName").val($(this).closest("tr").find('td:eq(2)').text());
			$("#expiryDate").val($(this).closest("tr").find('td:eq(3)').text());
			$("#cvv").val($(this).closest("tr").find('td:eq(4)').text());
			$("#paymentNo").val($(this).closest("tr").find('td:eq(1)').text());
		});

// Delete============================================
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "CardAPI",
		type : "DELETE",
		data : "id=" + $(this).data("itemid"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});

function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}


//CLIENTMODEL=========================================================================
function validateItemForm()
{
//paymentType
if ($("#cardNo").val().trim() == "")
 {
 return "Insert Card No.";
 }
//appointmentId
if ($("#holderName").val().trim() == "")
 {
 return "Insert Cardholder Name.";
 } 
//patientId-------------------------------
if ($("#expiryDate").val().trim() == "")
 {
 return "Insert Expiry Date.";
 }
//cvv-------------------------------
if ($("#cvv").val().trim() == "")
 {
 return "Insert CVV No.";
 }
//paymentNo-------------------------------
if ($("#paymentNo").val().trim() == "")
 {
 return "Insert Payment No.";
 }
//check card no size
if ($("#cardNo").val().length != 16)
{
return "Enter a valid card number of 16 digits.";
}
//check cvv size
if ($("#cvv").val().length != 3)
{
return "Enter a valid cvv of 3 digits.";
}
// is numerical value
var tmpCNo = $("#cardNo").val().trim();
if (!$.isNumeric(tmpCNo))
 {
 return "Insert a numerical value for Card No.";
 }
var tmpCvv = $("#cvv").val().trim();
if (!$.isNumeric(tmpCvv))
 {
 return "Insert a numerical value for CVV No.";
 }
var tmpPNo = $("#paymentNo").val().trim();
if (!$.isNumeric(tmpPNo))
 {
 return "Insert a numerical value for Payment No.";
 }
// convert to integer ID
 $("#cvv").val(parseInt(tmpCvv).toFixed(0));
 $("#paymentNo").val(parseInt(tmpPNo).toFixed(0));

return true;
}
