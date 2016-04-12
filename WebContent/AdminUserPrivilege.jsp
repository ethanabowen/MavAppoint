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
table {
	width: 70%;
	height:70%;
    border-collapse: collapse;
}
table, th, td {
    border: 1px solid black;
}
</style>
<script>
$('#delete').click(function() {
	setTimeout(function()
			{
    location.reload();
    },5000)
});
$('#UpdateValue').click(function() {
	setTimeout(function()
			{
    location.reload();
    },5000)
});
</script>
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
String password = "xlx@123";
conn = DriverManager.getConnection(jdbcUrl,userid,password);
}
catch (Exception e){
    System.out.println(e.toString());
}
///////////////////////////////////////////////////////////////////////////////////////////////
////////////////from this point we are creating connection and populating the data/////////////
///////////////////////////////////////////////////////////////////////////////////////////////


			String query = "Select * from user where VALIDATED=1";
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
	<form action="#" method="get" >
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
	    </tr>
    </thead>
    <tbody>
   <% ArrayList<UsersSettings> tempArray = UserArray;
   if (tempArray != null){
	   for (int i=0;i<tempArray.size();i++){
	   
	   %>
		    <tr>
		  	<td><%=i+1%></td>
 		  	<td><%=tempArray.get(i).getEmail()%></td>
 	        <td><%=tempArray.get(i).getRole()%></td>
			<td class="text-center"><a href="http://localhost:8080/MavAppoint/AdminUserPrivilege.jsp?Update=<%=tempArray.get(i).getStudentid()%>">Update</a></td>
			<td class="text-center" id="delete"><a href="http://localhost:8080/MavAppoint/AdminUserPrivilege.jsp?Delete=<%=tempArray.get(i).getStudentid()%>">Delete</a></td>
		    </tr>
   		<%}//for loop close bracket
	   }//if close bracket
   %>
    </tbody>
		    		<!-- begin processing appointments  -->
		    <%
		    String UpdateId=request.getParameter("Update");
   			String Deleteid=request.getParameter("Delete");	
   			String command ="";
   			String EmailUpdate=request.getParameter("Email");
   			String RoleUpdate=request.getParameter("Role");
   			if(Deleteid!=null){
   			//this command is for delete
		    }
   			if(EmailUpdate!=null && RoleUpdate!=null)
   			{
   				System.out.print("kuch hua");
   			 	command = "UPDATE user SET ROLE='"+RoleUpdate+"',EMAIL='"+EmailUpdate+"' WHERE USERID='"+UpdateId+"'";
		    	statement=conn.prepareStatement(command);
		    	statement.executeUpdate(command);
			}
				if(UpdateId!=null)
   				{
   					System.out.println("Update hua");
   					String query1 = "Select * from user where USERID="+UpdateId;
   					statement = conn.createStatement();
   					res = statement.executeQuery(query1);//what ever results getting is strored in result set
					UsersSettings usersettings = new UsersSettings();//this is bean 
   					while(res.next())
   					{
   						usersettings.setEmail(res.getString("EMAIL"));
   						usersettings.setPassword(res.getString("PASSWORD"));
   						usersettings.setStudentid(res.getInt("USERID"));
   						usersettings.setValidate(res.getString("VALIDATED"));
   						usersettings.setRole(res.getString("ROLE"));
   					}
			%>
  				Email:<br>
  				<input type="hidden" name="Update" value="<%=usersettings.getStudentid()%>">
  				<input type="text" name="Email" value="<%=usersettings.getEmail()%>"><br>
  				Role:<br>
				<select name="Role" >
  				<option value="Admin">admin</option>
  				<option value="advisor">Advisor</option>
  				<option value="student">Student</option>
				</select> <br>
				<input type="submit" value="Update" id="UpdateValue" />  
				</form>
			<%
   				}
				%>
		    		
						 <!-- end processing advisors -->	 
					</table>

			</div>
		</div>
