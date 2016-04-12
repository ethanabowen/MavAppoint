<%@ include file="jsp/views/templates/header.jsp" %>
<script type=text/javascript>
	tday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
	tmonth=new Array("January","February","March","April","May","June","July","August","September","October","November","December");

	function GetClock(){
		var d=new Date();
		var nday=d.getDay(),nmonth=d.getMonth(),ndate=d.getDate(),nyear=d.getYear();
		if(nyear<1000) nyear+=1900;
		var nhour=d.getHours(),nmin=d.getMinutes(),nsec=d.getSeconds(),ap;

		if(nhour==0){ap=" AM";nhour=12;}
		else if(nhour<12){ap=" AM";}
		else if(nhour==12){ap=" PM";}
		else if(nhour>12){ap=" PM";nhour-=12;}

		if(nmin<=9) nmin="0"+nmin;
		if(nsec<=9) nsec="0"+nsec;

		document.getElementById('dtime').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+ap+"";
		}

		window.onload=function(){
		GetClock();
		setInterval(GetClock,1000);
		}
</script>
<style>
.panel-heading {
    padding: 5px 15px;
}

.panel-footer {
	padding: 1px 15px;
	color: #A0A0A0;
}
#dtime {
	color: #FF3300;
    bottom : 60px;
    height : 40px;
    margin-top : 40px;
    padding-left:1000px;
    font-size:18px;
}
#links{
bottom : 0 !important;
display:block;
align:center;
font-size:20px;
color:#FF3300 !important;
}


.profile-img {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}
</style>
<!DOCTYPE html>
 <div class="container" style="margin-top:40px">
		
		<div class="row">
					<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Sign in to continue</strong>
					</div>
					<div class="panel-body">
						<form role="form" action="#" method="POST">
							<fieldset>
								<div class="row">
									<div class="center-block">
										<img class="profile-img"
											src="img/mavblue.jpg" alt="">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-user"></i>
												</span> 
												<input type="text" class="form-control" name=emailAddress placeholder="yourname@mavs.uta.edu">
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-lock"></i>
												</span>
												<input type="password" class="form-control" name=password>
											</div>
										</div>
										<div class="form-group">
											<input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign in">
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
					<div class="panel-footer ">
					</div>
                </div>
			</div>
		</div> 
		
	</div>
	<div id="dtime"></div>
	<div id="links">
	<strong>
	<a href="http://www.uta.edu/uta/">UTA Home</a>|
	<a href = "https://sis-portal-prod.uta.edu/psp/AEPPRD/EMPLOYEE/EMPL/h/?tab=PAPP_GUEST">MyMav</a>|
	<a href="https://outlook.office.com/owa/?realm=mavs.uta.edu">Student Mail</a>|
	<a href="http://cse.uta.edu/">CSE</a>|
	<a href="https://www.uta.edu/ee/">EE</a>|
	<a href="bug.jsp">Report Bug</a>|
	<a href="feedback.jsp">Provide FeedBack</a>|
	<a href="instructions.jsp">Instructions</a>
	</strong>
	</div>


<%@ include file="jsp/views/templates/footer.jsp" %>