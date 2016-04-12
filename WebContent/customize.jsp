<jsp:include page='<%=(String) request.getAttribute("includeHeader")%>' />
<div class="container">
<div><p id = "dtime" align = "right">hi</p></div>
		<p><a href="#" data-toggle="modal" data-target="#addApptType">Customize Appointments</a>
<div class="container">

    <div class="btn-group">
	<form action="appointments" method="post" name="cancel">
	<input type=hidden name=cancel_button id="cancel_button">
    <input type=hidden name=edit_button id="edit_button">
    <div class="row col-md-16  custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
             
            <th><font style="color:#e67e22" size="4">Appointment Type</th>
            <th><font style="color:#e67e22" size="4">Duration</th>
            <th class="text-center" style="color:#e67e22" size="4" >Action</th>
		</tr>
    </thead>
    <%@ page import= "uta.mav.appoint.beans.AppointmentType" %>
	<% ArrayList<AppointmentType> ats = (ArrayList<AppointmentType>)session.getAttribute("appointmenttypes");%>
            		<%@ page import= "java.util.ArrayList" %>
		    		<%@ page import= "uta.mav.appoint.beans.Appointment" %>
		    		<!-- begin processing appointments  -->
		    			<%if (ats != null){%>
							<%for (int i=0;i<ats.size();i++){ %>
							<tr>
							    						 
                				<td><font style="color:#e67e22" size="3"><%=ats.get(i).getType()%></td>
                				<td><font style="color:#e67e22" size="3"><%=ats.get(i).getDuration()%></td>  
                				<td class="text-center" style="color:#e67e22" size="3"><button type="button" id=button3<%=i%> onclick="button<%=i%>()">Cancel</button></td>
								<td class="text-center" style="color:#e67e22" size="3"><button type="button" id=button4_<%=i%> onclick="button_<%=i%>()">Edit</button></td>             			
							</tr>
						    <script> function button<%=i%>(){
										document.getElementById("cancel_button").value = "<%=ats.get(i).getType()%>"; 
										if (validate() == true){
											cancel.submit();
										}
								}</script>
							<%	}
		    			}
		    			%> 
					 <!-- end processing advisors -->	 
					</table>
				</form>
			</div>
		</div>

<form action="CustomizeServlet" method="post" onsubmit="return false;">
	<div class="modal fade" id="addApptType" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close"					
						data-dismiss="modal"></button>
					<h4 class="modal-title" id="addApptTypeLabel">
						Add Appointment Type
					</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
		 				<label for="apptypes">Appointment Type:</label>
		 				<input type="text" class="form-control" id="apptypes"
		 					placeholder="Add Class">
					</div>
					<div class="form-group">
		 				<label for="minutes">Minutes</label>
		 				<input type="number" class="form-control" id="minutes" step="5"
		 					placeholder="15">
					</div>	
					<div>
						<label id="result"><font style="color:#e67e22" size="4"></label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal"> Close 
					</button>
					<input type="submit" value="submit" onclick="javascript:FormSubmit();">
				</div>
			</div>
		</div>
	</div>
</form>

</div>

								<script> function FormSubmit(){
									var apptype = document.getElementById("apptypes").value;
									var minutes = document.getElementById("minutes").value;
									var params = ('minutes='+minutes+'&apptypes='+apptype);
									var xmlhttp;
									xmlhttp = new XMLHttpRequest();
									xmlhttp.onreadystatechange=function(){
										if (xmlhttp.readyState==4){
											document.getElementById("result").innerHTML = xmlhttp.responseText;	
										}
									}
									xmlhttp.open("POST","add_app_type",true);
									xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
									xmlhttp.setRequestHeader("Content-length",params.length);
									xmlhttp.setRequestHeader("Connection","close");
									xmlhttp.send(params);
									document.getElementById("result").innerHTML = "Adding appointment type...";
								}
								</script>
								<script>
function validate(){
		return confirm('Are you sure you want to delete this appointment?');	
	}

</script>
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
#dtime {
	color: #FF3300;
	font-size:25px;
}
</style>
	
<%@include file="jsp/views/templates/footer.jsp"%>