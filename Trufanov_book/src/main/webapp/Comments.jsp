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
<title>������ � �����</title>
</head>
<body>
<div class="first">
      <div class="menu">
        <ul class = "ul">
      <li><a href="Main.jsp">�������</a></li>
      <li><a href="Catalog.jsp">�������</a></li>
      <li><a href="RegistrationPage.jsp">�����������</a></li>  
      <li><a href="LoginPage.jsp">�����������</a></li>
      <li><a href="RulesOfUsing.jsp">������� �����������</a></li>
      <li><a href="Feedback.jsp">�������� �����	</a></li>
      <li class="user"><% String name=(String)session.getAttribute("LoginDB");
       if(session.getAttribute("LoginDB")==null)
       {
    	   out.print("�� ����� ���: ���������������� ������������");     	   
       }
       else{
       out.print("�� ����� ���: "+name); 
       }
       %>
													</li>
     <li>   <% 
        if(request.getParameter("buttonName") != null) 
        {
        	session.invalidate();
  	    	response.sendRedirect("Catalog.jsp");
  	    }
   		%>
    <FORM NAME="logOut" METHOD="POST">
        <INPUT TYPE="HIDDEN" NAME="buttonName">
        <INPUT TYPE="BUTTON" VALUE="�����" ONCLICK="button1()">
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
    <div id="block_container">
  
  <%  String id = request.getParameter("id"); 
 

 
 sqliteConnection connect=new sqliteConnection();

 String query = "SELECT * FROM Notes WHERE id="+id; 

 
 Statement statement = connect.dbConnector().createStatement();
 ResultSet rs = null;

 rs = statement.executeQuery(query);

 ArrayList <Integer> idn = new ArrayList<Integer>();
 ArrayList <String> foto = new ArrayList<String>();
 ArrayList <String> name_book = new ArrayList<String>();
 ArrayList <String> author = new ArrayList<String>();
 ArrayList <String> description = new ArrayList<String>();
 ArrayList <String> price = new ArrayList<String>();
 while(rs.next())
 {
   idn.add(rs.getInt("id"));
   foto.add(rs.getString("foto"));
   name_book.add(rs.getString("name"));
   author.add(rs.getString("author"));
   description.add(rs.getString("description"));
   price.add(rs.getString("price"));
 }
	for(int i = 0; i<idn.size();i++)
	{
		out.print("<div class=Content>");
		  	 			out.print("<div id=images>"+"<div class=about>"+" <img class = ss "+"src=images/"+foto.get(i)+".png>" +"</div>"+"<br>");
				out.print("�������� �����: " + name_book.get(i)+ "</a>"+"<br>");
		        out.print("�����: " + author.get(i)+ "</a>"+"<br>");
		        out.print("��������: " + description.get(i)+ "</a>"+"<br>");
		        out.print("����: " + price.get(i)+ "</a>"+"<br>"+"<hr>");
		    
		out.print("</div>");
	} 	
	%>
	<div class = "Contents">
<%
String query3 = "SELECT COUNT(Notes_id) FROM Comments WHERE Notes_id="+id; 
	Statement statement3 = connect.dbConnector().createStatement();
	ResultSet rs3 = null;
	rs3 = statement.executeQuery(query3);
	int count = 0;
 	if(rs3.next()) {
 	    count = rs3.getInt(1);	      
 	}%>
 	
<b>  �����������:</b> <br><%
	String query2 = "SELECT * FROM Comments WHERE Notes_id="+id; 
	Statement statement2 = connect.dbConnector().createStatement();
	ResultSet rs2 = null;
	rs2 = statement.executeQuery(query2);
	ArrayList <Integer> NotesId = new ArrayList<Integer>();
 	ArrayList <String> Author = new ArrayList<String>();
 	ArrayList <String> comment = new ArrayList<String>();	
 	while(rs2.next())
	 { 			
		NotesId.add(rs2.getInt("Notes_id"));
		Author.add(rs2.getString("name"));
		comment.add(rs2.getString("comment"));
	 }
 	for(int z = 0; z < count;z++)
	{
		
		out.print("<br>"+"�����: " + Author.get(z)+"<br>");
		out.print("-   " + comment.get(z)+"<br>"+"<hr>");
	}  	
 	
 	statement3.close();
	rs3.close();

 	statement2.close();
	rs2.close();
	
	statement.close();
	rs.close();
	
%>
<form class="reg"action="CommentsCreate" method="POST"><br><br> 
        <% 
		if(name!=null)
		{ %> �� �������� ������ ��� ����� �������:
			<%out.print(name);%>   
			<br><br>
			��� �����������  <br><input type="text"  id= "CommentsSite" name="CommentsSite"><br><br>
		 <p class="login-text">��� �� ��������� ������, ������ ������:<a id="number1">1</a>+<a id="number2">2</a> </p> 
		 <input id="ReturnSum" name="ReturnSum"  maxlength="30">
		   <INPUT TYPE="HIDDEN"  name="idn" value="<%= id %>"/>
		  <input type="submit" value="���������">
			
		<%} 
		 
		else
		{
			out.print("������������������ ������������ �� ����� ������ ������");%><br><br><%
			out.print("���� ��� ��������, �� �������� �����������  ");%><a href="RegistrationPage.jsp">�����������</a><br>			
		  <%out.print("���� ���� �������, �� ���������������  ");%><a href="LoginPage.jsp">�����������</a><br>
		  <%	
		}
		%>
    </form>
</div>

        </div>
    </div>
</body>
</html>