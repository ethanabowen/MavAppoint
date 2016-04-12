package uta.mav.appoint.db.command;

import java.sql.PreparedStatement;

public class UpdatePassword extends SQLCmd{
	String newpassword;
	String userId;
	String msg;
	
	public UpdatePassword(String newpwd, String email){
		newpassword = newpwd;
		userId = email;
		msg = "Unable to update.";
	}
	
	@Override
	public void queryDB(){
		try{
			String command = "UPDATE user SET password = ? WHERE email = ?";
			System.out.println(newpassword+userId);
			PreparedStatement statement = conn.prepareStatement(command);
			statement.setString(1, newpassword);
			statement.setString(2, userId);
			statement.executeUpdate();
			
			msg = "Update Executed";
		}
		catch(Exception e){
			System.out.printf("Update Error Report : " + e.toString());
		}
	}

	@Override
	public void processResult() {
		// TODO Auto-generated method stub
		
	}

}
