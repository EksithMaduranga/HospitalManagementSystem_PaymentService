package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import database.dbconnect;

public class Validate {
	
	dbconnect object = new dbconnect();


//validate paymentNo in card form---------------------------------------------------------------
		public Boolean validatePaymentNo(String paymentNo) {
			Boolean output = null;

			try {
				Connection con = object.connect();
				if (con == null) {
					output=false;
				}
				
				// validate paymentNo
				PreparedStatement stmt = con.prepareStatement("SELECT p.paymentNo FROM payment p" + " WHERE p.paymentNo=? ");
				stmt.setInt(1, Integer.parseInt(paymentNo));
				ResultSet result1 = stmt.executeQuery();

				if (result1.next() != false) {

					output=true;
				}
				
			} catch (Exception e) {
				output=false;
				System.err.println(e.getMessage());
			}
			return output;
		}
	
// validate appointmentid in payment form---------------------------------------------------------------
		public Boolean validateAppointmentId(String appointmentId) {

			try {
				Connection con = object.connect();
				if (con == null) {
					return false;
				}

				// validate appointmentid
				PreparedStatement stmt1 = con.prepareStatement("SELECT aID FROM appointment a" + " WHERE a.aID=? ");
				stmt1.setInt(1, Integer.parseInt(appointmentId));
				ResultSet result1 = stmt1.executeQuery();

				if (result1.next() != false) {

					return true;
				}

			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
			return true;

		}

// validate patientid in payment form-----------------------------------------------------------
		public Boolean validatePatientId(String patientId) {

			try {
				Connection con = object.connect();
				if (con == null) {
					return false;
				}

				// validate patientid
				PreparedStatement stmt2 = con.prepareStatement("SELECT pID FROM patient p" + " WHERE p.pID=? ");
				stmt2.setInt(1, Integer.parseInt(patientId));
				ResultSet result2 = stmt2.executeQuery();

				if (result2.next() != false) {

					return true;
				}

			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
			return true;

		}
		
		
}
