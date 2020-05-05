package com;

import java.sql.*;
import com.Validate;
import database.dbconnect;

public class Card {
	dbconnect object = new dbconnect();
	Validate valObj = new Validate();
	

	public String addCard(String cardNo, String holderName, String expiryDate, String cvv, String paymentNo) {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database";
			}

			// create a prepared statement
			String query = "insert into card(`cardNo`,`cardHolderName`,`expiryDate`,`cvv`,`paymentNo`)" + " values ( ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, cardNo);
			preparedStmt.setString(2, holderName);
			preparedStmt.setString(3, expiryDate);
			preparedStmt.setInt(4, Integer.parseInt(cvv));
			preparedStmt.setInt(5, Integer.parseInt(paymentNo));

			// execute the statement
			preparedStmt.execute();
			con.close();
			String newCard = readCard();
			output = "{\"status\":\"success\", \"data\": \"" + newCard + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the card.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	public String insertCard(String cardNo, String holderName, String expiryDate, String cvv, String paymentNo) {
		String output;
		
			if (valObj.validatePaymentNo(paymentNo) != false) {
				output = addCard(cardNo, holderName, expiryDate,cvv,paymentNo);

			} else {
				output = "{\"status\":\"error\", \"data\":\"Error while inserting the card.\"}";
			}
		
		return output;
	}

	public String readCard() {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Card No</th>" + "<th>Payment No</th><th>Card Holder Name</th>"
					+ "<th>Expiry Date</th>" + "<th>CVV</th>" + "<th>Update</th><th>Remove</th></tr>";
			String query = "select * from card";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String id = rs.getString("id");
				String cardNo = rs.getString("cardNo");
				String paymentNo = Integer.toString(rs.getInt("paymentNo"));
				String holderName = rs.getString("cardHolderName");
				String expiryDate = rs.getString("expiryDate");
				String cvv = Integer.toString(rs.getInt("cvv"));
				// Add into the html table
				output += "<tr><td><input id='hidIDUpdate'" + " name='hidIDUpdate' " + " type='hidden' value='"
						+ cardNo + "'>" + cardNo + "</td>";
				output += "<td>" + paymentNo + "</td>";
				output += "<td>" + holderName + "</td>";
				output += "<td>" + expiryDate + "</td>";
				output += "<td>" + cvv + "</td>";
				// buttons
				output += "<td><input name='btnUpdate'" + " type='button' value='Update'"
						+ "class='btnUpdate btn btn-secondary'></td>" + "<td><input name='btnRemove'"
						+ "type='button' value='Remove'" + " class='btnRemove btn btn-danger'" + " data-itemid='"
						+ id + "'>" + "</td></tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the card details.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String updateCard(String cardNo, String holderName, String expiryDate, String cvv) {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE card SET cardHolderName=?,expiryDate=?,cvv=? WHERE cardNo=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, holderName);
			preparedStmt.setString(2, expiryDate);
			preparedStmt.setInt(3, Integer.parseInt(cvv));
			preparedStmt.setString(4, cardNo);
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newItems = readCard();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while updating the card.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String deleteCard(String id) {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from card where id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(id));
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newItems = readCard();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while deleting the card.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String readInput() {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Card No</th>" + "<th>Payment No</th><th>Card Holder Name</th>"
					+ "<th>Expiry Date</th>" + "<th>CVV</th>" + "<th>Update</th></tr>";
			String query = "SELECT * FROM card ORDER BY id DESC LIMIT 1";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String cardNo = rs.getString("cardNo");
				String paymentNo = Integer.toString(rs.getInt("paymentNo"));
				String holderName = rs.getString("cardHolderName");
				String expiryDate = rs.getString("expiryDate");
				String cvv = Integer.toString(rs.getInt("cvv"));
				// Add into the html table
				output += "<tr><td><input id='hidIDUpdate'" + " name='hidIDUpdate' " + " type='hidden' value='"
						+ cardNo + "'>" + cardNo + "</td>";
				output += "<td>" + paymentNo + "</td>";
				output += "<td>" + holderName + "</td>";
				output += "<td>" + expiryDate + "</td>";
				output += "<td>" + cvv + "</td>";
				// buttons
				output += "<td><input name='btnUpdate'" + " type='button' value='Update'"
						+ "class='btnUpdate btn btn-secondary'></td>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the card details.";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	public String addInput(String cardNo, String holderName, String expiryDate, String cvv, String paymentNo) {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database";
			}

			// create a prepared statement
			String query = "insert into card(`cardNo`,`cardHolderName`,`expiryDate`,`cvv`,`paymentNo`)" + " values ( ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, cardNo);
			preparedStmt.setString(2, holderName);
			preparedStmt.setString(3, expiryDate);
			preparedStmt.setInt(4, Integer.parseInt(cvv));
			preparedStmt.setInt(5, Integer.parseInt(paymentNo));

			// execute the statement
			preparedStmt.execute();
			con.close();
			String newCard = readInput();
			output = "{\"status\":\"success\", \"data\": \"" + newCard + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the card.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	public String insertInput(String cardNo, String holderName, String expiryDate, String cvv, String paymentNo) {
		String output;
		
			if (valObj.validatePaymentNo(paymentNo) != false) {
				output = addInput(cardNo, holderName, expiryDate,cvv,paymentNo);

			} else {
				output = "{\"status\":\"error\", \"data\":\"Error while inserting the card.\"}";
			}
		
		return output;
	}
	
	public String updateInput(String cardNo, String holderName, String expiryDate, String cvv) {
		String output = "";
		try {
			Connection con = object.connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE card SET cardHolderName=?,expiryDate=?,cvv=? WHERE cardNo=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, holderName);
			preparedStmt.setString(2, expiryDate);
			preparedStmt.setInt(3, Integer.parseInt(cvv));
			preparedStmt.setString(4, cardNo);
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newItems = readInput();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while updating the card.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

}

