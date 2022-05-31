import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import connectionDB.sqliteConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
		
		String login = request.getParameter("Login");
        String password = request.getParameter("Password");
        
        
        sqliteConnection connect =new sqliteConnection();  
        String query = "SELECT * FROM UserData WHERE LoginDB = ?";
        PreparedStatement statement;
		ResultSet rs = null;
		try {
			
			statement = connect.dbConnector().prepareStatement(query);
			statement.setString(1, login);			
			rs = statement.executeQuery();
			
			if(!rs.isClosed()) {
			while (rs.next()) {				
				
				String passwords = rs.getString("PasswordDB");				
				String email = rs.getString("EmailDB");
				
				if(passwords.equals(password) ) 
					
				{	
					SetCookie(response, email);
					SetSession(request, login, password);
				
					response.sendRedirect("Main.jsp");
							}
				else 
				{
					
		        
					response.sendRedirect("Login.jsp");;
				}
			}	
	}	
			else {
				
	        	
			response.sendRedirect("Login.jsp");}
	} 
		catch (SQLException e) 
		{
			System.out.println("ERROR!");
			e.printStackTrace();
		}		
	
	}

	private void SetCookie(HttpServletResponse response,  String email) {	
		Cookie cookieEmail = new Cookie("email_User", email);
		cookieEmail.setMaxAge(0 * 4 * 0 * 0);
		response.addCookie(cookieEmail);
		
		
	}

	private void SetSession(HttpServletRequest request, String login, String password) {
		HttpSession session = request.getSession();
		session.setAttribute("LoginDB", login);
		session.setAttribute("PasswordDB", password);
		
	}
        
}
