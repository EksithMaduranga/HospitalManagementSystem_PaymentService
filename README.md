# HospitalManagementSystem_PaymentService
Practicle Test PAF

+ IT18110708 Kodikara K A O V

GitHub Repository Link
-----
https://github.com/odaraKodikara/HospitalManagementSystem_PaymentService.git


Setup Project
-----
1. Create new database named 'hospitaldb' in PhpMyAdmin
2. Import the sql script into PhpMyAdmin
3. Clone the project into Eclipse using the above github link
4. JRE version - jre 1.8.0_201

Used Technology
-----
+ RESTful web service: Java - JAX-RS (Jersy) on Tomcat
+ DB: MySQL
+ View: HTML, CSS, Bootstrap, Form and Grid UI design pattern
+ Client-components: jQuery, Ajax

User Validations
-----
Payment Form :
+ Check for empty form fields
+ Check appointmentId is a number
+ Check patientId is a number

Card Form :
+ Check for empty form fields
+ Check cardNo is a number
+ Check cvv is a number
+ Check paymentNo is a number
+ Check cardNo is a 16 digit value
+ Check cvv is a 3 digit value

Important Details
-----
+ There are 5 jsp pages
+ One Homepage (home.jsp)
+ Two for patient access (payment.jsp and card.jsp)
+ Two for admin access (adminPayment.jsp and adminCard.jsp)

+ Patients can only view and update the record they just added themselves.
+ Patients cannot view others payment records

+ Admins can view and change all payment records
+ Admins can remove payment and card records
+ Admins can update card details

+ Payment details are not updateable
+ Card details are updateable

HomePage
-----
![home](https://user-images.githubusercontent.com/53079775/81104316-f4b5a000-8f2f-11ea-94a0-13d0cfd29006.PNG)

Add Payment Page
-----
![payment](https://user-images.githubusercontent.com/53079775/81104674-7d344080-8f30-11ea-9d31-af2b6ae8c581.PNG)

Add Card Page
-----
![card](https://user-images.githubusercontent.com/53079775/81104709-8de4b680-8f30-11ea-8785-4c40ba6e2645.PNG)

Payment Management Page
-----
![adminPayment](https://user-images.githubusercontent.com/53079775/81104764-a05ef000-8f30-11ea-9a39-13ad99b03ef1.PNG)

Card Management Page
-----
![adminCard](https://user-images.githubusercontent.com/53079775/81104804-af45a280-8f30-11ea-9b46-dafa3d8cf177.PNG)


