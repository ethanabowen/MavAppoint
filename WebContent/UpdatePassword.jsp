
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.security.MessageDigest"%>
<%@ page import="uta.mav.appoint.beans.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.security.Key"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>

<%!public String Encrpyt(String password) {
		String encrpt = "";
		try {
			String text = password;
			String key = "Bar12345Bar12345"; // 128 bit key
			// Create key and cipher
			Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES");
			// encrypt the text
			cipher.init(Cipher.ENCRYPT_MODE, aesKey);
			byte[] encrypted = cipher.doFinal(text.getBytes());
			System.err.println(new String(encrypted));
			encrpt = new String(encrypted);
			// decrypt the text
			cipher.init(Cipher.DECRYPT_MODE, aesKey);
			String decrypted = new String(cipher.doFinal(encrypted));
			System.err.println(decrypted);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return encrpt;
	}

	byte[] digest;
	public String getHash(String stringToHash) {
		
		//hexString is used to store the hash
		StringBuffer hexString = new StringBuffer();
		//get a byte array of the String to be hashed
		byte[] buffer = stringToHash.getBytes();
		try {
			//get and instance of the MD5 MessageDigest
			MessageDigest alg = MessageDigest.getInstance("MD5");
			//Make sure the Digest is clear
			alg.reset();
			//Populate the Digest with the byte array
			alg.update(buffer);
			//Create the MD5 Hash
			digest = alg.digest();
			//Now we need to pull out each char of the byte array into the StringBuffer
		} catch (Exception e) {
			//Need to catch some exceptions
		}
		//And return the hex hash value as a String
		return asHex(digest);
	}

	private String asHex(byte hash[]) {
		StringBuffer buf = new StringBuffer(hash.length * 2);
		int i;
		for (i = 0; i < hash.length; i++) {
			if (((int) hash[i] & 0xff) < 0x10)
				buf.append("0");
			buf.append(Long.toString((int) hash[i] & 0xff, 16));
		}
		return buf.toString();
	}%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="js/strength.js"></script>
<script type="text/javascript" src="js/js.js"></script>

<script type="text/javascript">
	function chkPasswordStrength(txtpass, strenghtMsg, errorMsg) {
		var desc = new Array();
		desc[0] = "Very Weak";
		desc[1] = "Weak";
		desc[2] = "Better";
		desc[3] = "Medium";
		desc[4] = "Strong";
		desc[5] = "Strongest";

		errorMsg.innerHTML = ''
		var score = 0;

		//if txtpass bigger than 6 give 1 point
		if (txtpass.length > 6)
			score++;

		//if txtpass has both lower and uppercase characters give 1 point
		if ((txtpass.match(/[a-z]/)) && (txtpass.match(/[A-Z]/)))
			score++;

		//if txtpass has at least one number give 1 point
		if (txtpass.match(/\d+/))
			score++;

		//if txtpass has at least one special caracther give 1 point
		if (txtpass.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/))
			score++;

		//if txtpass bigger than 12 give another 1 point
		if (txtpass.length > 12)
			score++;

		strenghtMsg.innerHTML = desc[score];
		strenghtMsg.className = "strength" + score;

		if (txtpass.length < 6) {
			errorMsg.innerHTML = "Password Should be Minimum 6 Characters"
			errorMsg.className = "errorclass"
		}
	}
	$(document).ready(function($) {

		$('#NewPassword').strength({
			strengthClass : 'strength',
			strengthMeterClass : 'strength_meter',
			strengthButtonClass : 'button_strength',
			strengthButtonText : 'Show Password',
			strengthButtonTextToggle : 'Hide Password'
		});

	});
</script>
<link rel="stylesheet" type="text/css" href="js/strength.css">
</head>
<body>
	<div class="container">
		<form form id="myform" action="#" method="get">
			<div class="row">
				<div class="col-md-4 col-lg-4">
					<div class="form-group">

						<label for="emailAddress">Email Address</label><br> <input
							type="text" class="form-control" id=emailAddress
							name=emailAddress placeholder="firstname.lastname@mavs.uta.edu"><br>

						<label for="TempPassword">Temp Password</label><br> <input
							type="password" class="form-control" id=TempPassword
							name=temppassword><br> <label for="NewPassword">New
							Password</label><br> <input type="password" class="form-control"
							id=NewPassword name=newpassword><br>
					</div>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			</p>
		</form>
</body>
<%
	String Email = request.getParameter("emailAddress");
	String TempPasswpord = request.getParameter("temppassword");
	String NewPassword = request.getParameter("newpassword");

	ResultSet res;
	Connection conn = null;
	Statement statement = null;

	//from here to line 37 is connection part.. 
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String jdbcUrl = "jdbc:mysql://localhost:3306/mavappointdb";
		String userid = "root";
		String password = "xlx@123";
		conn = DriverManager.getConnection(jdbcUrl, userid, password);
	} catch (Exception e) {
		System.out.println(e.toString());
	}
	Boolean check = false;
	if (TempPasswpord != null && NewPassword != null && Email != null) {
		//Check temp password
		String command = "Select * from user where VALIDATED=0 and PASSWORD='" + TempPasswpord + "' and Email='"
				+ Email + "'";
		System.out.println(command);
		statement = conn.prepareStatement(command);
		check = statement.execute(command);
		if (check) {
			System.out.println("Insed and check");
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/YYYY");
			String Todaysdate = format.format(date);
			String encrptedPassword = getHash(NewPassword);
			System.out.println(encrptedPassword);
			String commandUpdate = "UPDATE user SET PASSWORD='" + encrptedPassword
					+ "',PasswordCheck='No', PassWordDate='" + Todaysdate + "' where Email='" + Email + "'";
			System.out.println(commandUpdate);
			statement = conn.prepareStatement(commandUpdate);
			check = statement.execute(commandUpdate);
		}
	}
%>
</html>