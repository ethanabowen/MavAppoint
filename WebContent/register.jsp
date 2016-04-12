<%@include file="jsp/views/templates/header.jsp"%>
	<div class="container">
	<form action="register" method="post">
	<div class="row">
	<div class="col-md-4 col-lg-4">
		<div class="form-group">
			<label for="userid">User ID</label>
			 <input type="text" class="form-control" id=userid name = userid
			 placeholder="1000xxxxxx or 6000xxxxxx">
			 	
			 <label for="emailAddress">Email Address</label>
			 <input type="text" class="form-control" id=emailAddress name = emailAddress
			 placeholder="firstname.lastname@mavs.uta.edu">
			 
		<!-- <label for="password">Password</label>
			 <input type="password" class="form-control" id=password name = password>
			 
			 <label for="repeatPassword">Repeat Password</label>
			 <input type="password" class="form-control" id=repeatPassword>-->
		</div>
	</div>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button></p>	
<%@include file="jsp/views/templates/footer.jsp"%>