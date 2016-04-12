<jsp:include page='<%=(String) request.getAttribute("includeHeader")%>' />
<style>
.custab{
    border: 1px solid #ccc;
    padding: 5px;
    margin: 5% 0;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    background-color:#e67e22;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 0.5s;
    }
    #dtime {
	color: #FF3300;
	font-size:25px;
}
</style>

<div class="container">
<div><p id = "dtime" align = "right">hi</p></div>
    <div class="btn-group">
	<form action="appointments" method="post" name="cancel">
	<input type=hidden name=cancel_button id="cancel_button">
    <input type=hidden name=edit_button id="edit_button">
    <div class="row col-md-16  custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
            <th>Advisor Name</th>
            <th>Appointment Date</th>
			<th>Start Time</th>
			<th>End Time</th>
			<th>Advising Type</th>
			<th>Advising Email</th>
			<th>Description</th>
			<th>UTA Student ID</th>
            <th>Student Email</th>
            <th class="text-center">Action</th>
        </tr>
    </thead>
            		<%@ page import= "java.util.ArrayList" %>
		    		<%@ page import= "uta.mav.appoint.beans.Appointment" %>
		    		<!-- begin processing appointments  -->
		    		<% ArrayList<Appointment> array = (ArrayList<Appointment>)session.getAttribute("appointments");
		    			if (array != null){%>
							<%for (int i=0;i<array.size();i++){ %>
							<tr>
                				<td><%=array.get(i).getPname()%></td>
                				<td><%=array.get(i).getAdvisingDate()%></td>
								<td><%=array.get(i).getAdvisingStartTime()%></td>
								<td><%=array.get(i).getAdvisingEndTime()%></td>
								<td><%=array.get(i).getAppointmentType()%></td>
								<td><%=array.get(i).getAdvisorEmail()%></td>
								<td><%=array.get(i).getDescription() %></td>
								<td><%=array.get(i).getStudentid()%></td>
								<td><%=array.get(i).getStudentEmail()%></td>
								<td class="text-center"><button type="button" id=button1<%=i%> onclick="button<%=i%>()">Cancel</button></td>
								<td class="text-center"><button type="button" id=button2_<%=i%> onclick="button_<%=i%>()">Edit</button></td>
								<td class="text-center"><button type="button" id=button3_<%=i%> onclick="button__<%=i%>()">Email</button></td>
							</tr>
								<script> function button<%=i%>(){
										document.getElementById("cancel_button").value = "<%=array.get(i).getAppointmentId()%>"; 
										if (validate() == true){
											cancel.submit();
										}
								}</script>
								<script> function button_<%=i%>(){
										document.getElementById("id2").value = "<%=array.get(i).getAppointmentId()%>"; 
										document.getElementById("apptype").value = "<%=array.get(i).getAppointmentType()%>"; 
										document.getElementById("date").value = "<%=array.get(i).getAdvisingDate()%>";
										document.getElementById("start").value = "<%=array.get(i).getAdvisingStartTime()%>"; 
										document.getElementById("end").value = "<%=array.get(i).getAdvisingEndTime()%>"; 
										document.getElementById("pname").value = "<%=array.get(i).getPname()%>"; 
										document.getElementById("description").value = "<%=array.get(i).getDescription()%>";
										$('#addApptModal').modal();
								}</script>
								<script> function button__<%=i%>(){
										document.getElementById("to").value = "<%=array.get(i).getStudentEmail()%>";
										document.getElementById("content").value = "<%=array.get(i).getAppointmentType()%>" + "\t" + "<%=array.get(i).getAdvisingDate()%>" + "\t" + "<%=array.get(i).getAdvisingStartTime()%>" + "\t" + "<%=array.get(i).getAdvisingEndTime()%>" + "\t" + "<%=array.get(i).getPname()%>" + "\t" + "<%=array.get(i).getDescription()%>";
										$('#emailModal').modal();
								}</script>
								<script> function emailSend(){
									var content = document.getElementById("content").value;
									var to = document.getElementById("to").value;
									var body = document.getElementById("email").value;
									var subject = document.getElementById("subject").value;
									var params = ('to='+to+'&body='+body+'&subject='+subject+'&content='+content);
									var xmlhttp;
									xmlhttp = new XMLHttpRequest();
									xmlhttp.onreadystatechange=function(){
										if (xmlhttp.readyState==4){
											alert("Email sent.");	
											return false;
										}
									}
									xmlhttp.open("POST","notify",true);
									xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
									xmlhttp.setRequestHeader("Content-length",params.length);
									xmlhttp.setRequestHeader("Connection","close");
									xmlhttp.send(params);
								}
								</script>
								</div>
						<%	}
		    			}
		    			%> 
					 <!-- end processing advisors -->	 
					</table>
				</form>
			</div>
		</div>
	<form name=addAppt action="manage" onsubmit="return validate2()" method="post">
	<div class="modal fade" id="addApptModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id=addApptTypeLabel">Update Appointment</h4>
				</div>
				<div class="modal-body">
						<input type="hidden" name=id2 id="id2" readonly>
						<b>Type:</b><input type="label" name=apptype id="apptype" readonly><br>
						<b>Date:    </b><input type="label" name=date id="date" readonly><br>
						<b>Start:   </b><input type="label" name=start id="start" readonly><br>
						<b>End:     </b><input type="label" name=end id="end" readonly><br>
						<b>Advisor: </b><input type="label" name=pname id="pname" readonly><br>
						<b>UTA Student ID: </b><br><input type="text" name=studentid id="studentid"><br>
						<b>Description:</b><br><textarea rows=4 columns="10" name=description id="description"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal"> Close 
					</button>
					<input type="submit" value="Submit">
				</div>
			</div>
		</div>
	</div>
	</form>
<form name=emailSubmit onsubmit="return emailSend()">
<div class="modal fade" id="emailModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Send message</h4>
				</div>
				<div class="modal-body">
						<b>Subject:</b><br><input type=text name=subject id="subject"><br>
						<b>Message:</b><br><textarea rows=4 columns="10" name=email id="email"></textarea><br>
						<input type=hidden name=content id="content"><br>
						<input type=hidden name=to id="to"><br>
						</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal"> Close 
					</button>
					<input type="submit" value="Submit">
				</div>
			</div>
		</div>
	</div>
</form>
<script>
function validate(){
		return confirm('Are you sure you want to delete this appointment?');	
	}
function validate2(){
		if (document.getElementById("studentid").value == ""){
			alert("Student ID is required.");
			return false;
		}
		if (document.getElementById("description").value.length > 100){
			alert("Description is too long, please shorten it.");
			return false;
		}
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
<%@include file="jsp/views/templates/footer.jsp" %>