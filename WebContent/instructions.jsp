<%@include file="jsp/views/templates/header.jsp"%>
	<div class="container">
	<form action="#" method="post">
			<div class="form-group">
			<label for="userid">Instructions</label>
			<strong>
			 <ol id="list1">
			 <li>MavAppoint is a web application that provides interaction between advisors and students.</li>
			 <li>Student can login with his credentials and can schedule an appointment by clicking on the advising tab</li>
			 <li>Student can view his/her list of scheduled appointments by clicking on appointments tab.</li>
			 <li>Student can cancel the appointment by clicking on the cancel button.</li>
			<li>Student can edit the appointment by clicking on the edit button.</li>
			<li>Student can get the appointment details via email by clicking on the email button.</li>
			<li>Advisor can login with their credentials and can view his/her scheduled appointments by clicking on appointments tab.</li>
			<li>Advisor can view his/her available time slots for students by clicking on show schedule tab.</li>
			<li>Advisor can customize (add appointment types) by clicking on customize settings.</li>
			<li>Admin can login with his/her credentials and can register new advisor.</li>
			 
			 </ol>
			 </strong>
			</div>	
	<style>
	.form-group{
	color:#ffffff;
	font-size:24px;
	}
	</style>
<%@include file="jsp/views/templates/footer.jsp"%>