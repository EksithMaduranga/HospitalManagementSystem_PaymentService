package com;

import java.sql.*;
import java.util.Calendar;
import com.Validate;
import database.dbconnect;

public class Payment {
	dbconnect object = new dbconnect();
	Validate valObj = new Validate();
	
	public String readPayment() {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for reading";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Payment No</th> <th>Payment Type</th><th>Amount</th>"
					+ "<th>Date</th><th>Appointment ID</th><th>Patient ID</th>" + "<th>Remove</th></tr>";

			String query = "select * from payment";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String paymentNo = Integer.toString(rs.getInt("paymentNo"));
				String paymentType = rs.getString("paymentType");
				String amount = Float.toString(rs.getFloat("amount"));
				String date = rs.getString("date");
				String aId = Integer.toString(rs.getInt("appointmentID"));
				String pId = Integer.toString(rs.getInt("patientID"));
				// Add into the html table
				output += "<tr><td><input id='hidIDUpdate'" + " name='hidIDUpdate' " + " type='hidden' value='"
						+ paymentNo + "'>" + paymentNo + "</td>";
				output += "<td>" + paymentType + "</td>";
				output += "<td>" + amount + "</td>";
				output += "<td>" + date + "</td>";
				output += "<td>" + aId + "</td>";
				output += "<td>" + pId + "</td>";
				// buttons
				output += "<td><input name='btnRemove'"
						+ "type='button' value='Remove'" + " class='btnRemove btn btn-danger'" + " data-itemid='"
						+ paymentNo + "'>" + "</td></tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the payments.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	// update payment status in appointment table-------------------------------------------
	public void updatePaymentStatus(String appointmentId) {
			try {
				Connection con = object.connect();
				
				String query = "UPDATE appointment SET paymentStatus=? WHERE aID=?";
				PreparedStatement preparedStmt = con.prepareStatement(query);
				
				preparedStmt.setInt(1, 1);
				preparedStmt.setInt(2, Integer.parseInt(appointmentId));
				
				preparedStmt.execute();
				con.close();
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
		}
	
	public String addPayment(String patientId, String appointmentId, String paymentType) {
		String output = "";
		int hosID = 0;
		float docFee = 0;
		float total;
		double hosFee = 0;

		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for inserting";
			}

			Calendar calendar = Calendar.getInstance();
			java.sql.Date dateObj = new java.sql.Date(calendar.getTime().getTime());

			// Select doctor fee and hospital id
			PreparedStatement stmt = con
					.prepareStatement("SELECT r.docFee,r.hospitalID FROM registereddoctors r, appointment a"
							+ " WHERE r.docID = a.docID and a.aID=? ");
			stmt.setInt(1, Integer.parseInt(appointmentId));
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
			
				docFee = rs.getFloat("docFee");
				hosID = rs.getInt("hospitalID");
			}

			PreparedStatement st = con
					.prepareStatement("SELECT h.hospitalFee FROM hospital h" + " WHERE  h.hospitalID = ? ");
			st.setInt(1, hosID);
			ResultSet rs2 = st.executeQuery();

			while (rs2.next()) {
				hosFee = rs2.getDouble("hospitalFee");
			}

			// payment amount calculation
			total = (float) (hosFee + docFee);

			
			String query = "insert into payment(`paymentNo`,`amount`,`paymentType`,`activeStatus`,`date`,`appointmentID`,`patientID`)"
					+ " values ( ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			preparedStmt.setInt(1, 0);
			preparedStmt.setFloat(2, total);
			preparedStmt.setString(3, paymentType);
			preparedStmt.setString(4, "T");
			preparedStmt.setDate(5, dateObj);
			preparedStmt.setInt(6, Integer.parseInt(appointmentId));
			preparedStmt.setInt(7, Integer.parseInt(patientId));

			
			preparedStmt.execute();
			con.close();
			output = "Inserted successfully";
		} catch (Exception e) {
			output = "Error while inserting";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String insertPayment(String patientId, String appointmentId, String paymentType) {
		String output;
		
		if (valObj.validateAppointmentId(appointmentId) != false && valObj.validatePatientId(patientId) != false) {
				output = addPayment(patientId, appointmentId, paymentType);

				if (output.equals("Inserted successfully")) {
					// update payment status in appointment table
					updatePaymentStatus(appointmentId);
					String newPayment = readPayment();
					output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";
				}
			} 
		else {
				output = "{\"status\":\"error\", \"data\":\"Error while updating the payment.\"}";
			}
		
		
		return output;
	}
	
	public String updatePayment(String id,String paymentType,String patientId,String appointmentId ) {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for updating";
			}
			
			String query = "UPDATE payment SET appointmentID=?,patientID=?,paymentType=? WHERE paymentNo=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			preparedStmt.setInt(1, Integer.parseInt(appointmentId));
			preparedStmt.setInt(2, Integer.parseInt(patientId));
			preparedStmt.setString(3, paymentType);
			preparedStmt.setInt(4, Integer.parseInt(id));
			
			preparedStmt.execute();
			con.close();
			String newPayment = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while updating the payment.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String deletePayment(String paymentNo) {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for deleting";
			}
			
			String query = "delete from payment where paymentNo=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			preparedStmt.setInt(1, Integer.parseInt(paymentNo));
			
			preparedStmt.execute();
			con.close();
			String newPayment = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while deleting the payment.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String readInput() {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for reading";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Payment No</th> <th>Payment Type</th><th>Amount</th>"
					+ "<th>Date</th><th>Appointment ID</th><th>Patient ID</th>" + "<th>Remove</th></tr>";

			String query = "SELECT * FROM payment ORDER BY paymentNo DESC LIMIT 1";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String paymentNo = Integer.toString(rs.getInt("paymentNo"));
				String paymentType = rs.getString("paymentType");
				String amount = Float.toString(rs.getFloat("amount"));
				String date = rs.getString("date");
				String aId = Integer.toString(rs.getInt("appointmentID"));
				String pId = Integer.toString(rs.getInt("patientID"));
				// Add into the html table
				output += "<tr><td><input id='hidIDUpdate'" + " name='hidIDUpdate' " + " type='hidden' value='"
						+ paymentNo + "'>" + paymentNo + "</td>";
				output += "<td>" + paymentType + "</td>";
				output += "<td>" + amount + "</td>";
				output += "<td>" + date + "</td>";
				output += "<td>" + aId + "</td>";
				output += "<td>" + pId + "</td>";
				// buttons
				output += "<td><input name='btnRemove'"
						+ "type='button'  value='Remove'" + " class='btnRemove btn btn-danger'" + " data-itemid='"
						+ paymentNo + "'>" + "</td></tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the payments.";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	public String insertInput(String patientId, String appointmentId, String paymentType) {
		String output;
		
		if (valObj.validateAppointmentId(appointmentId) != false && valObj.validatePatientId(patientId) != false) {
				output = addPayment(patientId, appointmentId, paymentType);

				if (output.equals("Inserted successfully")) {
					// update payment status in appointment table
					updatePaymentStatus(appointmentId);
					String newPayment = readInput();
					output = "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";
				}
			} 
		else {
				output = "{\"status\":\"error\", \"data\":\"Error while updating the payment.\"}";
			}
		
		
		return output;
	}
	

}
