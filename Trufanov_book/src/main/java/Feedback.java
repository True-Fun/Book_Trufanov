import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import connectionDB.sqliteConnection;

@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
		
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
        String cookieName = "email_User";
        Cookie cookie = null;
        if(cookies !=null) {
            for(Cookie c: cookies) {
                if(cookieName.equals(c.getName())) {
                    cookie = c;
                    break;
                }
            }
        }
		System.out.println(cookie.getValue());
		 String Question = request.getParameter("QuestionSite");
		 String Login =(String) session.getAttribute("LoginDB");
		 String Email = (String) cookie.getValue();
		
		 try { 
	        	
			 sqliteConnection connect=new sqliteConnection();  				
	    		
	        	String query = "INSERT INTO UserQuestion (LoginDB, QuestionDB,EmailDB) VALUES (?, ?,?);";
	        	PreparedStatement statement =connect.dbConnector().prepareStatement(query);
	        	statement.setString(1, Login);
				statement.setString(2, Question);				
				statement.setString(3, Email);		
				
				statement.executeUpdate();    
				 response.sendRedirect("Feedback.jsp");	   
	    	
	        	}
	        catch (SQLException throwables) 
	        {
	             	
	        	  response.sendRedirect("Feedback.jsp");	        	
	        }
	}

}
