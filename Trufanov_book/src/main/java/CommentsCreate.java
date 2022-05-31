import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import connectionDB.sqliteConnection;


@WebServlet("/CommentsCreate")
public class CommentsCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
		
		HttpSession session = request.getSession();	

		 String Login =(String) session.getAttribute("LoginDB");
		 String Comment = request.getParameter("CommentsSite");
		 String id_notes = request.getParameter("idn"); 
		 try { 
	        	
	        	sqliteConnection connect=new sqliteConnection();  				
	    		
	        	String query = "INSERT INTO Comments (Notes_id,comment,name) VALUES (?, ?,?);";
	        	PreparedStatement statement =connect.dbConnector().prepareStatement(query);
	        	statement.setString(1, id_notes);
				statement.setString(2, Comment);		
				statement.setString(3, Login);
			
				statement.executeUpdate();  

				   response.sendRedirect("Comments.jsp?id=" + id_notes);
	    	
	        	}
	        catch (SQLException throwables) 
		 {
	       
	        	  response.sendRedirect("Comments.jsp?id=" + id_notes);	        	       	
	        }
	}

}
