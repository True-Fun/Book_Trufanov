<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>
 <%@ page import="java.sql.SQLException, java.sql.Connection, java.sql.DriverManager, connectionDB.sqliteConnection, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet, java.sql.Statement, java.sql.*" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<style>
 <%@include file="MainS.css" %>
</style>
<title>Проверка</title>
</head>
<body>
<div class="first">
      <div class="menu">
        <ul class = "ul">
        <li><a href="Main.jsp">Главная</a></li>
      <li><a href="Catalog.jsp">Каталог</a></li>
      <li><a href="RegistrationPage.jsp">Регистрация</a></li>  
      <li><a href="LoginPage.jsp">Авторизация</a></li>
      <li><a href="RulesOfUsing.jsp">Правила пользования</a></li>
      <li><a href="Feedback.jsp">Обратная связь	</a></li>
      <li class="user"><% String name=(String)session.getAttribute("LoginDB");
       if(session.getAttribute("LoginDB")==null)
       {
    	   out.print("Вы вошли как: Неавторизованный пользователь");     	   
       }
       else{
       out.print("Вы вошли как: "+name); 
       }
       %>
													</li>
     <li>   <% 
        if(request.getParameter("buttonName") != null) 
        {
        	session.invalidate();
  	    	response.sendRedirect("Main.jsp");
  	    }
   		%>
    <FORM NAME="logOut" METHOD="POST">
        <INPUT TYPE="HIDDEN" NAME="buttonName">
        <INPUT TYPE="BUTTON" VALUE="Выйти" ONCLICK="button1()">
    </FORM>
	       <SCRIPT >        
		        function button1()
		        {
		            document.logOut.buttonName.value = "yes";
		            logOut.submit();
		        }      
		    </SCRIPT>
		           									</li>
        </ul> 
    </div>
    <div class="gaga">
     <%
 sqliteConnection connect=new sqliteConnection();

  String query = "SELECT * FROM Notes"; 
  Statement statement = connect.dbConnector().createStatement();
  ResultSet rs = null;
  rs = statement.executeQuery(query);
 
  ArrayList <Integer> id = new ArrayList<Integer>();
  ArrayList <String> foto = new ArrayList<String>();
  ArrayList <String> name_book = new ArrayList<String>();
  ArrayList <String> author = new ArrayList<String>();
  ArrayList <String> description = new ArrayList<String>();
  ArrayList <String> price = new ArrayList<String>();
  while(rs.next())
  {
    id.add(rs.getInt("id"));
    foto.add(rs.getString("foto"));
    name_book.add(rs.getString("name"));
    author.add(rs.getString("author"));
        price.add(rs.getString("price"));
  }
    for(int i = 0; i<id.size();i++)
    {
        out.print("<div id=images>"+"<div class=about>"+" <img src=images/"+foto.get(i)+".png>" +"</div>"+"<br>");
		        out.print("Название Книги: <a href=Comments.jsp?id=" + id.get(i)+">" +name_book.get(i)+ "</a>"+"<br>");
        out.print("Автор: " + author.get(i)+ "</a>"+"<br>");
           out.print("Цена: " + price.get(i)+ "</a>"+"<br>"+"<hr>");
    }
    statement.close();
    rs.close();
 %>
    
 </div>

</div>
</body>
</html>