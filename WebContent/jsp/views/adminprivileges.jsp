<%@page import="java.sql.*"%>
<%@ page import= "uta.mav.appoint.beans.*" %>
<%@ page import= "java.util.*" %>
		    		
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
</style>
<%
ResultSet res;
Connection conn=null;
Statement statement = null;
ArrayList<UsersSettings> UserArray = new ArrayList<UsersSettings>();


//from here to line 37 is connection part.. 
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
String jdbcUrl = "jdbc:mysql://localhost:3306/mavappointdb";
String userid = "root";
String password = "1234";
conn = DriverManager.getConnection(jdbcUrl,userid,password);
}
catch (Exception e){
    System.out.println(e.toString());
}
///////////////////////////////////////////////////////////////////////////////////////////////
////////////////from this point we are creating connection and populating the data/////////////
///////////////////////////////////////////////////////////////////////////////////////////////


			String query = "Select * from user";
			statement = conn.createStatement();
			res = statement.executeQuery(query);//what ever results getting is strored in result set
			while(res.next())
			{
				UsersSettings usersettings = new UsersSettings();//this is bean 
				usersettings.setEmail(res.getString("EMAIL"));
				usersettings.setPassword(res.getString("PASSWORD"));
				usersettings.setStudentid(res.getInt("USERID"));
				usersettings.setValidate(res.getString("VALIDATED"));
				usersettings.setRole(res.getString("ROLE"));
				UserArray.add(usersettings);
			}
%>

<div class="container">
    <div class="btn-group">
	<form action="appointments" method="get" >
	<input type=hidden name=cancel_button id="cancel_button">
    <input type=hidden name=edit_button id="edit_button">
    <div class="row col-md-16  custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
            <th>Sr No</th>
            <th>Email</th>
			<th>Role</th>
			<th>Edit</th>
			<th>Delete</th>
		    <th class="text-center">Action</th>
        </tr>
    </thead>
    <tbody>
   <% ArrayList<UsersSettings> tempArray = UserArray;
   if (tempArray != null){
	   for (int i=0;i<tempArray.size();i++){
	   
	   %>
		    <tr>
		  	<td><%=i%></td>
 		  	<td><%=tempArray.get(i).getEmail()%></td>
 	        <td><%=tempArray.get(i).getRole()%></td>
			<td><%=tempArray.get(i).getValidate()%></td>
			<td><%=tempArray.get(i).getStudentid()%></td>
			<td class="text-center"><a href="http://localhost:8080/MavAppoint/appointments?nikunj=<%=tempArray.get(i).getRole()%>">Cancel</a></td>
			<td class="text-center"><button type="button" id=button2_<%=i%> onclick="button_<%=tempArray.get(i).getStudentid()%>()">Edit</button></td>
			<td class="text-center"><button type="button" id=button3_<%=i%> onclick="button__<%=tempArray.get(i).getStudentid()%>()">Email</button></td>
		    </tr>

   		<%}//for loop close bracket
	   }//if close bracket
   %>
    </tbody>
		    		<!-- begin processing appointments  -->
		    		
						 <!-- end processing advisors -->	 
					</table>
					
 <% ArrayList<UsersSettings> tempArraynew = UserArray;
   if (tempArray != null){
	   for (int i=0;i<tempArray.size();i++){
	   %>
  Email:<br>
  <input type="text" name="Email" value="<%=tempArraynew.get(i).getEmail()%>"><br>
  Role:<br>
    <input type="text" name="Role" value="<%=tempArraynew.get(i).getRole()%>"><br>
   		<%}//for loop close bracket
	   }//if close bracket
   %>
<input type="submit" value="Update" onclick="window.location='register.jsp';" />  
				</form>
				<%String emailvaue=request.getParameter("Email"); %>
				
			</div>
		</div>