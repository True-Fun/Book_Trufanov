<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>
 <%@ page import="java.sql.SQLException, java.sql.Connection, java.sql.DriverManager, connectionDB.sqliteConnection, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet, java.sql.Statement, java.sql.*" %>
        
<!DOCTYPE html>
<html>
<head>
<style>
   <%@include file='MainS.css' %>
</style>
<meta charset="Cp1251">
<title>������� ��������</title>
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
  	    	response.sendRedirect( "Main.jsp");
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
   <h2> �� ������ ������ ���� �������� ���� ��� ����������</h2>
   </div>
    

    
</html>