<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>
    <%@ page import="javax.servlet.http.Cookie,java.sql.SQLException,connectionDB.sqliteConnection, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet, java.sql.Statement, java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<style>
 <%@include file="MainS.css" %>
</style>
<title>�������� �����</title>
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
  	    	response.sendRedirect(request.getContextPath() + "/Catalog.jsp");
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
     <div class="prereg">
	<form class="reg"action="Feedback" method="POST"><br><br>
		
		 <% 
		if(name!=null)
		{ %> �� �������� ������ ��� ����� �������:
			<%out.print(name);%>   
			<br><br>
			��� ������  <br><input type="text"  id= "QuestionSite" name="QuestionSite"><br><br>
		 <p class="login-text">��� �� ��������� ������, ������ ������:<a id="number1">1</a>+<a id="number2">2</a> </p> 
		 <input id="ReturnSum" name="ReturnSum"  maxlength="30">
		  <input type="submit" value="���������" onclick=" return checkForm()">
			
		<%} 
		 
		else
		{
			out.print("������������������ ������������ �� ����� ��������� �������");%><br><br><%
			out.print("���� ��� ��������, �� �������� �����������  ");%><a href="RegistrationPage.jsp">�����������</a><br>			
		  <%out.print("���� ���� �������, �� ���������������  ");%><a href="LoginPage.jsp">�����������</a><br>
		  <%	
		}
		%>
	</form>
	<% String message = (String)request.getAttribute("alertMsg");%>
</div>
</div>
</body>
 
<!-- �������� �� nodeJS -->
<script>
let number1=Math.round(Math.random()*50+1);
let number2=Math.round(Math.random()*50+1);
sum=number1+number2;
document.getElementById("number1").innerHTML =number1;
document.getElementById("number2").innerHTML =number2;
  function checkForm()
  {
    if (document.getElementById("ReturnSum").value != sum)
  {
    alert ('����� ������ �������!');
    return false;
  }
    else if(document.getElementById("QuestionSite").value.trim() == '')
    {
        alert ('�������� ������');
        return false;
        }
}
</script>
</html>