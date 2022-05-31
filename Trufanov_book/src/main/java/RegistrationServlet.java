import java.io.IOException;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connectionDB.sqliteConnection;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String logins = request.getParameter("Login");     
        String passwords = request.getParameter("Password");
        String UserSurname = request.getParameter("UserSurname");
        String UserName = request.getParameter("UserName");     
        String UserSex = request.getParameter("UserSex");
        String UserPhone = request.getParameter("UserPhone");
        String UserEmail = request.getParameter("UserEmail");  
        String UserCountry = request.getParameter("UserCountry");     
        String UserCity = request.getParameter("UserCity");
        String UserAge = request.getParameter("UserAge");
		
		
        try { 
        	
        	sqliteConnection connect=new sqliteConnection();  				
    		
        	String query = "INSERT INTO UserData (LoginDB, PasswordDB,SurnameDB,NameDB,SexDB,PhoneDB,EmailDB,CountryDB,CityDB,AgeDB) VALUES (?,?,?,?,?,?,?,?,?,?);";
        	PreparedStatement statement =connect.dbConnector().prepareStatement(query);
        	statement.setString(1, logins);
			statement.setString(2, passwords);		
			statement.setString(3, UserSurname);
			statement.setString(4, UserName);	
			statement.setString(5, UserSex);
			statement.setString(6, UserPhone);	
			statement.setString(7, UserEmail);
			statement.setString(8, UserCountry);	
			statement.setString(9, UserCity);
			statement.setString(10, UserAge);	
			statement.executeUpdate();       			
			 response.sendRedirect("Main.jsp"); 
			
    	}
        
    catch (SQLException throwables) 
    {

    response.sendRedirect("RegistrationPage.jsp");   
    	throwables.printStackTrace();
    	
    }
       
       
	}

}
