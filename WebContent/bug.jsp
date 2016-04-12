<%@include file="jsp/views/templates/header.jsp"%>
	<div class="container">
	<form action="bug" method="post">
	<div class="row">
	<div class="col-md-4 col-lg-4">
		<div class="form-group">
			<label for="userid">User ID</label>
			 <input type="text" class="form-control" id=userid name = userid
			 placeholder="1000xxxxxx or 6000xxxxxx">
			 	
			 <label for="emailAddress">Email Address</label>
			 <input type="text" class="form-control" id=emailAddress name = emailAddress
			 placeholder="firstname.lastname@mavs.uta.edu">
			 
			 <label for="firstName">First Name</label>
			 <input type="text" class="form-control" id=fname name = fname>
			 
			 <label for="lastName">Last Name</label>
			 <input type="text" class="form-control" id=lname name = lname>
			 <label for="description">Description</label>
			 <textarea rows="4" cols="50" class="form-control" id=tarea name = tarea placeholder="please describe your problem here">

			</textarea>
		</div>
	</div>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button></p>	
<%@include file="jsp/views/templates/footer.jsp"%>